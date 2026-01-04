# flutton
Flags, buttons, why not both? flutton! pico-8-based low-code game engine using flags+buttons. Draw things first, make them do stuff later.

### Aim/Motivation
I watched my son create sprites and place them in the pico-8 map editor, he then wanted to turn it into a game and this wasn't immediately possible. This is my attempt to change that - using mostly the pico-8 sprite flags to give different sprites behaviours and meanings. I hope it lets people without coding experience to turn pictures into playable games.

Other aims:
- Make sure behaviours stack nicely/not too many surprises
- Keep it under the ~2kb pico-8-edu link limit (I don't think I can do this)
- Make it somewhat extensible if you want to write code
- Enable a "minecraft" or "mario" clone without code
- Throw rules out the window if they become impractical - so long as the "engine" code can be copy pasted into pico-8 I'm happy

### Sprite Flag Instructions 
![flutton instructions for sprite flags](/instructions.png)
 - unset - background
 - red - player controls
 - orange - collide/scenery
 - yellow - player can get
 - green - hurts player
 - blue - moves around
 - grey - chases player
 - pink - player can attack
 - yellow + grey - player can pickup/move
 - green + grey - attacks player
 - pink + orange - player can mine
### Get it on pico-8.edu
[pico-8-edu link](https://pico-8-edu.com/?c=AHB4YQ3yBWHpenDOJSbYvPr8w09PmvDyV4guf4XuBaL08KgpqivOaLtXuP0Z_vOPe4vXKEvH9K_QPoMr0oU21ArPSNVkC91tZzljZ_Yh_v6qUiygiduhbmYonyijoYV8o7pPJUxToF1oo7vC_B1aD-hrIkvasToL4rJsS3UxjYCJuOvGuoETb_uVx3-FIysv4YqFuBx4hcUpDYGRtdYO7dxC05Q71chWJFgwcNvm6sx5zVoaP0U6Wc3NVX44cXQuyARCh95hZ2WqmZQJ71vIBIZLomfS5v9kyFRRpAeL4tDj3qUYCDQM6yEH3OmJ9-HE5urm5IYj1spQSL0K69mWJce81VGoK9y5aK5RWwVLy0NLrpVaUWoaXh5YeAyrTeYHqCgVOxObzWgz2DSmUCAqir0VayZBEiTKLfao9NAxHDbCDYGzQueNeDaZKJWh3qGdts2h4UuYRtlldXxxsN3uFlpVF6GgbthwdlINb96Z5oKk0AgRDBMvWB_biH0zWDV1cuhkGUxl6f5mE16RrdhGY6JJt-bbIEnChdWF2jOR7HDb_ikqq2TNUOGOrO1EJNLiv4WFQHwu8ZvWwMBAf2scJImoOFTCxhdW6lrk4oC6WZ3YPGgm0L8JbKwctKNGIEaOiXpvdmUjOsGMEmwusqdkXmKzvnJVkHSq4pM_WE_CotYgh445JDMEQlSTujKRHwoUM3erVuV0Y0gp-VIfV7s4fUUtWa69edFShY6h1Xi_cudULaoR7W8OTa6GK_rnTjUagkaMHeJFiw_SJpXY_PY3B6bUxrckNv7-PzQaJNqjP37qtndtIZu8Iiqtp81YD9pV6EzncDldUn73dDHUmU-2XWZylOqFck9gEjgKP7RvEikscYydsUhYTc5OvZ2qXOsjC7Paa0m0NVCKiRdoAoKpeldLbzwsnkIsYK8pbKKaWWj-HRDtBtG_NMm05pBMrig_SlF8iVlFm7M7y_2Ijqed7miSJUFxRUuDW_rkqgM5TfEgCSWx_ltheKpaU-b10wGzu6l0f8TFb8wLqES81djumDrjWR4lybYWdUvWNk4YSMb2MrYLiSIfzPlgo2LCYL3WETXzDeqVYkCoro9H1JsVcjWHOg08jaSdA_y6NSP7G_3tTwpkbVxRbww0zV5jugXTX2p6qcjehKq29pc63wUsHKxGPik7STl1j-X1aFlLRlmm6N2qLE-lP3eJSop5DjRa_JDnloNRwfJmWaiin1m1LkL_--8LK6GN3JSbJioFeMmxnyJleuz-Pw1mo1CF0EIiE7FgrtzUuSkC0wSmU2j-rfhR3rGsJRJpiWQCCoJisfeTeSPwdjCZKLv-ox9RKR6EEv_jmqU7MqQ72vaNXo8AjO80B30fhYcLdCZKkVp5wQV58aj16ItNBYVaPygnnLL4g4hwbKt-jJcjTbOc3YEkQXtEEuSCMi8SwhDdd4U6ik0GbKTo7_aAUrBGwU_-j6dEKjXcLLWCTgGJCt0i0n-o5VQiXSI3izv6NWovO32-PLIk9hiJ3dh6x5au556rFsTCvW1L13MjCzS1VfsnPbWg_haEauWnhK1eecBHLBQOyJr9tSTRVxg4oJm5QBki2Thg5IJMTKSSFg70zFGmZCQQi125JXaL4o1GTrK6VDWzykeIJ8p1gnqDy-Felmn1ZZ36yGSZsJqQ5lhvrbIsLSNGVBoLy0R2NOlcJTAdVcphMCVoGYGapYVFfhXqJ8OZITVqpA3TINmQHzdeiWdiQtVTz6TywPDYROEdXA-xPFZXtoLAd_L1HNU06codGXSkMui-VdB6GfT---_r0kH--0N-XDroanTQIUYT6KDXkzrof_wA&g=w-w-w-w1HQHw-w2Xw-w3Xw-w2HQH)
