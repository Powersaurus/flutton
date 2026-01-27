# flutton
Flags, buttons, why not both? flutton! pico-8-based low-code game engine using flags+buttons. Draw things first, make them do stuff later.

flutton gives you a tiny engine that can be bolted on to a visuals-only project to add some simple yet fun behaviours to the environment + characters already there.

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
### Using flutton
There are currently three options to get started with flutton:

- Copy and paste contents of code tab 1 in flutton.p8 into your project
- Use `#include flutton.p8` in your project
- Get it on pico-8.edu
[pico-8-edu link](https://pico-8-edu.com/?c=AHB4YQ4bBaDpenDOJc3Zr3D-2a9w-AtE02dHTVHdcETbvcLlz3D99be9xWuUpWP6V0ifwRXpQhtqhWekarKF7rSrnLEz8xB9f1QpFtDE7VA3M5RPlNHQQr5RnacSpinQLrTRWWH8Dq0H-DWRJe1YnQVxWbaluphGwETcdWPdwIWn9crjv_KRlZdwxUJcDjzCK0xpCIystXZo5xaaptypRrYiwYKB2zZXZ85r1tL4KdLJam6uak8cnQs6_w69w87KVDMpEt63EAkKlwTPZM3-SZAposgOFsWhx71LsRDoF9ZLDrjTE_-jic3VzckNR8xJqFdbPduS5Ji3OgpdhTsnzTVqq2BpeWjJtSIrGk3Dy3n-GFbbzA-QTypmdkab1WawaUyhP1QUeyvWTIIkSDRb7FFpoWM1bCQbAmeFzhvxbDJRakK9Qzttm0PDlzCNpsvq_OBeu90ttHouQkHdsOHspBrevDPNBUmhESIYJl6wPjYR_2awaurk0MkymMrS-c0mvCJbsY26RJNu7bdBkoQLqwu1ZyLZ4bb1U1RWyZqhwh1B24lIosV-CwuB7FziN62BgYH_1jhIElFxqISNL6zUdZyMLkwetBKo3gQ2Vg2aUSIQIsdCPLc6MpF5UX3NRe7UyStsdkHkqiDpRMWnerCdBEUsPw4Jc_hkCIQIJpXCEkWgkTkbheqmEzsK6Zf08ODyFa0jpUrSuf0b7KjHMbRaz2funMolNKL9zZ3J1XBG9dypLkPQCLBDtWjxQdKk0jje3xyYUxqfzvj--5BkUGSP9Pgp0561gWryiii0nRS71I3FDZe7JYl3Txczlfk03mUmR8lbSPQEJuGf8EPkJtG8UsFYGYvU1HTrtNqj-bUuD6O2tJAMxZ2SeIElINhpdxXzxsPiKVaXlTnmbKKNWSn8HZBNBtG_Lsm04JAYrvQ9Wul7yVZFk7M7y_p0ah12YqsAPXG1O2tT4uRKA81M7aBocmB7ph7Kxlc6dXzJ0y-olHsWF8diJwj3yKEUqWHkuqrGbfqisoRraa3EO2ao-Xp3UdY-gukptdmhTIiAAZ3Mt4zbGd0Vz-Qur9KEkwuiJ5v9BQvF5Gq2spplLlhNwg4Wg1Ved3TQt6ZwSgmh0j8eUWrH7gGJ2FArlSestHiBXU-ZEt_N_q7X0do4I9_YaJrZxnQbpr9E91Itvg3xbektAb8jADlYfVr2ToBOe21TeH1u0qGPbJ8Ke8R_80I0V7xLNkYqy7Ua6AcXBciO--9-oUtoIEflpr7Tepfq_iFMJrv_-5NaNgpRCNWJCkRtrtTUqSkC0wSmE2L--38EIzrRqHVXK000l_hOHBAluhNJusNH4n-oN7QPsyQME82gQDNMFmuuzNooaSd8uGCLrivDMOk6HxZ5tqJnI7uj5HCBkMS6Cq3u4KrueMR7hMcGgkK8D3zCH837oUU45qU3lru4abazO0AlqN5eIZUgH7UrRUIYokf4ooymt_yhg2GjERvJ9ru7IBOoUunwQANTYQJWKxOTUeINkQFNNB_l7VpKXSKJNG48YQVNA1YVOkatn_KZsWKX8M3mvLKNJswlOztr7YIkZCSAY_valq7npqs2xMJ9hi1dz4Us0NmW8J9A1YI4VVgUauWn0K1eeSTiU9wwmSRaDANHNEPLuhPJxg0jR2RD0hd6Apm6cCBpDs9glMBG3Nzh1wm-BEkiWKspVMhnNbsSOoP6In6q-BL4ZVjeVndIShUiRbOw2JSz12A_ioFiWyuSAvHO9mib6drUTlCckS2DQLE0TS2jK2gcAhQZU8BzlZ51M6Mcxm2CltG9yWYmUVloZXZma0D8mqvDpEhyESJhrVzvGu0EFkf79gziDzfKh2grqUOMpCvJkOL5Uyie-1XxUTxL5BMUz----98dyfP-nwpRq0Amef7-brMoydwD)
