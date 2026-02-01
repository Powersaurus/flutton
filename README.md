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
[pico-8-edu link](https://pico-8-edu.com/?c=AHB4YQ5OBaJnv8L9Z7-C8S8Q7Z4dNUV1wAUr3Qs8wV1v8RpZZsf74-ujQCQcC2Vzft6ddZEzVkaeoV65pxQKaOJ2pnuHnXyijHYW8o3qOJUAJYF2oY1uCuNnaD1groksabfqLIjLsi2lxTQCJuLuIQ48LNcbf9ORlZdwxUC5kj-CK-igW5xIm2ylGlmKmmokP_zC20aua7bK8inaxSreqtoLN7eCzr7vYP__hb2aFWvol-9WHZM_ERwsikNve5ciDrRKwhEHnGmI9zHE3qIddlTSq6QsQTBvkmmphDO3DLVmmMCwkilqS5ujy_VjWE1_oVlO_4GxZq5ZahpzLKRNM7RgmsQHuiu_6ARO1tJIcCHwVOq5Ac8m0_Xk4Dv0o565M30JxyiyLIYb0-FsN9GqsaiEbRvOTpLh6jPHzCeFQEhiL5mC5amN1jfbWRMndw6mwVSWjs834bXZim1UIZp0bL0NkiRcWF_oPRNpDretn6KySuYMFc4o0E5Eiiv_W1gIFOMSv2kNDAz0t8ZBkoiKQyVse2GlruNkdWHzoJVArSawsWrQjBKBEDkW4rXNkYnMizoLW7O_vMIXHrii81aQpULiUzoYT4KilxyHbDlkLQRCRJLiWOIgkbQZrmI505UpSfRLcWx0uo-tKEzSDs6f4M6Rkdl8vvPmVh3dsFqO7oYz8uZOBRiCRmkdUkWbD5ImlaTZ-uromML49MX--9JckFyP5Pipw565rWp0MQptp7UuQUM9w5luStFJPErP-ZsudoQiBd1lJsfI7VO_plCz0rdYWWvEU5pMlE6UPVm7LvxiroVsqA5V_8sUAcFOtFsWUnjjYfEUq8tKG3s20b2sdPoOyDaDaF9vZFpvSOhuu67GRhppMYl79RL3kqeKNkenplXoJDnsREAB2uLqt-a2pMqVB9qY2kHR4kgzsFRvddOjs6UOvkTpF4QaPZIEpRMkerRRNkrD6JUlblMs1SXbK0N1Xz-tr6eb8v2RT08qyw5lwnppv5TzVnC7YvOIZ3qXV2na0RHRk9mJnZFiczcbms0yF8wmYXfGprLrmAD65oRNMSBU_P1ZnQ62dvSaF5bkWlykV55BEXHosawu1xYYVGQvCYSIwwxup7O7S_u5X3wT3WAlCfRtS6BLlQmSw63po35U6XbIPDWNly4Ru27WjphT9Fq8Y21nsGlmGtMNmv7S-kjVegYVuvW5WCUEo4PF8KHAp4en-rYk-T43yeJH20_5PrARtFOI9-JDkG6NaI_rRfgfAgsQHf---wKmoEBwMc905qX4-4iSSaz-p6yyUVhDKE7EJ2JzlaYuTRGYJjCd6Pr-f1AjutaQQnC11ERbic7FeJToXCTpHi_J-6Hq0DzMkjBMNIMCzTAZrp0ya6OkXfDhgC26rgzDpOt8WOTZyJQtRH6EG04QjFiSmtUdPEB3PMgcIjy2EBRScYwV-j8sE44LtD6qLm6atewYSgqqF1cwKchH7UrhBn4RuMIUZXPAljekLmw0YiNICHc2mUlRyTJ4oKEukVDdqst9oFRAo0LHSP9X-SYT2RKuWbxAnEauZ3ljYyuf0neMNGxsPWhL13PRVb1YuM_wpes5kgU62QL8UPNaUO8Ki0Ko-JKqlSqP4nuKKxaTRFlhYLqZmZaRSDau2BH_kBJohIUDKXN4BrUEFtLmDr8O_CVIEvFZQaFCA6tZ1cFZExfxU_WXwC_zUrWiQxKqcCmahcWgNL2m20lOFFvakBSIV5Yn20yjpnaCesxESomCbdH6RVSw4EORKR07S6lSk2mgJsbG6siQrX0TZqgn-sB5oA5Jq0CkkJXmG_MBTYhWrCKeIoDDML3wCxLFF2zsbfaLd_jeCyJEtZiEJGb6naQVSX8KkfS-Ij4iaYnigkj6------_PAlGuPiaS-r964RRJ--8vr5pEoQc=)
