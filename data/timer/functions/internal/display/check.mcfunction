# Paused will only be 1 if the game is running
execute if score $paused timer.main matches 1 run function #timer:display
execute if score $enabled timer.main matches 1 run function #timer:display