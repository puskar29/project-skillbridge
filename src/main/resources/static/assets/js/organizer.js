"use strict";

// Basic Helpers

const get = (id) => document.getElementById(id);


// Local storage

function saveData(key, data) {
    localStorage.setItem(key, JSON.stringify(data));
}

function getData(key) {
    const data = localStorage.getItem(key);

    if (data) {
        return JSON.parse(data);
    }

    return [];
}


// Toast message

let toastTimer;

function showToast(message, error = false) {

    const toast = get("toast");

    if (!toast) {
        return;
    }

    get("toastMsg").textContent = message;

    if (error) {
        toast.classList.add("error");
    } else {
        toast.classList.remove("error");
    }

    toast.classList.add("show");

    clearTimeout(toastTimer);

    toastTimer = setTimeout(() => {
        toast.classList.remove("show");
    }, 2800);
}


// Sidebar

function openSidebar() {

    const sidebar = get("sidebar");
    const overlay = get("sidebarOverlay");

    if (sidebar) {
        sidebar.classList.add("open");
    }

    if (overlay) {
        overlay.classList.add("show");
    }
}


function closeSidebar() {

    const sidebar = get("sidebar");
    const overlay = get("sidebarOverlay");

    if (sidebar) {
        sidebar.classList.remove("open");
    }

    if (overlay) {
        overlay.classList.remove("show");
    }
}

window.openSidebar = openSidebar;
window.closeSidebar = closeSidebar;


// Sidebar accordion

const accordion = get("accordionSidebar");

if (accordion) {

    const buttons = accordion.querySelectorAll(
        '[data-toggle="collapse"]'
    );

    buttons.forEach((button) => {

        button.addEventListener("click", (event) => {

            event.preventDefault();

            const target = document.querySelector(
                button.dataset.target
            );

            if (!target) {
                return;
            }

            const isOpen = target.classList.contains("show");

            // Close all
            buttons.forEach((otherButton) => {

                const otherTarget = document.querySelector(
                    otherButton.dataset.target
                );

                if (otherTarget) {
                    otherTarget.classList.remove("show");
                }

                otherButton.classList.add("collapsed");
            });

            // Open clicked one
            if (!isOpen) {
                target.classList.add("show");
                button.classList.remove("collapsed");
            }

        });

    });


    // Active group on load

    const activeChild = accordion.querySelector(".collapse-item.active");

    if (activeChild) {

        buttons.forEach((button) => {

            const target = document.querySelector(button.dataset.target);

            if (!target || !target.contains(activeChild)) {
                return;
            }

            // Same end state as clicking it: panel open, no chevron fold
            target.classList.add("show");
            button.classList.remove("collapsed");

            // Mark the trigger and its row so both CSS hooks fire
            button.classList.add("active");

            const navItem = button.closest(".nav-item");

            if (navItem) {
                navItem.classList.add("active");
            }

        });

    }
}


// Modal

const modal = get("actionModal");
const modalTitle = get("actionModalTitle");
const modalText = get("actionModalText");
const modalConfirm = get("actionModalConfirm");
const modalCancel = get("actionModalCancel");

let confirmFunction = null;


function openConfirm(title, text, functionToRun) {

    if (!modal) {
        return;
    }

    modalTitle.textContent = title;
    modalText.textContent = text;

    confirmFunction = functionToRun;

    modal.classList.add("show");
}


function closeModal() {

    if (!modal) {
        return;
    }

    modal.classList.remove("show");

    confirmFunction = null;
}


if (modalConfirm) {

    modalConfirm.addEventListener("click", () => {

        if (confirmFunction) {
            confirmFunction();
        }

        closeModal();

    });

}


if (modalCancel) {
    modalCancel.addEventListener("click", closeModal);
}


if (modal) {

    modal.addEventListener("click", (event) => {

        if (event.target === modal) {
            closeModal();
        }

    });

}


// Edit button

const editButtons = document.querySelectorAll(".edit-btn");

editButtons.forEach((button) => {

    button.addEventListener("click", () => {

        const id = button.dataset.id;

        const type = button.dataset.type;

        if (type === "workshop") {

            window.location.href =
                "add-workshop.html?id=" + id;

        } else {

            window.location.href =
                "add-internship.html?id=" + id;

        }

    });

});


// Delete button

const deleteButtons = document.querySelectorAll(".delete-btn");

deleteButtons.forEach((button) => {

    button.addEventListener("click", () => {

        const id = button.dataset.id;
        const type = button.dataset.type;

        openConfirm(
            "Delete this " + type + "?",
            "Are you sure you want to delete this record?",
            () => {

                deleteRecord(id, type);

            }
        );

    });

});


function deleteRecord(id, type) {

    let key;

    if (type === "workshop") {
        key = "workshops";
    } else {
        key = "internships";
    }

    let data = getData(key);

    data = data.filter((item) => {

        return String(item.id) !== String(id);

    });

    saveData(key, data);

    const row = document.querySelector(
        '[data-id="' + id + '"]'
    );

    if (row) {
        row.remove();
    }

    showToast(
        type.charAt(0).toUpperCase() +
        type.slice(1) +
        " deleted"
    );
}


// Edit page

const url = new URLSearchParams(window.location.search);

const editId = url.get("id");


// Internship form

const internshipForm = get("addInternshipForm");

if (internshipForm) {

    const title = get("intTitle");
    const company = get("intCompany");
    const description = get("intDescription");
    const location = get("intLocation");
    const type = get("intType");
    const duration = get("intDuration");
    const stipend = get("intStipend");
    const deadline = get("intDeadline");
    const active = get("intActive");

    const activeValue = get("intActiveValue");

    function syncActive() {
        if (active && activeValue) {
            activeValue.value = active.checked ? "true" : "false";
        }
    }

    if (active) {
        active.addEventListener("change", syncActive);
        syncActive();
    }

    const submitButton = get("intSubmit");
    const panelTitle = get("intPanelTitle");


    // Load old data when editing

    if (editId) {

        const internships = getData("internships");

        const internship = internships.find((item) => {

            return String(item.id) === String(editId);

        });


        if (internship) {

            title.value = internship.title || "";
            company.value = internship.company || "";
            description.value = internship.description || "";
            location.value = internship.location || "";
            type.value = internship.type || "";
            duration.value = internship.duration || "";
            stipend.value = internship.stipend || "";
            deadline.value = internship.deadline || "";

            if (active) {
                active.checked = internship.active;
            }

            if (panelTitle) {
                panelTitle.textContent = "Edit Internship";
            }

            if (submitButton) {
                submitButton.innerHTML =
                    '<i class="fa-solid fa-check"></i> Save Changes';
            }

        }

    }


    // Save internship

}


// Workshop form

const workshopForm = get("addWorkshopForm");

if (workshopForm) {

    const title = get("title");
    const organizer = get("organizer");
    const description = get("description");
    const location = get("location");
    const start = get("startDate");
    const duration = get("duration");
    const level = get("level");
    const category = get("category");
    const max = get("maxParticipants");
    const deadline = get("deadline");
    const active = get("active");

    const submitButton = get("submit");
    const panelTitle = get("panelTitle");


    // Load old workshop

    if (editId) {

        const workshops = getData("workshops");

        const workshop = workshops.find((item) => {

            return String(item.id) === String(editId);

        });


        if (workshop) {

            title.value = workshop.title || "";
            organizer.value = workshop.organizer || "";
            description.value = workshop.description || "";
            location.value = workshop.location || "";
            start.value = workshop.start || "";
            duration.value = workshop.duration || "";
            level.value = workshop.level || "";
            category.value = workshop.category || "";
            max.value = workshop.max || "";
            deadline.value = workshop.deadline || "";

            if (active) {
                active.checked = workshop.active;
            }

            if (panelTitle) {
                panelTitle.textContent = "Edit Workshop";
            }

            if (submitButton) {
                submitButton.innerHTML =
                    '<i class="fa-solid fa-check"></i> Save Changes';
            }

        }

    }
}


// Status filter

function filterStatus(button, tableId) {

    const table = get(tableId);

    if (!table) {
        return;
    }


    const filter = button.dataset.filter;


    // Change active button
    const buttons = button.parentElement.querySelectorAll(
        ".type-tab"
    );

    buttons.forEach((item) => {

        item.classList.remove("active");

    });

    button.classList.add("active");


    // Show / hide rows
    const rows = table.querySelectorAll("tr");

    rows.forEach((row) => {

        if (filter === "all") {

            row.hidden = false;

        } else if (row.dataset.status === filter) {

            row.hidden = false;

        } else {

            row.hidden = true;

        }

    });

}

window.filterStatus = filterStatus;


// Status buttons

const statusButtons = document.querySelectorAll(
    ".status-btn"
);

statusButtons.forEach((button) => {

    button.addEventListener("click", () => {

        const id = button.dataset.id;
        const status = button.dataset.status;
        const kind = button.dataset.kind;

        changeStatus(id, status, kind);

    });

});


function changeStatus(id, status, kind) {

    let key;

    if (kind === "registration") {
        key = "registrations";
    } else {
        key = "applications";
    }


    let data = getData(key);


    data = data.map((item) => {

        if (String(item.id) === String(id)) {

            item.status = status;

        }

        return item;

    });


    saveData(key, data);


    const row = document.querySelector(
        '[data-id="' + id + '"]'
    );


    if (row) {

        row.dataset.status = status;

        const statusText = row.querySelector(
            ".status"
        );

        if (statusText) {

            statusText.textContent =
                status.charAt(0).toUpperCase() +
                status.slice(1);

        }

    }


    showToast("Status updated");

}


// Reset demo data

function resetDemo() {

    localStorage.clear();

    window.location.reload();

}

window.resetDemo = resetDemo;


// Escape key closes modal

document.addEventListener("keydown", (event) => {

    if (event.key === "Escape") {

        closeModal();

    }

});


// Initial load

console.log("Admin JavaScript loaded successfully.");