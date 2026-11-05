// Listing filters

(function () {
    "use strict";

    const GRIDS = ["opp-grid", "in-grid", "ws-grid"];
    const CARDS = ".opp-card, .in-card, .ws-card";

    const tabs = Array.from(document.querySelectorAll(".opp-tab[data-filter]"));
    if (!tabs.length) return;

    const gridId = GRIDS.find((id) => document.getElementById(id));
    if (!gridId) return;

    const grid = document.getElementById(gridId);
    // Empty state id follows the grid id: opp-grid -> opp-empty
    const empty = document.getElementById(gridId.replace("-grid", "-empty"));
    const cards = Array.from(grid.querySelectorAll(CARDS));

    function apply(filter) {
        let shown = 0;

        cards.forEach((card) => {
            const match = filter === "all" || card.classList.contains(filter);
            // Cards set `display`, which would beat `hidden` — toggle .is-hidden instead
            card.classList.toggle("is-hidden", !match);
            if (match) shown += 1;
        });

        if (empty) empty.classList.toggle("is-hidden", shown > 0);
    }

    tabs.forEach((tab) => {
        tab.setAttribute("aria-pressed", tab.classList.contains("active") ? "true" : "false");

        tab.addEventListener("click", () => {
            tabs.forEach((other) => {
                other.classList.remove("active");
                other.setAttribute("aria-pressed", "false");
            });

            tab.classList.add("active");
            tab.setAttribute("aria-pressed", "true");
            apply(tab.dataset.filter);
        });
    });

    apply("all");
})();