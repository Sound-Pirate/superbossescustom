# Ensure players have scoreboard values
scoreboard players add @a mf_fatigue 0
scoreboard players add @a mf_mine_prev 0
scoreboard players add @a mf_jump_prev 0
scoreboard players add @a mf_sprint_prev 0
scoreboard players add @a mf_walk_prev 0

# Calculate differences for recent actions
execute as @a run scoreboard players operation @s mf_mine_diff = @s mf_mine_stat
execute as @a run scoreboard players operation @s mf_mine_diff -= @s mf_mine_prev
execute as @a run scoreboard players operation @s mf_mine_prev = @s mf_mine_stat

execute as @a run scoreboard players operation @s mf_jump_diff = @s mf_jump_stat
execute as @a run scoreboard players operation @s mf_jump_diff -= @s mf_jump_prev
execute as @a run scoreboard players operation @s mf_jump_prev = @s mf_jump_stat

execute as @a run scoreboard players operation @s mf_sprint_diff = @s mf_sprint_stat
execute as @a run scoreboard players operation @s mf_sprint_diff -= @s mf_sprint_prev
execute as @a run scoreboard players operation @s mf_sprint_prev = @s mf_sprint_stat

execute as @a run scoreboard players operation @s mf_walk_diff = @s mf_walk_stat
execute as @a run scoreboard players operation @s mf_walk_diff -= @s mf_walk_prev
execute as @a run scoreboard players operation @s mf_walk_prev = @s mf_walk_stat

# Increase fatigue for active actions
execute as @a if score @s mf_mine_diff matches 1.. run scoreboard players add @s mf_fatigue 2
execute as @a if score @s mf_jump_diff matches 1.. run scoreboard players add @s mf_fatigue 1
execute as @a if score @s mf_sprint_diff matches 1.. run scoreboard players add @s mf_fatigue 1

# Recover fatigue when resting or walking calmly
execute as @a unless score @s mf_mine_diff matches 1.. unless score @s mf_jump_diff matches 1.. unless score @s mf_sprint_diff matches 1.. run scoreboard players remove @s mf_fatigue 1
execute as @a if score @s mf_walk_diff matches 1.. unless score @s mf_sprint_diff matches 1.. unless score @s mf_jump_diff matches 1.. unless score @s mf_mine_diff matches 1.. run scoreboard players remove @s mf_fatigue 1

# Clamp fatigue to zero
execute as @a if score @s mf_fatigue matches ..-1 run scoreboard players set @s mf_fatigue 0

# Apply effects based on fatigue level
execute as @a run function musclefatigue:apply_effects
