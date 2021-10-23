execute unless block ~ ~ ~ #reaper:non_solid run function reaper:hit_block
scoreboard players add #distance chaintemp 1
execute if score #hit chaintemp matches 0 if score #distance chaintemp matches ..1200 positioned ^ ^ ^0.1 run function reaper:ray
particle minecraft:dust_color_transition 0 0 0 1 1 1 1 ~ ~ ~ 0.1 0.1 0.1 .1 3 force