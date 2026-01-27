pico-8 cartridge // http://www.pico-8.com
version 43
__lua__

-->8
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
min(mapw*8-128,max(0,p.x-56)),
min(map_height*8-128,max(0,p.y-56)))
map()
for _,t in pairs(ents)do
t:draw()end
camera()
?"♥"..p.lives,1,1,7
?"◆"..score,1,8
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
    if f&64==64 then
     add(e.hit,atk)
	  end
   end
   if f&1==1 then
    e.spd=1
    e.lives=lives
    e.update=update_p
    p=e
   end
   if(f&8==8)add(e.hit,function(e,t)if(fget(t.s,1))p.lives-=1end)
   if f&16==16 then
    e.update=move
    e.spd=.075
    e.delay=30
    e.timer=rnd(20)
   end
   if f&32==32 then
    if(f&4~=4)e.update=chase
    e.spd=.5
    e.delay=30
    e.timer=rnd(20)
   end
   if f&4==4 then
    if f&32==32 then
     add(e.hit,pickup)
     e.spd=1
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
 if(not e.del and fget(t.s,1))score+=1
 e.del=true
end

function mine(s,x,y)
 x=x\8
 y=y\8
 local e=blocks[x..y]
 if not e then
  e=new(x,y,s,function(e)
   e.dmg-=1
   if(e.dmg<1)blocks[x..y]=nil e.del=true
  end)
  e.dmg=2
	e.r=68
  add(e.hit,function(e,t)
	 if act 
	 and not t.act then
	  t.act=true
    e.dmg+=2
    if (e.dmg>60)mset(x,y,0)e.del=true
	 end
  end)
  e.draw=function(t)
   ?("∧░▒")[t.dmg\21+1],t.x+1,t.y+2,bg_colour
  end
  blocks[x..y]=e
  add(ents,e)
 end
end
function move(t)
 t.timer-=1
 if t.timer<0 then
  t.vx=rnd()*2\1*2-1
  t.vy=rnd()*2\1*2-1
  t.timer=t.delay+rnd(20)
 end
 update_e(t)
end
function pickup(e,t)
if act
and not t.act
and fget(t.s,1) then
t.act=true
e.timer=0
e.spd=1
chase(e)
else
e.spd=1
end
end
function atk(e,t)
if act
and not t.act
and fget(t.s,1) then
t.act=true
e.lives-=1
if(e.lives<1)e.del=true
end
end
function chase(t)
 t.timer-=1
 if t.timer<0 then
  t.vx=1
  t.vy=1
  if(p.x<t.x)t.vx=-1
  if(p.y<t.y)t.vy=-1
  t.timer=t.delay+rnd(20)
 end
 update_e(t)
end
function collide(e)
 local ex,ey=e.x+4,e.y+4
 for _,t in pairs(ents)do
  local tx,ty=t.x+4,t.y+4
  if ((ex-tx)*(ex-tx)+
  (ey-ty)*(ey-ty))<e.r
  and e.s~=t.s then
   for _,c in pairs(e.hit)do
    c(e,t)
   end
  end
 end
end
function new(x,y,s,u)
 return {
 x=x*8,
 y=y*8,
 s=s,
 lives=5,
 r=60,
 vx=0,
 vy=0,
 draw=function(t)spr(t.s,t.x,t.y)
 if(t.act)circ(t.x*8+4,t.y*8+4,5,10)end,
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
 local tx,ty,mx,my,spd,solid,flags=
  0,0,t.vx,t.vy,t.spd
 if(t.vx>0)tx=7
 if(t.vy>0)ty=7
 local mx,my=
  t.x+t.vx*spd,
  t.y+t.vy*spd

 local solid=false
 for y=0,7,7 do
  local tile=mget((mx+tx)\8,(t.y+y)\8)
  flags=fget(tile)
  solid=flags&2==2
  if solid then
   if flags&64==64
   and (act or t~=p) then
    mine(tile,mx+tx,t.y+y)
   end
	  break
  end
 end
 if(not solid)t.x=mx
 solid=false
 for x=0,7,7 do
  local tile=mget((t.x+x)\8,(my+ty)\8)
  flags=fget(tile)
  solid=flags&2==2
  if solid then
   if flags&64==64 
   and (act or t~=p) then
    mine(tile,t.x+x,my+ty)
   end
	  break
  end
 end
 if(not solid)t.y=my
end

