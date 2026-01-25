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
[pico-8-edu link](https://pico-8-edu.com/?c=AHB4YQ5NBajpenDOJc3Zr3D-2a9w-AtE02dHTVHdcETbvcLlz3D99be9xWuUpWP6V0ifwRXpQhtqhWekarKF7rSrnLEz8xB9f1QpFtDE7VA3M5RPlNHQQr5RnacSpinQLrTRWWH8Dq0H-DWRJe1YnQVxWbaluphGwETcdWPdwIWn9crjv_KRlZdwxUJcDjzCK0xpCIystXZo5xaaptypRrYiwYKB2zZXZ85r1tL4KdLJam6uak8cnQs6_w69w87KVDMpEt63EAkKlwTPZM3-SZAposgOFsWhx71LsRDoF9ZLDrjTE_-jic3VzckNR8xJqFdbPduS5Ji3OgpdhTsnzTVqq2BpeWjJtSIrGk3Dy3n-GFbbzA-QTypmdkab1WawaUyhP1QUeyvWTIIkSDRb7FFpoWM1bCQbAmeFzhvxbDJRakK9Qzttm0PDlzCNpsvq_OBeu90ttHouQkHdsOHspBrevDPNBUmhESIYJl6wPjYR_2awaurk0MkymMrS-c0mvCJbsY26RJNu7bdBkoQLqwu1ZyLZ4bb1U1RWyZqhwh1B24lIosV-CwuB7FziN62BgYH_1jhIElFxqISNL6zUtbzFAXWzOrF50EygfBPYWDloR41AjBwT9d7sykbmRQU2F7lTK6_wWR65Kkg6UfEpH2wnQRFLkEPGHFoZAiGiSWWZqA8FUpmzVSlyOrEjlH6pj6sdXL6idqViSTy3f4MdpTmGVvP5zJ1TvZpGtL85NLka7oifO5VoCBotdogXLT5ImlRi49vfHBhTG9_W2Pj--5BoUGiP-vgp2965hWzyiqi0njS7ZI5VDpfDKdl3Txc7lfk032UmR0leyPYEJmGi8EP4JtHBUsaYWYtk1bTstNspybWuGKO8NJEsxZ2YeDkmIBhqd4X0xsPiKWaXBTv2bCKZWQn-HZBtBtG_NMm05pBGriI_tiYl8SVlVW3uLk0r1ql42Im5AgTFFS-tjamTqw20NLWDotGF7aF6Khuf6VTzJVm-oFP02dyci50g6COJUqSGkfGqGrfpi8oS7qW1Qu_cofbrnUm5-yimp9RnhzIhGgZ08t9Sbmd0VzzTu7xKE04uiJ5s9oMLxeJotjKaZS4YTcIOIoOVXnd00LemcEoPoZI9HtF9VtYVHCq188SV9k6w6ylLirxRfUIurDVxRj2x0DSrjekmTH_p8KXifBNq3Fpcqn5HwHOwGvkk8MToNNgmBdjnJk16yvkJskeXNy80dEW9VWTUs5wriX7iU4AC_f--L_GEBiJVbuo7BXhpsZ8aZWLs-z8BZqMwiFCd6EPU5kpNnZoiME1gOnn2---HPKITjZB3NdJEa4kixQFRokiRpDNEJf6Hl0P7MEvCMNEMCjTDBLPWyqyNknbChwu26LoyDJOu82GRZytKN4I8wg4XyEuMa9PqDo7qjkfWR3hsIChk-bAo-FHDH4eHJgProhzDYd000_EdDBOUT5cQE_SjdKVImET0CF_U0fKWPdQxbDRiI0F-dxdkkjX6PR5oUCtM0mplYjJKvCEyoInmo7RdSzlNJBHMjSesoGlAt0LH6PgfkjqxjpcOzua6yI0mzCU7O2vtgiRkpIdj69qWruemqzbEwn2GLV3PhSyQ3Rb2n0DVgjhVWBRq5afQrV55JOJTnDCZJFoMAzc0Q0foTiQbN4wckQ1JX_gJZOrCgaQ5PANeAhtxc4dfJ-wSJIlgraZQIZ-V7EroDOqL_KnyS_CXYXlb3SEpVewUzcJiU85eg-koOIptrUgKxDvbo22ma1M7QXFGtgwbxdI0tYyuoHGYUWRMAc9VetbNjHIY6QlaRvcmm5mEa6GV2ZmtAfFr5A6TIslFiIS1cr1rEBRYHO3bM3hA3KAfoq2kDjGSriRDiudPoXj_V8VH8SyRT1A8----f3ckz-9-KkStApnk_f_7zaIkcw8=&g=wG4AQ0Ew-wq4CA0Ew-wp4E0Ew-wp4E0Ew-wp4E0Ew-wp4E0Ew-wq4CA0Ew-wr4AQ0E)
