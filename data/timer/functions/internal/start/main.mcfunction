scoreboard players operation $tick timer.main = $minutes timer.config
scoreboard players operation $tick timer.main *= $1200 timer.const

scoreboard players operation #temp timer.main = $seconds timer.config
scoreboard players operation #temp timer.main *= $20 timer.const
scoreboard players operation $tick timer.main += #temp timer.main

scoreboard players set $enabled timer.main 1
scoreboard players set $paused timer.main 0