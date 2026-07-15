(function() {
    function init() {
        var body = document.body;
        var btn = document.createElement('button');
        btn.id = 'dark-toggle';
        btn.setAttribute('aria-label', 'Toggle dark mode');
        btn.textContent = localStorage.getItem('theme') === 'dark' ? '\u2600' : '\u263E';

        if (localStorage.getItem('theme') === 'dark') {
            body.classList.add('dark');
        }

        btn.addEventListener('click', function() {
            body.classList.toggle('dark');
            var isDark = body.classList.contains('dark');
            localStorage.setItem('theme', isDark ? 'dark' : 'light');
            btn.textContent = isDark ? '\u2600' : '\u263E';
        });

        body.appendChild(btn);
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }
})();
