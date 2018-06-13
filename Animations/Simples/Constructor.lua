local num = 3;
local radius = 200;
local osc=0;

function setup() 
  size(500, 500);
  smooth(8);
  background('#FCE74E');
end

function draw() 
  noStroke();
  fill(255,230,80,175); 
  rect(0,0,width(),height()); 

  translate(width()/2, height()/2); -- (0,0) now at center of canvas

  osc = osc + 0.03; -- osc sets motion

  for i = 0, num do 

    local x = radius*math.cos(osc); -- X cordinate in motion 
    local y = radius*math.sin(osc); -- Y cordinate in motion
    local x2 = radius*math.cos(TWO_PI*i/num); -- X2 cordinate stationary 
    local y2 = radius*math.sin(TWO_PI*i/num); -- Y2 cordinate stationary

    stroke('#5B4778');
    strokeWeight(.5);
    strokeCap(ROUND);

    line(x, y, x2, y2);
    line(-x, -y, x2, y2);

    pushMatrix(); -- resets matrix 
    rotate(HALF_PI); -- rotates matrix
    line(x, y, x2, y2); 
    line(-x, -y, x2, y2);
    popMatrix();-- resets matrix
  end
end

function keyPressed() 
 
  if (keyCode == UP) then
    num=num+1;
    println(num);
  end

  if (keyCode == DOWN) then
    num=max(num-1,0);
    println(num);
  end  
end