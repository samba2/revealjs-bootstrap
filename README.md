Opinionated reveal.js Bootstrap
===============================

Creates a plain [reveal.js](https://github.com/hakimel/reveal.js) presentation with the external Markdown file _presentation.md_ containing the slides.

Usage:
```
git clone https://github.com/samba2/revealjs-bootstrap.git
make init
# edit presentation.md
make start_http_server
make present
```

Creating a PDF
--------------

PDF creation utilizes the [decktape](https://github.com/astefanutti/decktape) Docker container:

```
make pdf
```

Note: The command behind the `pdf` Makefile target is adjusted for Windows 10 + WSL 1.


Searching inside Presentation Mode
----------------------------------

Handles finding a text string anywhere in the slides and showing the next occurrence to the user by navigating to that slide and highlighting it.

**Shortcut : `CTRL + SHIFT + F`**

Zoom
----

Zoom anywhere on your presentation

**Shortcut : `alt + click`: Zoom in. Repeat to zoom back out.**


## Links
- https://raw.githubusercontent.com/evilz/vscode-reveal/master/sample.md