# LDTK and Godot

## Installing Godot and creating a new project
Head to https://godotengine.org and download and install the latest version of
Godot.

![Godot Download Page](./screenshots/godotdownload.png)

Next we will want to create a new Godot project. Name it something memorable and
the folder somewhere you can easily find it later.
![Godot New Project Page](./screenshots/godotnewproject.png)

Once the project loads up, we can close it and will come back to it later once
we create our level.

## Installing LDTK and creating a new project
Head to https://ldtk.io and download and install the latest version of LDTK.

![LDTK Download Page](./screenshots/ldtkdownload.png)

Open up LDTK and create a new project. Make sure you put it inside the folder
for the Godot project you made earlier.
![LDTK New Project Page](./screenshots/ldtknewproject.png)

## Getting assets
For this tutorial I will be using some Creative Commons assets but really you
could use any tileset you have available.
![Assets Download](./screenshots/assets.png)

Head over to https://0x72.itch.io/dungeontileset-ii and download the assets.
Unzip them and grab 0x72_DungeonTilesetII_v1.7.png out of the uncompressed
folder and move it into your Godot project folder.

## Setting up LDTK level
Inside of the LDTK project, we will want to set the size of our level. Since our
tiles are 16 by 16 and I want a 20 by 12 map, I will set the width and height of
the level to 320 by 192 pixels. This is fairly arbitrary and you can set it to
whatever you want but this is as smallest as I can reasonably have the level at
in a 16:9 ratio for the sake of the tutorial.
![Level Resize](./screenshots/resizelevel.png)

## Importing our tileset
We need to import the tileset into our level. To do this click on the Tilesets
or simply use the keybind 'T'. A menu should pop up. Create a new tileset and
pick the 0x72_DungeonTilesetII_v1.7.png tileset as the Source Image. LDTK should
autodetect all the rest.
![Tileset Import](./screenshots/tilesetimport.png)

## Setting up Layers
In LDTK, layers are what you draw with. The level editor can use these layers
plus some rules we will talk about later to autogenerate tiles. Go to the Layers
menu or use the keybind 'L'. In the menu that pops up, make a new IntGrid layer,
call it "Collisions", set the Auto-layer Tileset to our tileset and in the Grid
Values section name it "Walls" and make it a dark red colour.
![Collisions Layer](./screenshots/collisionslayer.png)

Now make a new Auto-layer layer and name it 'Floors'. Set the Auto-layer source
to 'Collisions' and the Auto-layer tileset to our tileset. Now the idea behind
this is to setup this layer such that it fills in anything that isn't a
Collision. To do this hit 'Edit Rules'.
![Floors Layer](./screenshots/floorslayer.png)

Make a new empty group and call it 'Floors'. Hit the orange Plus icon to make a
new rule. Click on the top bar for Individual Tiles and select the regular floor
tile. Now right click on the center tile in the grid. What this does is it sets
up a rule that fills anything that isn't a wall with our floor tile.
![Floor rule](./screenshots/floorrule.png)

Make a new rule. When selecting the tiles, select all the broken tiles by
Control clicking on them. 
![Broken Tiles](./screenshots/brokentiles.png)

Right on the center tile like before. Once you escape out of the rule, it will
apply and set all the tiles to random broken tiles. But of course we do not want
all the tiles to be broken! To solve this we can change the probability that a
tile will be broken. Hit the P icon to enable perlin filtering. Now right click
it and you can change the scale, octaves and regenerate the filter if need be.
![Perlin filtering](./screenshots/perlinnoise.png)
