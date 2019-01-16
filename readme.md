# Something Like The Plumber

This repo collects some scripts that, when taken all together, create functionality that's [something like Plan 9's plumber](http://richardmavis.info/something-like-the-plumber).


## What You'll Need

1. [xclip](https://www.cyberciti.biz/faq/xclip-linux-insert-files-command-output-intoclipboard/)
2. [dmenu](https://tools.suckless.org/dmenu/)
3. [A collection of scripts](./scripts) that all receive the text to act on
4. A script that pipes the list of those scripts to dmenu and calls the one the user wants, passing it the selected text
5. A way to call that script in your desktop environment

You can probably install items 1 and 2 through your package manager.

You'll probably want to write the scripts that comprise item 3 yourself, the better to suit your needs.

Here's an example of item 4 (a combination of [`list-scripts`](./list-scripts) and [`selection`](./selection)):

    #!/usr/bin/env ruby
    
    script = `ls #{__dir__}/scripts | theme-dmenu -p "Pipe to" -sb "#e8ffff"`
    if (script.length > 0)
        system("echo `xclip -out -selection primary` | #{__dir__}/scripts/#{script}")
    end

And here's an example of item 5. For me, it's a bit of [`i3`](https://i3wm.org/) config:

    bindsym $mod+p exec ~/Development/plumber/selection


## How It Works

With these things in place, you can:

1. select some text,
2. invoke the list-selection script (by, for example, typing the `$mod` key and `p`),
3. select the name of the script you want to call (via `dmenu`) and hit `enter` to call it.

The selected text will be piped to the selected script, which you can then do whatever you want with. I have scripts for looking up words in multiple dictionaries, for piping a URL to my browser or search terms to DuckDuckGo, etc. Adding these "fittings" to the plumber is very easy.
