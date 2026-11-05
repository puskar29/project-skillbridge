document.querySelector('.hamburger').addEventListener('click', ()=> {
    document.querySelector('.navbar').classList.toggle('open');
});

document.querySelectorAll('.mobile-menu .dropdown').forEach((toggle) => {
    toggle.addEventListener('click', (e) => {
        if (e.target.closest('.dropdown-menu a')) return;
        e.preventDefault();
        toggle.classList.toggle('show');
    })
})