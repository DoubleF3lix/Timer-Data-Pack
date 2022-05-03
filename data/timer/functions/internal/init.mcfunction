scoreboard objectives add timer.const dummy
scoreboard objectives add timer.main dummy
scoreboard objectives add timer.config dummy

scoreboard players set $2 timer.const 2
scoreboard players set $20 timer.const 20
scoreboard players set $60 timer.const 60
scoreboard players set $1200 timer.const 1200

execute unless score $enabled timer.main matches -2147483648.. run scoreboard players set $enabled timer.main 0
execute unless score $paused timer.main matches -2147483648.. run scoreboard players set $enabled timer.main 0
execute unless score $tick timer.main matches -2147483648.. run scoreboard players set $tick timer.main 0
execute unless score $deciseconds timer.main matches -2147483648.. run scoreboard players set $seconds timer.main 0
execute unless score $seconds timer.main matches -2147483648.. run scoreboard players set $seconds timer.main 0
execute unless score $minutes timer.main matches -2147483648.. run scoreboard players set $minutes timer.main 0

execute unless score $hide_display timer.main matches -2147483648.. run scoreboard players set $hide_display timer.config 0
execute unless score $seconds timer.config matches -2147483648.. run scoreboard players set $seconds timer.config 0
execute unless score $minutes timer.config matches -2147483648.. run scoreboard players set $minutes timer.config 0