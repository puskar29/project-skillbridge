// Apply modal


// Build the modal
const modal = document.createElement("div");
modal.className = "apply-modal is-hidden";
modal.setAttribute("role", "dialog");
modal.setAttribute("aria-modal", "true");
modal.setAttribute("aria-labelledby", "apply-title");

modal.innerHTML = `
    <div class="apply-backdrop"></div>
    <div class="apply-dialog">
        <button type="button" class="apply-close" aria-label="Close dialog">
            <i class="fa-solid fa-xmark"></i>
        </button>

        <div class="apply-grid">

            <aside class="apply-info">
                <span class="opp-badge apply-badge" id="apply-badge">Internship</span>
                <h2 class="apply-title" id="apply-title"></h2>
                <p class="apply-company" id="apply-company"></p>
                <ul class="apply-facts" id="apply-facts"></ul>
                <div class="apply-about">
                    <h3 id="apply-about-heading">About this Internship</h3>
                    <p id="apply-summary"></p>
                </div>
            </aside>

            <div class="apply-form-col">
                <div class="apply-form-head" id="apply-form-head">
                    <h3 id="apply-form-heading">Application Form</h3>
                    <p>All fields marked * are required.</p>
                </div>

                <form id="apply-form" novalidate>
                    <div class="field">
                        <label for="apply-name">Full Name *</label>
                        <input type="text" id="apply-name" name="name" placeholder="e.g. Asha Rai" autocomplete="name">
                        <p class="field-error" id="apply-name-error"></p>
                    </div>

                    <div class="apply-row">
                        <div class="field">
                            <label for="apply-email">Email *</label>
                            <input type="email" id="apply-email" name="email" placeholder="you@example.com" autocomplete="email">
                            <p class="field-error" id="apply-email-error"></p>
                        </div>
                        <div class="field">
                            <label for="apply-phone">Phone *</label>
                            <input type="tel" id="apply-phone" name="phone" placeholder="+977 9812345678" autocomplete="tel">
                            <p class="field-error" id="apply-phone-error"></p>
                        </div>
                    </div>

                    <div class="field">
                        <label for="apply-college">College / University *</label>
                        <input type="text" id="apply-college" name="college" placeholder="e.g. Kathmandu University">
                        <p class="field-error" id="apply-college-error"></p>
                    </div>

                    <div class="apply-row">
                        <div class="field">
                            <label for="apply-year">Study Year *</label>
                            <select id="apply-year" name="year">
                                <option value="">Select year</option>
                                <option>First Year</option>
                                <option>Second Year</option>
                                <option>Third Year</option>
                                <option>Fourth Year</option>
                                <option>Recent Graduate</option>
                            </select>
                            <p class="field-error" id="apply-year-error"></p>
                        </div>
                        <div class="field">
                            <label for="apply-link">Portfolio / GitHub</label>
                            <input type="url" id="apply-link" name="link" placeholder="https://">
                            <p class="field-error" id="apply-link-error"></p>
                        </div>
                    </div>

                    <div class="field">
                        <label for="apply-resume">Resume (PDF or Word) *</label>
                        <input type="file" id="apply-resume" name="resume" accept=".pdf,.doc,.docx">
                        <p class="field-error" id="apply-resume-error"></p>
                    </div>

                    <div class="field">
                        <label for="apply-note">Why should we pick you?</label>
                        <textarea id="apply-note" name="note" rows="3" placeholder="A short cover note — skills, projects, what you hope to learn…"></textarea>
                    </div>

                    <div class="field">
                        <label class="checkbox terms">
                            <input type="checkbox" id="apply-terms">
                            <span>I confirm the details above are correct and agree to be contacted about this application.</span>
                        </label>
                        <p class="field-error" id="apply-terms-error"></p>
                    </div>

                    <button type="submit" class="auth-btn" id="apply-submit">Submit Application</button>
                </form>

                <div class="apply-success is-hidden" id="apply-success">
                    <span class="apply-success-icon"><i class="fa-solid fa-circle-check"></i></span>
                    <h3 id="apply-success-heading">Application Submitted!</h3>
                    <p class="apply-success-note" id="apply-success-line"></p>
                    <div class="apply-success-actions">
                        <button type="button" class="auth-btn" id="apply-done">Done</button>
                        <a class="apply-signup-link" href="signup.html" id="apply-success-link">Create an account to track your applications</a>
                    </div>
                </div>
            </div>
        </div>
    </div>`;

document.body.appendChild(modal);


// Elements
const form = document.getElementById("apply-form");
const formHead = document.getElementById("apply-form-head");
const successBox = document.getElementById("apply-success");
const resumeField = document.getElementById("apply-resume").closest(".field");

// The card that is open right now
let currentTitle = "";
let currentCompany = "";
let currentIsWorkshop = false;


// Fill the modal
const readText = (card, selector) => {
    const el = card.querySelector(selector);
    return el ? el.textContent.trim() : "";
};

const defaultSummary = () => {
    if (currentIsWorkshop) {
        return "A hands-on, project-based session led by practitioners — bring your laptop and learn by doing.";
    }
    return "A hands-on " + currentTitle.toLowerCase() + " role at " + currentCompany +
        " — work on real projects, get mentorship, and build experience you can carry into your career.";
};

const fillModal = (card) => {
    currentIsWorkshop =
        card.classList.contains("workshop") ||
        card.classList.contains("ws-card") ||
        card.dataset.type === "workshop";

    currentTitle = readText(card, ".opp-title, .in-title, .ws-title");
    currentCompany = readText(card, ".opp-company, .in-company, .ws-trainer");

    // Badge
    const badge = document.getElementById("apply-badge");
    badge.textContent = currentIsWorkshop ? "Workshop" : "Internship";
    badge.classList.toggle("is-workshop", currentIsWorkshop);

    // Title + company
    document.getElementById("apply-title").textContent = currentTitle;
    document.getElementById("apply-company").textContent = currentCompany;

    // Details list — whatever facts the card already shows
    let facts = "";
    const factEls = card.querySelectorAll(".opp-meta span, .in-meta span, .ws-meta span, .in-extra span, .opp-deadline");
    factEls.forEach((el) => {
        facts += "<li>" + el.innerHTML.trim() + "</li>";
    });

    // Workshop cards also show a start date and a level
    const day = readText(card, ".ws-date-day");
    const month = readText(card, ".ws-date-month");
    if (day !== "") {
        facts += '<li><i class="fa-regular fa-calendar"></i> Starts ' + day + " " + month + "</li>";
    }

    const level = readText(card, ".ws-level");
    if (level !== "") {
        facts += '<li><i class="fa-solid fa-signal"></i> Level: ' + level + "</li>";
    }

    document.getElementById("apply-facts").innerHTML = facts;

    // Wording: applying for a role, or registering for a workshop
    if (currentIsWorkshop) {
        document.getElementById("apply-about-heading").textContent = "About this Workshop";
        document.getElementById("apply-form-heading").textContent = "Registration Form";
        document.getElementById("apply-submit").textContent = "Confirm Registration";
        resumeField.classList.add("is-hidden");   // a resume only fits a job
    } else {
        document.getElementById("apply-about-heading").textContent = "About this Internship";
        document.getElementById("apply-form-heading").textContent = "Application Form";
        document.getElementById("apply-submit").textContent = "Submit Application";
        resumeField.classList.remove("is-hidden");
    }

    // The About paragraph — the card's data-summary when it has one
    document.getElementById("apply-summary").textContent = card.dataset.summary || defaultSummary();
};


// Validation

const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
const phonePattern = /^[0-9\s+()-]{7,}$/;

const rules = {
    "apply-name": (input) => {
        if (input.value.trim() === "") return "Please enter your full name.";
        return "";
    },

    "apply-email": (input) => {
        if (input.value.trim() === "") return "Please enter your email.";
        if (!emailPattern.test(input.value.trim())) return "Please enter a valid email.";
        return "";
    },

    "apply-phone": (input) => {
        if (input.value.trim() === "") return "Please enter your phone number.";
        if (!phonePattern.test(input.value.trim())) return "Please enter a valid phone number.";
        return "";
    },

    "apply-college": (input) => {
        if (input.value.trim() === "") return "Please enter your college / university.";
        return "";
    },

    "apply-year": (input) => {
        if (input.value === "") return "Please select your study year.";
        return "";
    },

    "apply-link": (input) => {
        const value = input.value.trim();
        if (value === "") return "";
        if (!value.startsWith("http")) return "Link must start with http://";
        return "";
    },

    "apply-resume": (input) => {
        if (resumeField.classList.contains("is-hidden")) return "";   // workshops skip it
        if (input.files.length === 0) return "Please attach your resume.";
        if (!/\.(pdf|docx?)$/i.test(input.files[0].name)) return "Please attach a PDF or Word file.";
        return "";
    },

    "apply-terms": (input) => {
        if (!input.checked) return "Please confirm your details before submitting.";
        return "";
    },
};

const fields = Object.keys(rules).map((id) => document.getElementById(id));

const showError = (input, text) => {
    const field = input.closest(".field");
    const box = document.getElementById(input.id + "-error");

    field.classList.toggle("has-error", text !== "");
    if (box) box.textContent = text;
};

const check = (input) => {
    const message = rules[input.id](input);
    showError(input, message);
    return message === "";
};

// Check on blur, and clear the message while they fix it
fields.forEach((input) => {
    const recheck = () => {
        if (input.closest(".field").classList.contains("has-error")) {
            check(input);
        }
    };

    input.addEventListener("blur", () => check(input));
    input.addEventListener("input", recheck);
    input.addEventListener("change", recheck);
});


// Open / close
const clearErrors = () => {
    fields.forEach((input) => showError(input, ""));
};

const openModal = (card) => {
    fillModal(card);

    // start fresh every time
    form.reset();
    form.classList.remove("is-hidden");
    formHead.classList.remove("is-hidden");
    successBox.classList.add("is-hidden");

    modal.classList.remove("is-hidden");
    document.body.style.overflow = "hidden";
    document.getElementById("apply-name").focus();

    // Clear errors last — the name focus blurs the old field, re-flagging a reset value
    clearErrors();
};

const closeModal = () => {
    modal.classList.add("is-hidden");
    document.body.style.overflow = "";
};


// Events
// Every Apply / Register link opens the modal (same loop as filters.js)
document.querySelectorAll(".opp-apply, .in-apply, .ws-apply").forEach((link) => {
    link.addEventListener("click", (event) => {
        event.preventDefault();

        const card = link.closest(".opp-card, .in-card, .ws-card");
        if (card) openModal(card);
    });
});

// Close: backdrop, ×, Done button, or the Escape key
modal.querySelector(".apply-backdrop").addEventListener("click", closeModal);
modal.querySelector(".apply-close").addEventListener("click", closeModal);
document.getElementById("apply-done").addEventListener("click", closeModal);

document.addEventListener("keydown", (event) => {
    if (event.key === "Escape") closeModal();
});

// Submit
form.addEventListener("submit", (event) => {
    event.preventDefault();

    const broken = fields.filter((input) => !check(input));

    if (broken.length > 0) {
        broken[0].focus();
        return;
    }

    // No backend yet — put your fetch() POST here
    const email = document.getElementById("apply-email").value.trim();

    if (currentIsWorkshop) {
        document.getElementById("apply-success-heading").textContent = "Registration Confirmed!";
        document.getElementById("apply-success-line").textContent =
            "You're registered for " + currentTitle + ". Session details will be sent to " + email + ".";
        document.getElementById("apply-success-link").textContent =
            "Create an account to manage your registrations";
    } else {
        document.getElementById("apply-success-heading").textContent = "Application Submitted!";
        document.getElementById("apply-success-line").textContent =
            "Your application for " + currentTitle + " at " + currentCompany +
            " has been submitted. They will contact you at " + email + ".";
        document.getElementById("apply-success-link").textContent =
            "Create an account to track your applications";
    }

    form.classList.add("is-hidden");
    formHead.classList.add("is-hidden");
    successBox.classList.remove("is-hidden");
    modal.querySelector(".apply-dialog").scrollTop = 0;
});
