scoreboard players set #hit chaintemp 1
summon armor_stand ~ ~ ~ {Tags:["tp"]}
teleport @e[type=minecraft:armor_stand,tag=tp,sort=nearest,limit=1]
kill @e[tag=tp,sort=nearest,limit=1]
particle minecraft:dust_color_transition 0 0 0 1 1 1 1 ~ ~ ~ 0.5 1 0.5 .1 1000 force
