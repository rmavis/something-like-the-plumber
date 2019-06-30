# Something Like The Plumber

This repo collects some scripts that, when taken all together, create functionality that's something like Plan 9's plumber. For example, you can:

- select the word "plumber"
- press super+p (to invoke the `plumber-piping` script) and select the "mw" handler (via dmenu)
- watch as `https://www.merriam-webster.com/dictionary/plumber` gets opened in your browser


## What You'll Need

1. [xclip](https://www.cyberciti.biz/faq/xclip-linux-insert-files-command-output-intoclipboard/)
2. [dmenu](https://tools.suckless.org/dmenu/)
3. A way to call the `plumber-piping` script in your desktop environment

You can probably install items 1 and 2 through your package manager. But you might have a more enjoyable experience by installing dmenu from source.

You'll need to figure out item 3 for yourself. For me, it's just a bit of [`i3`](https://i3wm.org/) config:

    bindsym $mod+p exec ~/Development/plumber/plumber-piping

And you'll want to edit the `Plumber` class to taste. Adding new handlers is easy.


## How It Works

Calling `plumber` with no arguments will print the list of handler scripts to `stdout`. Calling it with one argument---the name of a handler method---will cause it to invoke that method.

`plumber-piping`, first, calls `plumber` with no arguments and pipes its output into `dmenu`, at which point you can either cancel or select the handler. If you select a handler, `plumber-piping` will then call `plumber` again, but this time with the name of the handler you chose. `plumber` will then find the text you've selected (via `xclip`) and call the handler method with that selection.

You can write handlers to do pretty much anything you'd like. I have handlers for looking up words in multiple dictionaries, for piping a URL to my browser or search terms to DuckDuckGo, etc.
