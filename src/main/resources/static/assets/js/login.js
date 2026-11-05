const form = document.getElementById("loginForm");
const email = document.getElementById("email");
const password = document.getElementById("password");
const toggle = document.getElementById("togglePass");


// Show / Hide Password
toggle.addEventListener("click", () => {
    if (password.type === "password") {
        password.type = "text";
        toggle.innerHTML = '<i class="fa-solid fa-eye-slash"></i>';
    } else {
        password.type = "password";
        toggle.innerHTML = '<i class="fa-solid fa-eye"></i>';
    }
});


// Email Regex
const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;


// Validate Email
const validateEmail = () => {
    const error = document.getElementById("email-error");

    if (email.value.trim() === "") {
        error.textContent = "Please enter your email.";
        email.closest(".field").classList.add("has-error");
        return false;
    }

    if (!emailPattern.test(email.value.trim())) {
        error.textContent = "Please enter a valid email.";
        email.closest(".field").classList.add("has-error");
        return false;
    }

    error.textContent = "";
    email.closest(".field").classList.remove("has-error");
    return true;
};


// Validate Password
const validatePassword = () => {
    const error = document.getElementById("password-error");

    if (password.value.trim() === "") {
        error.textContent = "Please enter your password.";
        password.closest(".field").classList.add("has-error");
        return false;
    }

    if (password.value.length < 6) {
        error.textContent = "Password must be at least 6 characters.";
        password.closest(".field").classList.add("has-error");
        return false;
    }

    error.textContent = "";
    password.closest(".field").classList.remove("has-error");
    return true;
};


// Check when leaving the field
email.addEventListener("blur", () => {
    validateEmail();
});

password.addEventListener("blur", () => {
    validatePassword();
});


// Clear error while typing
email.addEventListener("input", () => {
    if (email.closest(".field").classList.contains("has-error")) {
        validateEmail();
    }
});

password.addEventListener("input", () => {
    if (password.closest(".field").classList.contains("has-error")) {
        validatePassword();
    }
});


// Submit
form.addEventListener("submit", (event) => {
    event.preventDefault();

    const emailOK = validateEmail();
    const passwordOK = validatePassword();

    if (!emailOK) {
        email.focus();
        return;
    }

    if (!passwordOK) {
        password.focus();
        return;
    }

    form.submit();
});