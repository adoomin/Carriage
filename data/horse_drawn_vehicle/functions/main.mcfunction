#Set Scoreboard
scoreboard objectives add hdvExcOnce dummy
scoreboard players add @e[tag=hdvHorse,tag=!hdvExcOnce] hdvExcOnce 1

#Init Vehicle
execute as @e[tag=hdvHorse,tag=!hdvExcOnce] at @s run function horse_drawn_vehicle:summon_vehicle

#Set Tag & Score to execute one time
tag @e[scores={hdvExcOnce=1..},tag=!hdvExcOnce] add hdvExcOnce
scoreboard players reset @e[tag=hdvExcOnce] hdvExcOnce
tag @e[scores={hdvExcOnce=0}] remove hdvExcOnce

#Set Vehicle Parts
execute as @e[tag=hdvHorse] at @s run tp @e[tag=hdvHorseDir,sort=nearest,limit=1] ~ ~ ~ ~ 0
execute as @e[tag=hdvHorseDir] at @s positioned ^ ^1 ^-2 run tp @e[tag=hdvVehicle,sort=nearest,limit=1] ~ ~ ~ ~ 0
execute as @e[tag=hdvVehicle] at @s run function horse_drawn_vehicle:set_vehicle

#Give Effects to Seat & Protect Parts
execute as @e[tag=ProtectParts] run effect give @s minecraft:invisibility 1 1 true
execute as @e[tag=ProtectParts] run effect give @s minecraft:resistance 1 255 true
execute as @e[tag=hdvSeat] run effect give @s minecraft:invisibility 1 1 true
execute as @e[tag=hdvSeat] run effect give @s minecraft:resistance 1 255 true
execute as @e[tag=hdvHorse] run effect give @s minecraft:slowness 1 1 true

##Target Same Entity
#scoreboard players operation temp Temp = @s speed
#scoreboard players operation @e speed -= temp Temp
#kill @e[score={speed=0}]
#scoreboard players operation @e speed += temp Temp