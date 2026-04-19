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
 floor_c=5
 shade_c=2
 sprites={}
 for _,e in pairs(ents) do
	local f=fget(e.s)
	if(f&1~=1 and f&2~=1)add(sprites,e)
 end
end
init=init3d

function interact(t)
 if act or t~=p then
	local x,y=t.x+t.drx*5,t.y+t.dry*5
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
 local px,py=(p.x+4)\8,(p.y+4)\8
 if btn(5) then
	act=true
	interact(p)
 end
 if btn(2) then
  local spd=0.4
  if(not fget(mget(px+p.drx*spd,py),1))p.x+=p.drx*spd
	px=(p.x+4)\8
  if(not fget(mget(px,py+p.dry*spd),1))p.y+=p.dry*spd
 elseif btn(3) then
  local spd=-0.4
  if(not fget(mget(px+p.drx*spd,py),1))p.x+=p.drx*spd
	px=(p.x+4)\8
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
 else
	fillp()
  o_draw()
	camera(min(mapw*8-128,max(0,p.x-56)),min(maph*8-128,max(0,p.y-56)))
	pset(p.x,p.y,7)
 end
end

function draw3d()
cls(floor_c)
 fillp(0xa5a5.4)
 rectfill(0,0,127,63,bg|(bg+1)<<4)
 fillp(0xa5a5.4)
 rectfill(0,64,127,127,floor_c|1<<4)
-- fillp(▒)
 local z_buf={}
-- rectfill(0,42,127,88,1)

 for x=0,127 do
 local cx=2*x/128-1
 local ly=127
 local go=true
 local rayx,rayy=p.x/8,p.y/8
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
  if fget(c)&2==2 then
   go=false
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
 local texidx=c
 sspr(texidx*8+texx,0,1,16,x,max(clip_y,height+64),1,wh*2+1)
 if side==1 then
  --line(x,max(clip_y,height+64),x,wh/2+64,shade_c)
 end
 end

 draw_sprites(z_buf,sprites)
end

function draw_sprites(z_buf,sprites)
 local px,py,drx,dry,camx,neg_camy,camy=
  p.x/8,p.y/8,p.drx,p.dry,p.camx,-p.camy,p.camy
 local invdet=1/(camx*dry+neg_camy*drx)

 --fillp(0xa5a5.4)
 fillp()
 
 for s in all(sprites) do
  local s_x,s_y,s_z,
   tex_x,tex_y,tex_w,tex_h=
   s.x/8-px+.5,
   s.y/8-py+.5,
   12,
   64,--s.tex_x,
   0,--s.tex_y,
   8,
   8
	local tfy=invdet*(neg_camy*s_x+camx*s_y) 
	  
	if tfy>0 then
	 local s_dist=
    sqrt(s_x*s_x+s_y*s_y)
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
	 for x=max(0,scr_x-scale_w),min(127,scr_x+scale_w) do
    if z_buf[flr(x)]>s_dist then
     local texx=tex_x+(
      x-(-scale_w+scr_x))*4 /scale_w
    
     sspr(texx,0,1,8,x,ds_y,1,scale_h)
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
