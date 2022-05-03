# Calculate the centiseconds from the ticks
scoreboard players operation $deciseconds timer.main = $tick timer.main
scoreboard players operation $deciseconds timer.main %= $20 timer.const
scoreboard players operation $deciseconds timer.main /= $2 timer.const

# Calculate the seconds from the ticks
scoreboard players operation $seconds timer.main = $tick timer.main
scoreboard players operation $seconds timer.main /= $20 timer.const
scoreboard players operation $seconds timer.main %= $60 timer.const

# Calculate the minutes from the ticks
scoreboard players operation $minutes timer.main = $tick timer.main
scoreboard players operation $minutes timer.main /= $1200 timer.const
scoreboard players operation $minutes timer.main %= $60 timer.const