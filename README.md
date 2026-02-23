# flutton
flags + buttons == flutton! pico-8-based low-code game engine using flags+buttons. Draw things first, make them do stuff later.

flutton gives you a tiny engine that can be bolted on to a visuals-only project to add some simple yet fun behaviours to the environment + characters already there.

## In action
![Demonstration of turning some static sprites into a basic game](/demos/demo.gif)

## Aim/Motivation
I watched my son create sprites and place them in the pico-8 map editor, he then wanted to turn it into a game and this wasn't immediately possible without writing reasonable amount of code. This is my attempt to change that - using mostly the pico-8 sprite flags to give different sprites behaviours and meanings. I hope it lets people without coding experience to turn pictures into playable games.

Other aims:
- Make sure behaviours stack nicely/not too many surprises
- Keep it under the ~2kb pico-8-edu link limit (I don't think I can do this)
- Make it somewhat extensible if you want to write code
- Enable a "minecraft" or "mario" clone without code
- Throw rules out the window if they become impractical - so long as the "engine" code can be copy pasted into pico-8 I'm happy
  - Since starting the project I am starting to think of it as 'flutton-mini' and 'flutton-max', the former being
- "I only want to make 3D games Daaaaaaad" - I'll plug in a raycaster one day

Other points of interest
- This is opinonated/biased towards making action-focused games, and the interests of my son - levels isn't massively important to him, neither is score. The features I have prioritised reflect that
- It's not the most performant code, and pretty much everything is a massive compromise in terms of how the engine operates. I know things like collision could be better, but for now it is more important it fits into a pico-8-edu url
- There are a few flag combinations that do not work at all at the moment and will result in instant crashes
- Weird overflow errors can and will happen, and in my home, that's part of the fun at the moment
- Hand minified for now :/

## User guide
### Getting started
There are currently three options to get started with flutton:

- Copy and paste contents of flutton.p8 into your project
- Use `#include flutton.p8` in your project
- Open it on pico-8.edu and use as a template there.
[pico-8-edu link](https://pico-8-edu.com/?c=AHB4YQ5UBcNnv8L9Z7-C8S8Q7Z4dNUV1wAUr3Qs8wV1v8RpZZsf74-ujQCQcC2Vzft6ddZEzVkaeoV65pxQKaOJ2pnuHnXyijHYW8o3qOJUAJYF2oY1uCuNnaD1grolMT8wYC111312dxvhbTmy8hCvmwpH_DR7BB93gRNpkM9XKUNRUG-ldB542clyzVJZP0Q5W8VTVHji5FXT2fQb79y3s1axYQ7P8t_qY3IngYFHcedq7FHEgVRCOOOBKLfTqJYsOjJtkWBDhyCFDTRkmMKz20WC4UkwqKxQWWBvMtAscMBHVS8FGLaUy0keZfslQl40uW27LcrElo910b_IR8knLHJk_g-xCt7vSbmYb6Yw5wmGvRZ2bhMLTF-bYTgqxEHNNjUzvNiu9K5a7ZiA5crAN1rJ0b6wJT81GVB2adG65DZIk3FheqKXF1QqNJKF8iV2qFfXYhUg5xT2KAnHcHhoGSSIfurAQhOHuzM5OHeZPoSC00LpYL2hEbUBsdCSOlyazic5qdVJ47gRPeOCEzHdr1YpvmqRVEud_EhS6449MOSQoZCmk0OJYgGFLiWK3qnv5QlFyaaBPgaxdeYzWTBIl6dj4Ac4aGdms1ztfLdXRBUvl3GgoJt5SYyFIBFUlSBYX3yNNhoTNJkcnx3TFoyr_-5NZUFmWGb_E17ExuzoSChevKYxHfWIq6xLZJh0o0fZjuFCU0WwyOWX7qS41W2Tz6iY7e_mg9pesnHcyueXtjbnQfUmu-V_Nj0pFoI5F7aZfIlsN20UXSVWoihywH64G0bxajV0WmqWtRqfWTPGCRv0GNOqlKTmsLicEYQYMCdAUbGa2pgZWdMm0BB0xkWhDq1Gs_Wg1vFZf-sdjrEkL6pLIehSL0XaUip7sZivLjtlQCHXFAcXwYimvH-Xxv1wU0ipu75hm4Yr4iGd6lkdpyslyYGl1qd_dmNwty1UPrHbr2e602LbE6Zp0_7e-HWwuaa5-wv9T-dndLi2wr6leeaOJXVHjExpNc2xrmkpI8WS49XSUjEaUM2SZpue9dIkQbbNzw5Ck1t4dQ3N900w0AtNDmTm2zG8lkd1Yk2dMiVvVix5CxIZ06ymNI1yn_iEmIy27lbtVvz4CXs7SrpAa2lipRPUKFS_BIUENc-TdkAnCvXZhaaLwQ_6XwO9QDcuFpjX1H14KkCbupbSKvhkRd5hI3TgSLUt2Cmp7Iu2zcH5C11PT-P8-eSx2D9LG0emX4D-ljsXb-8NXwB8wIVwQDFiq8pSk4Ubms5WVVrBR_XVBkUvkJWuTeAZVAmNHyQrrIbWWykTmNOD--9XwULIC48B4a2MgTaRbmkKwpVtmHfE-MB06oLmRZXJP4lsbaljRBYtSAWkbJrFqw560lKXSqkosD2mJfcmKPcnLNCjmyjk-pLJjF8iOo8ToEN2BLpGsAunwqPo-BBSOM6TNMXCMwkcRzuzNaHxEvY-ypHDDcDLsiY3EOZIbYzbJbMQd4c5OqNRJQCM0nHOAlOtiPVnKklR6W_mAD8QVgFLIAiQgBIIiYivh2kjT3LBS6fFXpqeWldLF1fvZ6qqhdkg9UnDL1gO2dHU5KKTqm518cnMx0xBdLCUnA3n5X3qjk4WspN6gby-wpS0VpzR8vLOViMwHVMI3tCNb1ReF4PklFywVtDWbD4jRCktVJ3RJouSws93MbQ9OV9VqESmJFLrCgSY6PLOs6pHGZ-i190uQJAq3ckJqVQpJuiKiNWZIzAKk4iiqYkblLmJNobFeMqADmoAMZYI6J2zApThSrwgUdVApNCOC5yhta8oKFNSYQ_MAW4Oj_JcGQCAadcJD0lpdZy1qEYYgcRkDZoP0wr_5fsrGe4uL04dI50uqVV5JZmJgYCGBcHHIoB9CPzJohWyCDPr--9J6TMbkaIpNbfT-l85OMpnsoEWI3k4vln7JEy1Ik4ml-69e_COW-v-HQhcmOl90HQg=)
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
- `l` - number of lives/health units player has - defaults to 100
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

### License
[BSD 3-Clause](https://opensource.org/license/BSD-3-clause)
