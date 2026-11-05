// Contact form

(function () {
    "use strict";

    const form = document.getElementById("contactForm");
    if (!form) return;

    const email = document.getElementById("email");
    const name = document.getElementById("name");
    const subject = document.getElementById("subject");
    const message = document.getElementById("message");

    // Rules

    const rules = {
        name: function (value) {
            if (value === "") return "Please enter your name.";
            if (value.length < 2) return "That name looks too short.";
            return "";
        },

        email: function (value) {
            if (value === "") return "Please enter your email.";
            if (value.indexOf("@") === -1 || value.indexOf(".") === -1) {
                return "Enter a valid email, like name@example.com.";
            }
            return "";
        },

        subject: function (value) {
            if (value === "") return "Please choose a topic.";
            return "";
        },

        message: function (value) {
            if (value === "") return "Please write a message.";
            if (value.length < 20) return "Please write a little more (20+ characters).";
            return "";
        },
    };

    const fields = [name, email, subject, message];

    // Show the error

    function showError(input, text) {
        const field = input.closest(".form-group");
        const box = document.getElementById(input.id + "-error");

        field.classList.toggle("has-error", text !== "");
        input.setAttribute("aria-invalid", text !== "" ? "true" : "false");

        if (box) box.textContent = text;
    }

    function check(input) {
        showError(input, rules[input.id](input.value.trim()));
    }

    // Check on blur, and clear the message while they fix it.
    fields.forEach(function (input) {
        input.addEventListener("blur", function () {
            check(input);
        });

        input.addEventListener("input", function () {
            if (input.closest(".form-group").classList.contains("has-error")) {
                check(input);
            }
        });
    });

    // Submit

    form.addEventListener("submit", function (event) {
        event.preventDefault();

        fields.forEach(check);

        const broken = fields.filter(function (input) {
            return input.closest(".form-group").classList.contains("has-error");
        });

        if (broken.length > 0) {
            broken[0].focus();
            return;
        }

        // No backend yet — put your fetch() POST here
    });
})();