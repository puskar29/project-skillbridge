(function () {
    "use strict";

    const modal = document.getElementById("confirmModal");
    const message = document.getElementById("confirmMessage");
    const submit = document.getElementById("confirmSubmit");
    if (!modal || !message || !submit) return;

    let pendingForm;

    function close() {
        modal.classList.add("is-hidden");
        pendingForm = null;
    }

    document.querySelectorAll(".confirm-action").forEach((form) => {
        form.addEventListener("submit", (event) => {
            event.preventDefault();
            pendingForm = form;
            message.textContent = form.dataset.confirmMessage || "Are you sure you want to continue?";
            modal.classList.remove("is-hidden");
        });
    });

    submit.addEventListener("click", () => {
        if (!pendingForm) return;
        const form = pendingForm;
        close();
        form.submit();
    });

    modal.querySelectorAll("[data-confirm-cancel]").forEach((element) => {
        element.addEventListener("click", close);
    });
})();
