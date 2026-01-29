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
[pico-8-edu link](https://pico-8-edu.com/?c=AHB4YQ02BVNnv8L9Z7-C8S8Q7Z4dNUV1wAUr3Qs8wV1v8RpZZsf74-ujQCQcC2Vzft6ddZEzVkaeoV65pxQKaOJ2pnuHnXyijHYW8o3qOJUAJYF2oY1uCuNnaD1groksabfqLIjLsi2lxTQCJuLuIQ48LNcbf9ORlZdwxUC5kj-CK-igW5xIm2ylGlmKmmokP_zC20aua7bK8inaxSreqtoLN7eCzr7vYP__hb2aFWvol-9WHZM_ERwsikNve5ciDrRKwhEHnGmI9zHE3qIddlTSq6QsQTBvkmmphDO3DLVmmMCwkilqS5ujy_VjWE1_oVlO_4GxZq5ZahpzLKRNM7RgmsQHuiu_6ARO1tJIcCHwVOq5Ac8m0_Xk4Dv0o565M30JxyiyLIYb0-FsN9GqsaiEbRvOTpLh6jPHzCeFQEhiL5mC5amN1jfbWRMndw6mwVSWjs834bXZim1UIZp0bL0NkiRcWF_oPRNpDretn6KySuYMFc4o0E5Eiiv_W1gIFOMSv2kNDAz0t8ZBkoiKQyVse2GlruNkdWHzoJVArSawsWrQjBKBEDkW4rXNkYnMizoLW7O_vMIXHrii81aQpULiUzoYT4KilxyHbDlkLQRCRJLiWOIgkbQZrmI505UpSfRLcWx0uo-tKEzSDs6f4M6Rkdl8vvPmVh3dsFqO7oYz8uZOBRiCRmkdUkWbD5ImlaTZ-uromML49MX--9JckFyP5Pipw565rWp0MQptp7UuQUM9w5luSsHd08VOZT4Jd5nJMQL7FKxJ9KsULVbWIrmUppOhk2FP165LvZhrIRuqQ53_UkRAsBPtloX43XhYPMXqsrbGnk2ULitlvgOyzSDa1xuZ1huSttuuq7GRRlpM1F69qL0EqaLN0a1p3TkRDjsxT4C2uPqtvS2pcuWBGqZ2ULQ40gws1Vvd9OhsqXwvGfoFoSqPJEHpBFEebZSN0jB6ZYnbFEt1yfbKUM-XT-vr6aZgf_TTk8qyQ5mwXtovBbwV3K7YPOKZ3uVVmnZ0RPRkdmJnpNjczYZms8wFs0nYnbGp7DomgL45YVPhX_H3Ry5HZqiVxNBTWrzBS5fMafxG-REDYlkjd-QjG02z25huxPSXrEYqtDMiri34hQEhhBqsOg9xO_E5mbVRjfW5SX8_Wn8S8dHxqgtdXGkugRg9LNeq3T9wEyA6-v--xSJBgewUaQfp4Vdan6JkEuv-KatsFIwPanOVh9hcpalDUwSmCUwnuv7-Hy_ILjSS3NVKE80lghKrUSIokZQrKCL_B1hD6zBLwjDRDAo0w-Su5sqsjZJ2wYe9LbquDMOk63xY5KobtlDTEW44QTBiW2pWd3BcdzyaPMJjfVBo8sFM_P9AQzjm5T5m47ZptrNjcCQo3h-hkSAftSOFG9BA4ApTlM34kjekLmy0YSM1fmcnZFJU4hseaIBGJFS36nIfKBWAntAxGvtVv8m0vIRrFtfFaQReVjc2pvIlfcdIw8bWe7Z0PQdd1YuF_wxbup4jWaCTLcAPNa8F9a6wKITKL6laqfIovqc4YTBJlBUGbmhmjpCRSDaO2BH_kBJohIUDKXN4hmIEFtLmDr8O_CVIEvFZQaFCA6sZ1cFZExfxU_WXwC_rUrWiQxKq3CaahcWgNL2m20kEE1vakBSIV4Yn20yjpnaCesxECmCCbdH6RVSwQC_RKR07S6lSG8IdtCTmF_maDApDVDI2VkeGcv1qAg7VIInVh9SxYtFqpBKYm4wHz1CvF3OHKirJfWykI8mO1PlTSJ3-leKROkt0E6TO----N6N1-v_VH2qlx7TO-99tFiXyPQ==)
