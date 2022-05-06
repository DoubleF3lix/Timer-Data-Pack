# Timer Data Pack
Timer utility data pack (includes display) for Minecraft: Java Edition (tested in 1.18.2, may work in newer/older versions)

---

## Quick Start
First, install the data pack. You know... copy the folder, do the stuff, `/reload` to run the init function, etc.

This pack is setup so you shouldn't ever need to touch the source. Instead, you'll hook into function tags and set scoreboards to do fancy things.

You probably want to actually do stuff when the timer ends unless if you're using this for a purely cosmetic purpose (which I find weird but whatever floats your boat), so to do that, make a new namespace called `timer` in your data pack, then make a new function tag named `finished.json`, and make sure you set `"replace": true`. For instance, if I wanted to run `sliders:new_dimension` when my timer finishes, my tag would look like this:
```jsonc
// pack/data/timer/tags/functions/finished.json
{
    "replace": true,
    "values": [
        "sliders:new_dimension"
    ]
}
```
Now that you got your basic callback setup, we need to actually define the timer. Just set `$minutes timer.config` and `$seconds timer.config`, then run `function timer:start_timer`. ...And that's it. There's some more "advanced" features mentioned below, but if you want basic, you got it.

---

## "Advanced" Features
More callbacks! Woo-hoo! We have `display.json` (yes, these are all function tags), `new_minute.json`, and `new_second.json`. `display.json` should point to a function which runs some command for display purposes. You can reference `$tick`, `$deciseconds`, `$seconds`, and `$minutes` (all belonging to `timer.main`) in your quest for visual perfection. The default display looks like this:
```mcfunction
execute if score $seconds timer.main matches 0..9 run title @a actionbar [{"text": "", "color": "yellow", "bold": true}, {"text": "Time: ", "bold": false}, {"score": {"name": "$minutes", "objective": "timer.main"}}, {"text": ":"}, {"text": "0"}, {"score": {"name": "$seconds", "objective": "timer.main"}}, {"text": "."}, {"score": {"name": "$deciseconds", "objective": "timer.main"}}]

execute if score $seconds timer.main matches 10.. run title @a actionbar [{"text": "", "color": "yellow", "bold": true}, {"text": "Time: ", "bold": false}, {"score": {"name": "$minutes", "objective": "timer.main"}}, {"text": ":"}, {"score": {"name": "$seconds", "objective": "timer.main"}}, {"text": "."}, {"score": {"name": "$deciseconds", "objective": "timer.main"}}]
```

`new_minute.json` is a callback which runs when there's a new minute on the timer. Given this knowledge, can you guess what `new_second.json` does? 
Note that these callbacks will run for *every* new minutes and second, so 0:00 will trigger them both. I didn't bother testing that though, and the timer should automatically stop once it finishes, but if you're reading this value every tick it may be something to watch out for. 

Oh I almost forgot, there's also fancy *c o n t r o l* stuff. 
Here's a quick rundown of what the functions do:
- `start_timer.mcfunction` - Starts the timer with the time specified in the `timer.config` variables. Will override a currently running timer.
- `stop_timer.mcfunction` - Completely stops the timer. Completely completely.
- `toggle_timer.mcfunction` - Will __**pause**__ the timer if it's running, and will play it if it's paused. A paused timer will still display, but the timer itself will stop counting. If you want to stop this display, there's cool functions mentioned below that can help.
- `show_timer_display.mcfunction` - Makes the timer rear it's ugly head. As you can guess, it doesn't do anything if the timer is already basking in its photorealistic glory.
- `hider_timer_display.mcfunction` - Take a guess lol. Timer will keep ticking even if the display is hidden. Oh, right. This will also immediately run `title @a actionbar ""` to clear the timer display. Yes I realize this may be unintended, especially with a custom display. I said you *shouldn't* need to touch the source, not that you never will. If you don't want to immediately hide the timer, use `scoreboard players set $hide_display timer.config 0`.
But why would you ever want to prolong the timers pain? It's already fading into the abyss, at least make it quick, you monster. (Surgeon General's Warning: This message does not apply if you have fade out via `title @a times` set to 0.)
- `toggle_timer_display.mcfunction` - Does the same thing as the above functions, but it depends on the value of `$hide_display timer.config`. You can adjust that score manually, but the functions are meant for *c o n v e n i e n c e*.

Erm, I think that's it. If you have any questions or problems, make an issue on the GitHub repository I guess. Or don't, I'm not your mother.

---

## Notes
Shoutout to Godlander for giving me the math to do this because I'm incompetent.
*Yes I plan on adding more dynamic timers later instead of just one. Have to do fancy stuff with like 8 objectives, marker entities, command blocks, it's a whole thing.*