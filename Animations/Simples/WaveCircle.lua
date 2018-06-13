local c1 = '#191970';
local c2 = '#ECF0F1';
local count = 19;
local r = 120;
local d = 8.25;
local MAX = 330;

function setup() 
  size(300, 300);
  smooth();
  frameRate(60);
  background(c1);
  ellipseMode(RADIUS);
  noStroke();
end

function draw() 
  fill(c1,100);
  rect(0, 0, 300, 300);
  fill(c2, 100);
  
  pushMatrix();
  translate(300 / 2, 300 / 2);
  for n = 2, count do

    for a = 1, 360 do
      local progress = constrain(map(frameCount()%MAX, 0+n*d, MAX+(n-count)*d, 0, 1), 0, 1);
      local ease = -0.5*(math.cos(progress * PI) - 1);
      local phase = 0 + 2*PI*ease + PI + radians(map(frameCount()%MAX, 0, MAX, 0, 360));
      local x = map(a, 0, 360, -r, r);
      local y = r * math.sqrt(1 - math.pow(x/r, 2)) * math.sin(radians(a) + phase);
      ellipse(x, y, 1.5, 1.5);
    end
end
  popMatrix();
  
end