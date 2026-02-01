pico-8 cartridge // http://www.pico-8.com
version 43
__lua__
function _init()
 mp={}
 init()
end

function _update60()
for _,t in pairs(ents)do
t:upd()
if(t.del)del(ents,t)
col(t)
end
if(p.lv<1)init()
end

function _draw()
cls(bg)
camera(
min(mapw*8-128,max(0,p.x-56)),
min(maph*8-128,max(0,p.y-56)))
map()
for _,t in pairs(ents)do
t:draw()end
camera()
?"♥"..p.lv,1,1,7
?"◆"..sc,1,8
end

function init()
 maph=maph or 32
 mapw=mapw or 32
 ents,blocks,p,sc,lv={},{},{lv=1,x=0,y=0},0,100
 for y=0,maph-1 do
  for x=0,mapw-1 do
   t=mp[y*mapw+x]
   if(t)mset(x,y,t)
   t=mget(x,y)
   mp[y*mapw+x]=t
   f=fget(t)
   local e
   if (f&2==0 and f>0)
   or f&16==16 then
    mset(x,y,0)
    e=new(x,y,t,function(e)end)
    if f&64==64 then
     add(e.hit,atk)
    end
   end
   if f&1==1 then
    e.spd=1
    e.lv=lv
    e.upd=upd_p
    p=e
   end
   if f&8==8 then
    add(e.hit,function(e,t)if(fget(t.s,0))p.lv-=1end)
   end
   if f&16==16 then
    e.upd=move
    e.spd=.075
    e.dly=30
    e.tm=rnd(20)
   end
   if f&32==32 then
    if(f&4~=4)e.upd=chase
    e.spd=.5
    e.dly=30
    e.tm=rnd(20)
   end
   if f&4==4 then
    if f&32==32 then
     add(e.hit,pickup)
     e.spd=1.5
     e.dly=0
    elseif f&2==0 then
     add(e.hit,get)
    end
   end
  end
 end
end

function get(e,t)
 if(not e.del and fget(t.s,0))sc+=1
 e.del=true
end

function mine(t,s,x,y)
 x\=8
 y\=8
 local e=blocks[x..y]
 if not e then
  t.act=true
  e=new(x,y,s,function(e)
   e.lv-=1
   if(e.lv<1)blocks[x..y]=nil e.del=true
  end)
  e.lv=4
  e.r=120
  add(e.hit,function(e,t)
  if not t.act then
   t.act=true
   e.lv+=2
   if(e.lv>60)mset(x,y,0)e.del=true
  end
  end)
  e.draw=function(t)
   ?("∧░▒")[t.lv\21+1],t.x+1,t.y+2,bg
  end
  blocks[x..y]=e
 end
end

function door(s,x,y)
 x\=8
 y\=8
 mset(x,y,0)
 new(-8,-8,0,function(e)
  e.lv+=1
  if(e.lv>60)mset(x,y,s)e.del=true
 end)
end

function move(t)
 t.tm-=1
 if t.tm<0 then
  t.vx=rnd()*2\1*2-1
  t.vy=rnd()*2\1*2-1
  t.tm=t.dly+rnd(20)
 end
 upd_e(t)
end

function pickup(e,t)
if act
and not t.act
and fget(t.s,0)then
t.act=true
e.tm=0
e.spd=1
chase(e)
else
e.x=(e.x+4)\8*8
e.y=(e.y+4)\8*8
e.spd=1
end
end

function atk(e,t)
if act
and not t.act
and fget(t.s,0)then
t.act=true
e.lv-=1
if(e.lv<1)e.del=true
end
end

function chase(t)
 t.tm-=1
 if t.tm<0 then
  t.vx=1
  t.vy=1
  if(p.x<t.x)t.vx=-1
  if(p.y<t.y)t.vy=-1
  t.tm=t.dly+rnd(20)
 end
 upd_e(t)
end

function col(e)
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
 local e={
 x=x*8,
 y=y*8,
 s=s,
 lv=5,
 r=60,
 vx=0,
 vy=0,
 draw=function(t)spr(t.s,t.x,t.y)end,
 upd=u,
 hit={}
 }
 add(ents,e)
 return e
end

function upd_p(t)
 act=false
 if(btn(0))t.vx=-t.spd
 if(btn(1))t.vx=t.spd
 if g then
  t.vy+=g
  if(btn(4)and t.g)t.g=false t.vy-=g*20
 else
  if(btn(2))t.vy=-t.spd
  if(btn(3))t.vy=t.spd
 end
 if(btn(5))act=true
 upd_e(t)
 if g then
  t.vx*=0.9
 else
  t.vx,t.vy=0,0
 end
end

function upd_e(t)
 t.act=false
 local tx,ty,mx,my,spd,solid,f=
  0,0,t.vx,t.vy,t.spd
 if(t.vx>0)tx=7
 if(t.vy>0)ty=7
 local mx,my=
  t.x+t.vx*spd,
  t.y+t.vy*spd

 for y=0,7,7 do
  local l=mget((mx+tx)\8,(t.y+y)\8)
  f=fget(l)
  solid=f&2==2
  if solid then
   if act or t~=p then
    if f&64==64 then
     mine(t,l,mx+tx,t.y+y)
  elseif f&4==4 then
   door(l,mx+tx,t.y+y)
   end
   end
  break
  end
 end
 if(not solid)t.x=mx
 for x=0,7,7 do
  local l=mget((t.x+x)\8,(my+ty)\8)
  f=fget(l)
  solid=f&2==2
  if solid then
   if g then
    t.vy=0
    t.g=true
   end
   if act or t~=p then
    if f&64==64 then
     mine(t,l,t.x+x,my+ty)
  elseif f&4==4 then
   door(l,t.x+x,my+ty)
   end
   end
  break
  end
 end
 if(not solid)t.y=my
end
