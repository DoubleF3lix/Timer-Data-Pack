# Decrement the tick score
scoreboard players remove $tick timer.main 1

# Check if it's a new second or minute, and if so, run the callback function
scoreboard players operation #temp timer.main = $tick timer.main
scoreboard players operation #temp timer.main %= $20 timer.const
execute if score #temp timer.main matches 0 run function #timer:new_second

scoreboard players operation #temp timer.main = $tick timer.main
scoreboard players operation #temp timer.main %= $1200 timer.const
execute if score #temp timer.main matches 0 run function #timer:new_minute

execute if score $hide_display timer.config matches 0 run function timer:internal/calculate_display_data

# This sets the $enabled score to 0 and then calls the function tag
execute if score $tick timer.main matches 0 run function timer:internal/timer_finished