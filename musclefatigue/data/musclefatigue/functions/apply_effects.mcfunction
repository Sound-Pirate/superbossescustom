# Clear existing fatigue effects
effect clear @s slowness
effect clear @s mining_fatigue
effect clear @s jump_boost

# Moderate fatigue effects
execute if score @s mf_fatigue matches 50..99 run effect give @s slowness 1 0 true
execute if score @s mf_fatigue matches 50..99 run effect give @s mining_fatigue 1 0 true
execute if score @s mf_fatigue matches 50..99 run effect give @s jump_boost 1 128 true

# Severe fatigue effects
execute if score @s mf_fatigue matches 100.. run effect give @s slowness 1 1 true
execute if score @s mf_fatigue matches 100.. run effect give @s mining_fatigue 1 1 true
execute if score @s mf_fatigue matches 100.. run effect give @s jump_boost 1 128 true
