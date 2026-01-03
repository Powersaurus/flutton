pico-8 cartridge // http://www.pico-8.com
version 43
__lua__

-->8
-- engine
function _init()
 saved={}
 init_map()
end

function _update60()
for _,t in pairs(ents)do
t:update()
if(t.del)del(ents,t)
collide(t)
end
if(p.lives<1)init_map()
end

function _draw()
cls(bg_colour)
camera(
min(mapw*8-128,max(0,p.x*8-56)),
min(map_height*8-128,max(0,p.y*8-56)))
map()
for _,t in pairs(ents)do
t:draw()end
camera()
?"♥"..p.lives,1,1,7
?"◆"..score,1,8,7
end

function init_map()
 map_height=map_height or 32
 mapw=map_width or 32
 ents={}
 blocks={}
 p={lives=1,x=0,y=0}
 score=0
 lives=100

 for y=0,map_height-1 do
  for x=0,mapw-1 do
   t=saved[y*mapw+x]
   if(t)mset(x,y,t)
   t=mget(x,y)
   saved[y*mapw+x]=t
   f=fget(t)
   local e
   if (f&2==0 and f>0)
   or f&16==16 then
    mset(x,y,0)
    e=new(x,y,t,function(e)end)
    add(ents,e)
   end
   if f&1==1 then
    e.spd=.5
    e.lives=lives
    e.update=update_p
    p=e
   end
   if(f&8==8)add(e.hit,function(e,t)if(fget(t.s)&1==1)p.lives-=1end)
   if f&16==16 then
    e.update=upd_move
    e.spd=.075
    e.delay=30
    e.timer=rnd(20)
   end
   if f&32==32 then
    if(f&4~=4)e.update=upd_chase
    e.spd=.15
    e.delay=30
    e.timer=rnd(20)
   end
   if f&4==4 then
    if f&32==32 then
     add(e.hit,upd_pickup)
     e.spd=.25
     e.delay=0
    else
     add(e.hit,get)
    end
   end
  end
 end
 if(init)init()
end

function get(e,t)
 if(not e.del and fget(t.s)&1==1)score+=1
 e.del=true
end

function mine(s,x,y)
 x=x\1
 y=y\1
 local e=blocks[x..y]
 if not e then
  e=new(x,y,s,function(e)
   e.dmg-=1
   if(e.dmg<-1)blocks[x..y]=nil e.del=true
  end)
  e.dmg=0
  add(e.hit,function(e,t)
   e.dmg+=2
   if (e.dmg>30)mset(x,y,0)e.del=true
  end)
  e.draw=function(t)
   ?("░▒")[t.dmg\16+1],t.x*8+1,t.y*8+2,bg_colour
  end
  blocks[x..y]=e
  add(ents,e)
 end
end
function upd_move(t)
 t.timer-=1
 if t.timer<0 then
  t.vx=rnd()*2\1*2-1
  t.vy=rnd()*2\1*2-1
  t.timer=t.delay+rnd(20)
 end
 update_e(t)
end
function upd_pickup(e,t)
if pickup
and not t.act
and fget(t.s)&1==1 then
t.act=true
e.timer=0
e.spd=.25
upd_chase(e)
else
e.spd=.1
end
end
function upd_chase(t)
 t.timer-=1
 if t.timer<0 then
  t.vx=1
  t.vy=1
  if(p.x<t.x)t.vx=-1
  if(p.y<t.y)t.vy=-1
  t.timer=t.delay+rnd(20)
 end
 if(abs(p.x-t.x)<.25)t.vx=0
 if(abs(p.y-t.y)<.25)t.vy=0
 update_e(t)
end
function collide(e)
 for _,t in pairs(ents)do
  if abs(e.x-t.x)<1.01
  and abs(e.y-t.y)<1.01
  and e.s~=t.s then
   for _,c in pairs(e.hit)do
    c(e,t)
   end
  end
 end
end
function new(x,y,s,u)
 return {
 x=x,
 y=y,
 s=s,
 vx=0,
 vy=0,
 draw=function(t)spr(t.s,t.x*8,t.y*8)end,
 update=u,
 hit={}
 }
end
function update_p(t)
 act=false
 if(btn(0))t.vx=-t.spd
 if(btn(1))t.vx=t.spd
 if(btn(2))t.vy=-t.spd
 if(btn(3))t.vy=t.spd
 if(btn(5))act=true
 update_e(t)
 t.vx,t.vy=0,0
end
function update_e(t)
 t.act=false
 local tx,ty,mx,my,spd,solid,flags=0,0,t.vx,t.vy,t.spd
 if(mx>0)tx=1
 if(my>0)ty=1

 t.x+=mx*spd
 for y=0,1 do
  local tile=mget(t.x+tx,t.y+y)
  flags=fget(tile)
  solid=flags&2==2
  if solid then
   if flags&64==64
   and (act or t~=p) then
    mine(tile,t.x+tx,t.y+y)
   end
   if mx<0 then t.x=t.x\1+1
   else t.x=t.x\1-.0001
   end
  end
 end
 t.y+=my*spd
 for x=0,1 do
  local tile=mget(t.x+x,t.y+ty)
  flags=fget(tile)
  solid=flags&2==2
  if solid then
   if flags&64==64 
   and (act or t~=p) then
    mine(tile,t.x+x,t.y+ty)
   end
   if my<0 then t.y=t.y\1+1
   else t.y=t.y\1-.0001
   end
  end
 end
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
