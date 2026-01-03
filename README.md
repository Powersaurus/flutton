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
 - yellow + grey - player can pickup
 - green + grey - attacks player
 - pink + orange - player can mine (image needs updating)
### Get it on pico-8.edu
[pico-8-edu link](https://pico-8-edu.com/?c=AHB4YQ0_BTbpenDOJSbYvPr8w09PmvDyV4guf4XuBaL08KgpqivOaLtXuP0Z_vOPe4vXKEvH9K_QPoMr0oU21ArPSNVkC91tZzljZ_Yh_v6qUiygiduhbmYonyijoYV8o7pPJUxToF1oo7vC_B1aD-hrIkvasToL4rJsS3UxjYCJuOvGuoETb_uVx3-FIysv4YqFuBx4hcUpDYGRtdYO7dxC05Q71chWJFgwcNvm6sx5zVoaP0U6Wc3NVX44cXQuyARCh95hZ2WqmZQJ71vIBIZLomfS5v9kyFRRpAeL4tDj3qUYCDQM6yEH3OmJ9-HE5urm5IYj1spQSL0K69mWJce81VGoK9y5aK5RWwVLy0NLrpVaUWoaXh5YeAyrTeYHqCgVOxObzWgz2DSmUCAqir0VayZBEiTKLfao9NAxHDbCDYGzQueNeDaZKJWh3qGdts2h4UuYRtlldXxxsN3uFlpVF6GgbthwdlINb96Z5oKk0AgRDBMvWB_biH0zWDV1cuhkGUxl6f5mE16RrdhGY6JJt-bbIEnChdWF2jOR7HDb_ikqq2TNUOGOrO1EJNLiv4WFQHwu8ZMvFAelBZQFhMURbE9NRm10gBnl1FxkT-m7xGYHVK4Kkk5VfDIG20lQ9KpD3cSSJrnkLwRCFJCSNpIfCtQvN7sZxdJsSPX8Uh9XvDZ8Qy5ZrqFx0VK1jZHFeLxy51ItkBGtjy1NLYbq50eptxAkwuoQL7r1QcpkR2x881sDU2rjWxIb--8fWRcUUuPSH78WNdMhcjI3Uc4fEcXW02bMF_0qdKZzuFtPKYh7uFjqzDc0JPsOMzlKwUKFJzEJ6IQfOjaRrJXQRbNWCatJ06m3U_Nre2NkXnsticYWSrH-wklAMJbP6uJth8VTiAUMNoVNFDALHb-9aDiI5qVJ1jSHJG8F7lEK3EvMKlqZ3VluRzQ57XRGkywJiitaGtxSJ1cdSGOKB0koidXfCsNT1ZpKr5-2Z3fV-xGk4uI3sgVUgtySf2dMXfEsj5JkW4u6JWsbJwwkY3sZp4VEkQ-mfLBR8V2wXuuImvkG9UolfQV9PKLerJCrOdRp4Gkk7Rxg160Z2d9ob39SIGvjiHpjoGn2GtMtmP5S00tF9iZUtbW-1Pku4NpgNfJJ2UnKqXvYbVdORlymqefXGzeJy1P8z126knqeA5UcPhS6FWGEsLxZFsLop1aYMvr-Tw3ZKKwe1C8INgyYqzZ1bYrANIHptNJ-a2_kZwxriURaIpmsh6BY6v1k3gi8HSwmGuv-mEJUFAdMxP-oV_mO7OiOxn2jnCPr4zvNQd9HaOECxYdSi1decEBePLo5_mJLQaGbD94Ip0D95PwxreKxXW40zXB2BhwEzbFBkAvKvPCCJopNehsp6rvYD9ViFPT089hEpFKjrUorqHpQndApIvmHXk0lzKUwszcjHqPxMpPnuxtDEo_R0oytZ2zpeq65akEs3Mu2dD0PyAJBa9X8SXEtaL0FoVr5KemrVx6IEAuFA7Jmfi1JVBUG9puZA-Qgko39kQMyMZFKWjjQM0eZUoZALHHlltgtOjfKOMnoUtWsKh-hkigjCeoNDsd7WabWl3XqI5Nlwj1CmmO9tcqytIwYUWksxBHZUaJzlax0VCmH3bENygHBDZaRpRkbGWVBoYnVdmlLgxopwzRIZuTHjTfiWVnR8tQzqTwwvbdSeAeXQzyP4aG5IPCdZD13NU26ckoGHakM_m8VtF4G-f---6p00P--0B_XDroaHXSI0QQ66PWkDvofOwA=&g=w-w-w-w1HQHw-w2Xw-w3Xw-w2HQH)
