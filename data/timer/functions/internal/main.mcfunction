# Decrement the timer and display it
execute if score $enabled timer.main matches 1 run function timer:internal/decrement_timer

# Handles timer display
execute if score $hide_display timer.config matches 0 run function timer:internal/display/check