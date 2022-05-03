# Check if the score won't cause an overflow
execute if score $minutes timer.config matches 1789570.. run function timer:internal/start/config_overflow_error
execute if score $minutes timer.config matches 1789569 if score $seconds timer.config matches 43.. run function timer:internal/start/config_overflow_error

execute if score #no_flag:start timer.main matches 0 run function timer:internal/start/main
scoreboard players set #no_flag:start timer.main 0 