execute store success score $hide_display timer.config unless score $hide_display timer.config matches 1
execute if score $hide_display timer.config matches 1 run title @a actionbar ""