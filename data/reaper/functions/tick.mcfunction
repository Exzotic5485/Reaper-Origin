# Soul Timer
execute as @a if score @s SoulTimer matches 0.. run scoreboard players remove @s SoulTimer 1

# Kill Scythes On Drop
execute at @e[type=item,nbt={Item:{tag:{scythe:1b}}}] run particle minecraft:poof ~ ~ ~ 0 0 0 .1 10
kill @e[type=item,nbt={Item:{tag:{scythe:1b}}}]

# Hurt Players Holding Scythe Not Reaper
execute as @a[tag=!reaper] if data entity @s Inventory[{tag:{scythe:1b}}] run effect give @s minecraft:wither 1 9

# Kill Altar Droppers
kill @e[type=minecraft:item,nbt={Item:{tag:{display:{Name:'{"bold":true,"italic":false,"color":"dark_purple","text":"Basic Scythe Altar"}'}}}}]
kill @e[type=minecraft:item,nbt={Item:{tag:{display:{Name:'{"bold":true,"italic":false,"color":"gold","text":"Advanced Scythe Altar"}'}}}}]

# Altar Building
execute as @e[tag=buildaltar1] at @s run setblock ~ ~ ~ minecraft:dropper[facing=up]{altar:1b,CustomName:'[{"text":"Basic Scythe Altar","italic":false,"color":"dark_purple","bold":true}]'} keep
execute as @e[tag=buildaltar2] at @s run setblock ~ ~ ~ minecraft:dropper[facing=up]{altar:1b,CustomName:'[{"text":"Advanced Scythe Altar","italic":false,"color":"gold","bold":true}]'} keep
execute as @e[tag=buildaltar] at @s run summon item_frame ~ ~1 ~ {Facing:1b,Fixed:0b,Invisible:1b,Invulnerable:1b}

execute as @e[tag=buildaltar] at @s if block ~ ~ ~ dropper run tag @s remove buildaltar
execute as @e[tag=buildaltar1] at @s if block ~ ~ ~ dropper run tag @s remove buildaltar1
execute as @e[tag=buildaltar2] at @s if block ~ ~ ~ dropper run tag @s remove buildaltar2

# Drop Altars On Break
execute as @e[tag=l1altar] at @s unless block ~ ~ ~ dropper run summon minecraft:item ~ ~1 ~ {Item:{id:"minecraft:skeleton_spawn_egg",Count:1b,tag:{basicaltar:1b,Enchantments:[{}],EntityTag:{id:armor_stand,Tags:["altar","l1altar","buildaltar","buildaltar1"],Invisible:1,NoGravity:1},display:{Name:'[{"text":"Basic Altar","italic":false,"color":"gray","bold":true}]'}}}}
execute as @e[tag=l2altar] at @s unless block ~ ~ ~ dropper run summon minecraft:item ~ ~1 ~ {Item:{id:"minecraft:dolphin_spawn_egg",Count:1b,tag:{Enchantments:[{}],EntityTag:{id:armor_stand,Tags:["altar","l2altar","buildaltar","buildaltar2"],Invisible:1,NoGravity:1},display:{Name:'[{"text":"Advanced Altar","italic":false,"color":"light_purple","bold":true}]'}}}}
execute as @e[tag=unactivated] at @s run summon minecraft:item ~ ~1 ~ {Item:{id:"minecraft:dolphin_spawn_egg",Count:1b,tag:{EntityTag:{id:armor_stand,Tags:["unactivated"],Invisible:1,NoGravity:1},display:{Name:'[{"text":"Unactivated Altar","italic":false,"color":"dark_purple","bold":true}]'},una:1b}}}


# Kill Armor Stands
execute as @e[tag=altar] at @s unless block ~ ~ ~ dropper run kill @e[type=minecraft:item_frame,sort=nearest,limit=1,distance=..2]
execute as @e[tag=altar] at @s unless block ~ ~ ~ dropper run kill @s
execute as @e[tag=unactivated] run kill @s

execute as @e[type=minecraft:zombie,tag=soultimer] at @s run tp @p

# Grant Powers
power grant @e[tag=l1altar] reaper:a1_particle
power grant @e[tag=l1altar] reaper:a1_upgrade
power grant @e[tag=l2altar] reaper:a2_particle
power grant @e[tag=l2altar] reaper:a2_upgrade

# Phantom Pig
effect give @e[tag=phantompig] minecraft:invisibility 999999 0 true
execute as @e[tag=phantompig] at @s run particle minecraft:dust 1 1 1 5 ~ ~ ~ 0.1 0.1 0.1 .1 100