document.addEventListener('DOMContentLoaded', () => {
    // 1. Tema Dark / Light Mode
    const themeToggleBtn = document.getElementById('theme-toggle');
    const htmlElement = document.documentElement;
    const themeIcon = themeToggleBtn.querySelector('i');

    themeToggleBtn.addEventListener('click', () => {
        const currentTheme = htmlElement.getAttribute('data-theme');
        if (currentTheme === 'light') {
            htmlElement.setAttribute('data-theme', 'dark');
            themeIcon.classList.replace('fa-moon', 'fa-sun');
        } else {
            htmlElement.setAttribute('data-theme', 'light');
            themeIcon.classList.replace('fa-sun', 'fa-moon');
        }
    });

    // 2. Busca em Tempo Real
    const searchInput = document.getElementById('searchInput');
    const tableCards = document.querySelectorAll('.table-card');

    searchInput.addEventListener('input', (e) => {
        const term = e.target.value.toLowerCase().trim();

        tableCards.forEach(card => {
            const searchData = card.getAttribute('data-table').toLowerCase();
            const textContent = card.innerText.toLowerCase();

            if (searchData.includes(term) || textContent.includes(term)) {
                card.style.display = 'block';
            } else {
                card.style.display = 'none';
            }
        });
    });

    // 3. Modal DER & Panzoom.js
    const modal = document.getElementById('derModal');
    const openModalBtn = document.getElementById('openDerModal');
    const closeModalBtn = document.getElementById('closeModal');
    const derImage = document.getElementById('der-image');
    
    let panzoomInstance = null;

    openModalBtn.addEventListener('click', () => {
        modal.style.display = 'flex';
        if (!panzoomInstance) {
            panzoomInstance = Panzoom(derImage, {
                maxScale: 5,
                minScale: 0.5,
                increment: 0.2,
                startScale: 1
            });
            // Habilitar zoom com o scroll do mouse
            const parentContainer = derImage.parentElement;
            parentContainer.addEventListener('wheel', panzoomInstance.zoomWithWheel);
        }
    });

    closeModalBtn.addEventListener('click', () => {
        modal.style.display = 'none';
    });

    window.addEventListener('click', (e) => {
        if (e.target === modal) {
            modal.style.display = 'none';
        }
    });

    // Botões de Zoom do Modal
    document.getElementById('zoomIn').addEventListener('click', () => {
        if (panzoomInstance) panzoomInstance.zoomIn();
    });

    document.getElementById('zoomOut').addEventListener('click', () => {
        if (panzoomInstance) panzoomInstance.zoomOut();
    });

    document.getElementById('zoomReset').addEventListener('click', () => {
        if (panzoomInstance) panzoomInstance.reset();
    });
});