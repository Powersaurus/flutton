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
[pico-8-edu link](https://pico-8-edu.com/?c=AHB4YQ4jBalnv8L9Z7-C8S8Q7Z4dNUV1wAUr3Qs8wV1v8RpZZsf74-ujQCQcC2Vzft6ddZEzVkaeoV65pxQKaOJ2pnuHnXyijHYW8o3qOJUAJYF2oY1uCuNnaD1gronMVOEbZI0z8mqlC8YG0jpUGXPGSB4deFipPP4OrMy8hCvqcKB_hA0fdIMjaZMNVTtLUVNt5HcdeNrIcc1WWT5FO1bFU1V74ORW0Nn3Gezft7BXs2INJfPfqmMiKIKDRXHnae9SxIFUQTjigCv98D5_2HPDjFp6FZUFCNZNsiyZcOWUocYMExhWHWmyHSrKYlN9obDA3mSnZOCAFRMMjAUzueDKzkCU6plsddnqsOXmLBdbMhpOJzdeIR_1zJXpO4g0dHoryUC2YY5ox2tR7Cah8MSFPcYTcTbzDC1sDzcTS65YDpvl5Mq9NhjL0rmtJrw1G9F_aNK16TZIknBjeqGWFlcrNJKEAiZ2qVY0ZhciJRX3KArEcXtpGCSJfOjCQhCGw3oQadW_hYJQHrpYL2hBbUBsdKEslxazvrPaUFJ47gZPeOCGzDdBVAqIczkJCrnxR50c_hTy9BWkmE1C0UIpcimfT3dsb_81OjMJk_RT4wc4a2BgMx7vfLVTRxfslFuboZh4S2WFIJFRFcjZm3uQNNmUM5sdXdzTFY_q_P9PXEFbWWb8klvHxuzqSChcPKYwHs2JqaxLxJrUn6TajxsKHRmlJpNTvJ_CX6tFNq9usrOXrnJBkJicdzK1tXJb0MVbG7WWfnU_Ig2BqBWym36KbLVOB10kT6EpcsB_uBpE82qUA83QVBMvKNFvQIleypHDGnK6D2aAjwAVwWZlamlgRYmwCBRglSbGfDTapYOTMvK-ZCmnokZcHPPz1ZxGfsTFL8QJqcSyVcSOmL3hmd7lVZpubmhrZXJgYqJY2wzDwSxzwWASdourStnKpWMK7N-2bDC2I57_qfZPsmdxtrTAmFR6xYzyWS3zc1TLHPJewu2VxdAy2hDAUFva3PXSIXqyzcwBO8pYY1fsbNVNs9DoRO9k5pgyv5VENmNpnS1BbZkv6Z_pnUaC3Ao3_nPiHbIQwlMyNEnvVhn6iHo5S41CamhlJdLGK8S4BIZ0McwxEHYmCGfbhaGJwg_5XwK-QzVMEP9BnABB4l4Hq__bEUmHidSNI9Gs3qYetifSPgsvnhDlVDL--0-rCsqDhG5k9qXWT5Fjyfb-8BWzB0wIFwQDlqo8JWm4kflsZaWVadR7XZDXknbJ2iSe4YzA2FGywnpIraUyaTnl9-9-8UJE6odlA_OpjYE0EWxpCpmWbhhixP-wb_hAVyVdJ-IkubWhgTdUdmmXtLUPh7ouDcOk63xYaDmM6TqOrWtVFFqXfVCM1bEfOuWxbeVxtPAbIj3QJVpV_BseOf_HaMJxhbo5Fo6R9ijCem5E3CMa8FGeFG5YTW7wxESyPmYNsQ0bdTZijnB3V2TyJJAR4oGmnHOAnOtiPlnqklRKW_2CDwQWaFHIAgAfRHkigivl1ErT7M9USvwV6MmlpeR1RCCUvoa7aqldUpCU2rL1gC1dXS4qqfpmKN8cncw0RCdL2clAYv6X3uhmIS2pN_jbG3xpS9UpAR3vjCVC80GU8A3tSFf1RSF4fmnpSp5LNWhqNB-QptWZqo7okkTVYWe6mZtenK6q2SISFSkkhgN5dHhmWeQjja-wa__XIEkEb_WExKvEknRFNGzMkJgFKcVRVMWM6F1Ei0JjvWRARzUBGc8EdU7YwENxpF4RKOqwUGhGE8txOteoFaivMbfcbNga-cS-OMD70KwUHlLaKktrEYgw0IjLGEQbpBf_7S1s2XhwcvKGO2T0pdoqr6Q4MdFvJBgtDhn0Q-dHBq2QTZBB--9fWo-JmjJNMaqN-v--oUbUK5Fpo-_vXvijjf7-R99UiX4P)
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
[Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International](https://creativecommons.org/licenses/by-nc-sa/4.0/)
