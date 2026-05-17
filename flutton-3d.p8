pico-8 cartridge // http://www.pico-8.com
version 43
__lua__

-- hook into init to add extra config 
-- to support 3d
o_init=init
function init3d()
 o_init()
 p.camx=0
 p.camy=.75
 p.drx=1
 p.dry=0
 p.z=1.5
 p.upd=upd_p3d
 
 bg=0
 floor_c=21
 shade_c=1
 sprites={}
 for _,e in pairs(ents) do
  local f=fget(e.s)
  if f&1~=1 and f&2~=1 then
   e.tex_x=e.s%16*8
   e.tex_y=e.s\16*8
   add(sprites,e)
  end
 end
 if chase_cam then
  p.tex_x=p.s%16*8
  p.tex_y=p.s\16*8
  add(sprites,p)
 end

 -- precalculate dist from camera
 local px,py=(p.x+4)/8,(p.y+4)/8
 if chase_cam then
  px-=p.drx*2
	py-=p.dry*2
 end
 for i=1,60 do
	sort(px, py,sprites)
 end
end
init=init3d

function interact(t)
 if act or t~=p then
  local x,y=(t.x+4)+t.drx*8,(t.y+4)+t.dry*8
  local l=mget(x\8,y\8)
  local f=fget(l)
  if f&64==64 then
   mine(t,l,x,y)
  elseif f&4==4 then
   door(l,x,y)
  end
 end
end

function upd_p3d(p)
 local px,py=(p.x+4)/8,(p.y+4)/8
 if btn(5) then
  act=true
  interact(p)
 end
 if btn(2) then
  local spd=0.4
  if(not fget(mget(px+p.drx*spd,py),1))p.x+=p.drx*spd
  px=(p.x+4)/8
  if(not fget(mget(px,py+p.dry*spd),1))p.y+=p.dry*spd
 elseif btn(3) then
  local spd=-0.4
  if(not fget(mget(px+p.drx*spd,py),1))p.x+=p.drx*spd
  px=(p.x+4)/8
  if(not fget(mget(px,py+p.dry*spd),1))p.y+=p.dry*spd
 end

 if btn(0) then
  local spd=-0.01
  ox=p.drx
  p.drx=p.drx*cos(spd)+p.dry*sin(spd)
  p.dry=ox*-sin(spd)+p.dry*cos(spd)
  ox=p.camx
  p.camx=p.camx*cos(spd)+p.camy*sin(spd)
  p.camy=ox*-sin(spd)+p.camy*cos(spd)
 end
 if btn(1) then
  local spd=0.01
  ox=p.drx
  p.drx=p.drx*cos(spd)+p.dry*sin(spd)
  p.dry=ox*-sin(spd)+p.dry*cos(spd)
  ox=p.camx
  p.camx=p.camx*cos(spd)+p.camy*sin(spd)
  p.camy=ox*-sin(spd)+p.camy*cos(spd)
 end
 col(p)
end

threedee=true
o_update=_update60
_update60=function()
 if(btnp(4))threedee=not threedee
 
 o_update()
end

o_draw=_draw
_draw=function()
 if threedee then
  draw3d()
	?"♥"..p.l,1,1,7
 else
  fillp()
  o_draw()
  camera(min(mapw*8-128,max(0,p.x-56)),min(maph*8-128,max(0,p.y-56)))
  local px,py=p.x+4,p.y+4
  line(px,py,px+p.drx*8,py+p.dry*8,5)
  pset(px,py,7)
 end
end

function draw3d()
 cls(floor_c)
 rectfill(0,0,127,63,bg|(bg+1)<<4)
 fillp(0xa5a5.4)
 rectfill(0,64,127,127,floor_c)
 rectfill(0,60,127,78,shade_c)
 fillp(0x5e5b.4)
 rectfill(0,79,127,85,floor_c)

 local z_buf={}

 local rayx,rayy=(p.x+4)/8,(p.y+4)/8
 if chase_cam then
  rayx-=p.drx*2
	rayy-=p.dry*2
 end

 for x=0,127 do
 local cx=2*x/128-1
 local ly=127
 local go=true
 local visited_empty=false

 local rdx,rdy=
  p.drx+p.camx*cx,
  p.dry+p.camy*cx
 local mapx,mapy=flr(rayx),flr(rayy)
 local lc=mget(mapx,mapy)
 local c=lc
 local clip_y=0
 
 local ddx=abs(1/rdx)
 local ddy=abs(1/rdy)
 if(rdx==0)ddx=30000
 if(rdy==0)ddy=30000
 local stepx,stepy,side=1,1,0
 local sidedistx,sidedisty=
  (mapx+1-rayx)*ddx,
  (mapy+1-rayy)*ddy
 if rdx<0 then
  stepx=-1
  sidedistx=(rayx-mapx)*ddx
 end
 if rdy<0 then
  stepy=-1
  sidedisty=(rayy-mapy)*ddy
 end
 
 local dist=0
 while go do
  dist+=1
  if sidedistx<sidedisty then
   sidedistx+=ddx
   mapx+=stepx
   side=0
  else
   sidedisty+=ddy
   mapy+=stepy
   side=1
  end
  c=mget(mapx,mapy)
	local flag=fget(c)&2
	if(mapx<0 or mapx>127 or mapy<0 or mapy>127)go=false
  if flag==2 and visited_empty then
   go=false
	elseif flag==0 then
	 visited_empty=true
  end
  
  if side==0 then
   pwd=sidedistx-ddx
  else
   pwd=sidedisty-ddy
  end
  z_buf[x]=pwd
  local fy=flr(128/pwd)/2+64+p.z
  local fc=sget(32+lc,max(0,min(dist-7,3)))

  --line(x,ly,x,fy,fc|(5<<4))
  if lc<2 then
   local c2=sget(32+lc,max(0,min(flr((pwd-1)/5),5)))
   --line(x,127-ly,x,127-fy,c2)
   clip_y=127-fy
  end
  ly=fy
  
  if(go)lc=c
 end

 if side==0 then
  pwd=sidedistx-ddx
   wallx=rayy+pwd*rdy
 else
  pwd=sidedisty-ddy
   wallx=rayx+pwd*rdx 
 end
 wallx-=flr(wallx)
  
 local texx=flr(wallx*8)

 local wh=flr(128/pwd+.5)
 local height=-wh/2
 
 --fillp(0xa5a5.4)
-- line(x,max(clip_y,height+64),x,wh/2+64,c)
 if side==1 then
  fillp(0xafaf.4)
 else
  fillp(0xa5a5.4)
 end
 local texidx=c
 sspr(texidx*8+texx,0,1,16,x,max(clip_y,height+64),1,wh*2+1)
 
 end

 draw_sprites(z_buf,sprites,rayx,rayy)
-- line(0,64,127,64,)
end

function sort(px,py,sprites)
-- precalculate distance
 for idx,s in pairs(sprites) do
  if(s.del)del(sprites,s)
  local s_x,s_y=
   s.x/8-px+.5,
   s.y/8-py+.5
	s.s_x=s_x
	s.s_y=s_y
	s.s_dist=sqrt(s_x*s_x+s_y*s_y)
 end

 -- sort
 local num_sprites=#sprites
 for i=1,num_sprites do
  local pick=1+rnd(i-1)\1
  if sprites[i].s_dist>sprites[pick].s_dist then
   sprites[i],sprites[pick]=sprites[pick],sprites[i]
  end
 end
end

function draw_sprites(z_buf,sprites,px,py)
 local drx,dry,camx,neg_camy,camy=
  p.drx,p.dry,p.camx,-p.camy,p.camy
 local invdet=1/(camx*dry+neg_camy*drx)

 fillp(0xa5a5.4)
 --fillp()
 
 sort(px,py,sprites)
 -- draw
 for _,s in pairs(sprites) do
  local s_x,s_y,s_z,
   tex_x,tex_y,tex_w,tex_h=
   s.s_x,
   s.s_y,
   12,
   s.tex_x,
   s.tex_y,
   8,
   8
  local tfy=invdet*(neg_camy*s_x+camx*s_y) 
    
  if tfy>0 then
   local tfx=
    invdet*(dry*s_x-drx*s_y)
  
   local scr_x,scr_y=
    64*(1+tfx/tfy),
    64+s_z/tfy
     
   local scale_w,scale_h=
    tex_w/tfy*8,
    tex_h/tfy*16
    
   local scr_h=scale_h
   local tex_sc=tex_w/scr_h
   local ds_y=-scale_h/2+scr_y
   local de_y=ds_y+scr_h
    
   -- column loop
   local s_dist=s.s_dist
   for x=max(0,scr_x-scale_w),min(127,scr_x+scale_w) do
    if z_buf[flr(x)]>s_dist then
     local texx=tex_x+(
      x-(-scale_w+scr_x))*4 /scale_w
    
     sspr(texx,tex_y,1,8,x,ds_y,1,scale_h)
    end
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
