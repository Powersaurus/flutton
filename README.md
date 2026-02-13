# flutton
flags + buttons == flutton! pico-8-based low-code game engine using flags+buttons. Draw things first, make them do stuff later.

flutton gives you a tiny engine that can be bolted on to a visuals-only project to add some simple yet fun behaviours to the environment + characters already there.

## In action
![Demonstration of turning some static sprites into a basic game](/demos/demo.gif)

## Aim/Motivation
I watched my son create sprites and place them in the pico-8 map editor, he then wanted to turn it into a game and this wasn't immediately possible. This is my attempt to change that - using mostly the pico-8 sprite flags to give different sprites behaviours and meanings. I hope it lets people without coding experience to turn pictures into playable games.

Other aims:
- Make sure behaviours stack nicely/not too many surprises
- Keep it under the ~2kb pico-8-edu link limit (I don't think I can do this)
- Make it somewhat extensible if you want to write code
- Enable a "minecraft" or "mario" clone without code
- Throw rules out the window if they become impractical - so long as the "engine" code can be copy pasted into pico-8 I'm happy

## User guide
### Getting started
There are currently three options to get started with flutton:

- Copy and paste contents of flutton.p8 into your project
- Use `#include flutton.p8` in your project
- Open it on pico-8.edu and use as a template there.
[pico-8-edu link](https://pico-8-edu.com/?c=AHB4YQ6nBbBnv8L9Z7-C8S8Q7Z4dNUV1wAUr3Qs8wV1v8RpZZsf74-ujQCQcC2Vzft6ddZEzVkaeoV65pxQKaOJ2pnuHnXyijHYW8o3qOJUAJYF2oY1uCuNnaD1groksabfqLM1kxfwx0UYPceBhrdb4m4_svIQr8nIlf4RX8EG3uJI22Ui1sxQ11Uh_2IW3jVzXbJXlU7SLVbxVtRdubgWdfd-B-n0LezUr1tAu-606JnsiOFgUh972LkUcaJWEIw440xDvY4i9RTvsKKRXRVmCYN4k0zIJZ24Zas0wgWEVkTZHl8vHaPuxQkwgWxZeSCzihIVirZ9rpppmP0qKLAmmNvRW-BCJm_xVjdBC4KnScxOeTbbTzf4d8lXP3Jm_hGOUWCbDle14t5toVVhUwsYNZyfJcPWZY-aTQiAksZdMwfTURuub8ayJkzsX02ArS9f3m-DabMU2ahBNOjbfBkkSLswv1J6JNIfb1k9RWSVzhgpnlGcnIrUV-2kL5Hl9axokiYg46omJoCzHF1byPExWhQQX0k2bQzZoRXpAeRxtOzaZTWRelFaYWvXlFb7wwBWdt4IsFRL3eBIUEuYQH4dgOYQsxC3k0dpW3GBLyGa3ioVMdcmniV4Fss3pOrWjUEm5N3_COycmVuP5zptDdXTDUDk3G8qKH6UCQ5BIrUOQZHPyQdJkR_Jsf3NxS2F8_uL-f4kwaLBHcvwUZs-aZjW5GIW2016cWrKrpImi4VK5JfKkHyXx-i0XUxLvl5kco7ZPBZtC0EriYmiukU9pMl06dfZk9bgUjLk2sq0_FO0vUgQEU9FqWajhbT9Fubo7vOki4ctIqG_-mwmiebWRTG1I6TaOxjYaZTGRe_Ui92qVKJdV6TQ53EI-AdLiinfWdnTK1QbamBpWe0bayZY3V1tl_j9BJ0_qSiTGrVE_TaytrFIiz-x4t6jXHxFyS5GLzEIq-W69tivWjnimd3mVppsbUtsYzCcGirXFbG4wy1wwmITdGbM6woLnG9V1-_Z3g7UZOfZPoDxrazIrk7OtBdaE1qtuNpCJm7_j4ubT7NKDrziHrNGIAIde0_YNXrpEs7rZuWFImmvsjKGxumkWGtNtmf4S8UhlfbakvIW8ICRkaaYRH7eUnqyd0oewxISejaCzm9Tto9ElQB9Rr41ChDPggCD5Gekdc9SblQm62b7fGSj8UPsl8DtUw6T2H-QK0CT----RvRO9hxZ-Zf2pWSbA-p_iy1KPGCCwITpRmWvA1I0pAtMEppNk--8PWkT6BgaC450mqkWUGumkfIiFxP_Qc_hCFyVZlmgGBZphKj0DQZilUZLWPhywRdeVYZh0nQ_LWvHDFhowmg4HSEksaXrrjk3rjgeTQ4TH_iBZyjViOjNVcBBKVOG-0SUc44LnGLhFhaOo2pENHY4o91GbFG5gFoF5U8w101PekMSwUWYjSgh3tp9JVgk0eKBhLJFQBaurfaBbwJ1CFuD9IF4U0fKJZlaaZn4E2cItnlNqdAnfjOyL24j9zIbZVL8jABlp4Nh6z5auTmfV-LOwttDMVRKig6XmTrmZNR6QF1P3GgybLfgKEdNSC56sxCUFB317gy9tOTQhRo6xKFDslp2HKLnnunIjvlhu2DFjeldNUai3f0Li6CNd9GjQp7kiTBJ5h63lZm-5hOmqGszFNOQEEnHhQDYdnjlBzqNtzvDrnF_CJFHD1RMqBLmaOckibRE-RX4J-DKHr_KoumJOGD8xhooNLogHlEwSkDXyOKETdkoGFe68IlfUkqfQmHqeo7SwDYG7IUocK8vNiq2ZUvxG-sAqFR7S5CrLElDEwz-i49EgrfCDQsU5OTo3eoSwvphEVGdJkWIgXkh00AId9F8qKjpohXyCDvr--9O1VrZLxqw4if-hWJzSTP---xAp6gXKNNP-Ryu8mun-f-VZlyj-AA==)
### Workflow/general information
flutton is designed to let a developer draw a set of sprites and background tiles,
and then assign each different behaviours (see Sprite flags below for details).

The most basic 'playable' game is a single sprite with the red/0 flag set on. 
The sprite should be placed on the map within the first 32x32 tiles from the 
top-left (based on defaults). When the game is run, the camera will centre of 
the playable character.

Flags can often be combined to produce different behaviours. Those which required
custom code to enable are documented below, but trying out of combinations can 
produce more complex behaviours when the single-flag behaviours interact.

Each 8x8 sprite is independent of one another.

The game resets when a player's life reaches zero.

Walking out of the configured map space may result in unexpected behaviour.

A sound for when two sprites collide can be set by adding a sound effect with the same index as the *sprite being collided with* adding a sound effect with the same index as the *sprite being collided with*. This means the sprite needs to have the yellow, green, or orange + pink flags set. Only sprites 0-63 can have a hit sound.
### Controls
- Arrow keys - move playable characters in 8 directions, or left and right when gravity is enabled
- x - use/attack/mine/pickup
- z/c - jump - only when gravity is enabled

### Configuration
Note: this is all optional, you don't need to use any of this and can still get going.
If you want to customise the configuration of the game, just set these values at the top
level of the code in your cart.
- `bg` - colour of the background - pico-8 colour index from 0-15 - defaults to 0
- `mapw` - the width of the map in number of tiles - defaults to 32
- `maph` - the height of the map in number of tiles - defaults to 32
- `lv` - number of lives/health units player has - defaults to 100
- `g` - defines gravity - added to player's y velocity each frame - Defaults to nil. Setting any value makes moving/chasing/player-controlled sprites subject to gravity. Leave it as nil for 8-direction movement. Jump power is 20x this value. This can have unintended consequences.

### Sprite flags
![flutton instructions for sprite flags](/instructions.png)
* unset - background
* red - player controls
* orange - blocks player movement
* yellow - player can get
* green - hurts player
* blue - moves around
* grey - chases player
* pink - player can attack
* orange + yellow - is a door
* yellow + grey - player can pickup/move
* green + grey - attacks player
* orange + pink - player can mine

