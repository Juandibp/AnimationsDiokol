local x=0;
local y=5;
local speed=4.0;
local yspeed=6.0;

function setup()
  background(0);
  size(1000, 1000);
end

function draw()
fill(0, 2);
rect(0, 0, height(), width());
--fill(random(0, 15), y, 85, 25);
noFill();
stroke(x/3, y/2, math.random(75, 255));
triangle(y,x, 1000, 1000, width()/2, height()/2);
triangle(x, y, 0, 0, width()/2, height()/2);
triangle(x, y, 0, 1000, width()/2, height()/2);
triangle(y, x, 1000, 0, width()/2, height()/2);

x=x+speed;
y=y+yspeed;

if((x>width()) or (x<0))then
  speed=speed*-1;
end
if((y>height()) or (y<0))then
  yspeed=yspeed*-1;
end
  
  
end