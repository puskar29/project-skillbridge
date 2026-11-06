/**
 * Signup form behaviour:
 *  - switches between Student and Organizer field groups
 *  - disables the hidden group so its fields are not submitted
 *  - validates required fields, email, password and terms
 *  - shows / hides passwords
 */
(function () {
    "use strict";

    const form = document.getElementById("signupForm");
    if (!form) {
        return;
    }

    /**
     * Keep this disabled so registration posts to the backend.
     */
    const CLIENT_ONLY_MODE = false;

    const roleSelect = form.querySelector('select[name="role"]');
    const panels = form.querySelectorAll("[data-role-panel]");
    const subtitle = document.getElementById("signup-subtitle");
    const submitBtn = document.getElementById("signup-submit");
    const passwordInput = document.getElementById("password");

    const ROLE_COPY = {
        STUDENT: {
            subtitle: "Join SkillBridge as a student to discover opportunities",
            submit: "Create Student Account"
        },
        ORGANIZER: {
            subtitle: "Join SkillBridge as an organizer to post opportunities",
            submit: "Create Organizer Account"
        }
    };

    const EMAIL_RE = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    const URL_RE = /^https?:\/\/.+/i;

    /* ---------------------------------------------------------
       Role switching
       --------------------------------------------------------- */

    function getRole() {
        return roleSelect ? roleSelect.value : "STUDENT";
    }

    function errorEl(field) {
        return document.getElementById(field.id + "-error");
    }

    function clearError(field) {
        const error = errorEl(field);
        if (error) {
            error.textContent = "";
        }
        const wrap = field.closest(".field");
        if (wrap) {
            wrap.classList.remove("has-error");
        }
    }

    function showError(field, message) {
        const error = errorEl(field);
        if (error) {
            error.textContent = message;
        }
        const wrap = field.closest(".field");
        if (wrap) {
            wrap.classList.add("has-error");
        }
    }

    function setRole(role) {
        panels.forEach(function (panel) {
            const active = panel.dataset.rolePanel === role;

            panel.classList.toggle("is-hidden", !active);
            panel.setAttribute("aria-hidden", String(!active));

            // Disabled fields are ignored by the browser on submit, so the
            // organizer fields are not sent when signing up as a student.
            panel.querySelectorAll("input, select, textarea").forEach(function (field) {
                field.disabled = !active;
                if (!active) {
                    clearError(field);
                }
            });
        });

        const copy = ROLE_COPY[role] || ROLE_COPY.STUDENT;
        if (subtitle) {
            subtitle.textContent = copy.subtitle;
        }
        if (submitBtn) {
            submitBtn.textContent = copy.submit;
        }
    }

    if (roleSelect) {
        roleSelect.addEventListener("change", function () {
            setRole(roleSelect.value);
        });
    }

    /* ---------------------------------------------------------
       Validation
       --------------------------------------------------------- */

    function validateField(field) {
        if (field.disabled) {
            return true;
        }

        const value = (field.value || "").trim();

        if (field.type === "checkbox") {
            if (field.required && !field.checked) {
                showError(field, "Please accept the terms to continue.");
                return false;
            }
            clearError(field);
            return true;
        }

        if (field.required && !value) {
            showError(field, "This field is required.");
            return false;
        }

        // Optional fields are valid when empty.
        if (!value) {
            clearError(field);
            return true;
        }

        if (field.type === "email" && !EMAIL_RE.test(value)) {
            showError(field, "Please enter a valid email address.");
            return false;
        }

        if (field.type === "url" && !URL_RE.test(value)) {
            showError(field, "Please enter a valid URL starting with http:// or https://.");
            return false;
        }

        if (field.id === "password" && value.length < 8) {
            showError(field, "Password must be at least 8 characters.");
            return false;
        }

        if (field.id === "confirm_password" && passwordInput && value !== passwordInput.value) {
            showError(field, "Passwords do not match.");
            return false;
        }

        if (field.id === "graduation_year") {
            const year = Number(value);
            if (!Number.isInteger(year) || year < 2026 || year > 2040) {
                showError(field, "Enter a graduation year between 2026 and 2040.");
                return false;
            }
        }

        clearError(field);
        return true;
    }

    // Re-check a field only after it already has an error, so the form does
    // not turn red while the user is still filling it in for the first time.
    form.querySelectorAll("input, select, textarea").forEach(function (field) {
        function revalidate() {
            const wrap = field.closest(".field");
            if (wrap && wrap.classList.contains("has-error")) {
                validateField(field);
            }
        }

        field.addEventListener("input", revalidate);
        field.addEventListener("change", revalidate);
    });

    /* ---------------------------------------------------------
       Submit
       --------------------------------------------------------- */

    form.addEventListener("submit", function (event) {
        event.preventDefault();

        const fields = Array.prototype.slice
            .call(form.querySelectorAll("input, select, textarea"))
            .filter(function (field) {
                return !field.disabled && field.type !== "hidden";
            });

        let firstInvalid = null;

        fields.forEach(function (field) {
            if (!validateField(field) && !firstInvalid) {
                firstInvalid = field;
            }
        });

        if (firstInvalid) {
            firstInvalid.focus();
            firstInvalid.scrollIntoView({ behavior: "smooth", block: "center" });
            return;
        }

        if (CLIENT_ONLY_MODE) {
            window.alert(
                "Front-end check passed. Connect POST /auth/register to save this " +
                getRole().toLowerCase() + " account."
            );
            return;
        }

        // form.submit() skips this handler, so the request reaches the server.
        form.submit();
    });

    /* ---------------------------------------------------------
       Show / hide password
       --------------------------------------------------------- */

    document.querySelectorAll(".toggle-pass").forEach(function (button) {
        button.addEventListener("click", function () {
            const input = document.getElementById(button.dataset.toggleFor);
            if (!input) {
                return;
            }

            const showing = input.type === "password";
            input.type = showing ? "text" : "password";

            button.setAttribute("aria-pressed", String(showing));
            button.setAttribute("aria-label", showing ? "Hide password" : "Show password");

            const icon = button.querySelector("i");
            if (icon) {
                icon.className = showing
                    ? "fa-solid fa-eye-slash"
                    : "fa-solid fa-eye";
            }
        });
    });

    /* ---------------------------------------------------------
       Initial state + server-side error messages
       --------------------------------------------------------- */

    const params = new URLSearchParams(window.location.search);
    const roleParam = params.get("role");

    // Keep the role the user chose if the server sent them back with an error.
    if (roleParam === "ORGANIZER") {
        const organizerRadio = form.querySelector('input[name="role"][value="ORGANIZER"]');
        if (organizerRadio) {
            organizerRadio.checked = true;
        }
    }

    setRole(getRole());

    const serverError = params.get("error");

    if (serverError) {
        const errorFields = {
            email: ["email", "An account with this email already exists."],
            password: ["confirm_password", "Passwords do not match."],
            "password-length": ["password", "Password must be at least 8 characters."],
            organization: ["organization_name", "Organization name is required."],
            role: ["role", "Please select a valid account type."],
            dob: ["dob", "Please enter a valid date of birth."],
            required: ["email", "Please fill in all required fields."]
        };

        const target = errorFields[serverError];
        if (target) {
            const field = document.getElementById(target[0]);
            if (field) {
                showError(field, target[1]);
                field.focus();
            }
        }
    }
})();
