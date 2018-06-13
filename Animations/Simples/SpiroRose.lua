local ELLIPSE_MULT_MIN = 1; -- min size multiplier for ellipse
local ELLIPSE_MULT_MAX = 200; -- max size multiplier for ellipse
local ELLIPSE_BASE_W = 3; -- ellipse base width
local ELLIPSE_BASE_H = 1; -- ellipse base height
local ELLIPSE_XOFF = -60; -- ellipse x-offset from centre of sketch
local ELLIPSE_YOFF = -60; -- ellipse y-offset from centre of sketch
local ELLIPSE_PERIOD = TWO_PI / 1080; -- period of sine wave governing ellipse size
local SKETCH_ROT = TWO_PI / 600; -- speed at which sketch canvas rotates
local BACKLIGHT = 16; -- background brightness value

local drawMe = true; 
local drawFrame = 0;

function setup() 
  frameRate(60);
  size(800, 800);
  --colorMode(HSB, 360, 100, 100);
  background(0,0,BACKLIGHT,100);
  noFill();
  strokeWeight(1);
end

function draw()
  if (drawMe) then
    local x = drawFrame * ELLIPSE_PERIOD;
    x = x-HALF_PI; -- start at sin(x) = 0
    local amplitude = ELLIPSE_MULT_MAX - ELLIPSE_MULT_MIN;
    local ellipseMult = (math.sin(x) * amplitude) / 2; -- sine wave to control size of ellipse
    ellipseMult =ellipseMult+ amplitude/2 + ELLIPSE_MULT_MIN; -- ELLIPSE_MULT_MIN <= sine values <= ELLIPSE_MULT_MAX
    local w = ELLIPSE_BASE_W * ellipseMult;
    local h = ELLIPSE_BASE_H * ellipseMult;
    
    pushMatrix();
    translate(800/2, 800/2);
    rotate(drawFrame * SKETCH_ROT);
    stroke(drawFrame % 360, drawFrame % 450,drawFrame % 200,100); --stroke(200, 65, 80, 100); -- use this for blue similar to https:--gfycat.com/JointRealisticGrouper
    ellipse(ELLIPSE_XOFF, ELLIPSE_YOFF, w, h);
    popMatrix();
    
    drawFrame=drawFrame+1;
    end
end

-- press space to pause/resume
function keyPressed() 
  if (key == ' ') then
    if (drawMe == false) then drawMe = true
    else drawMe = true 
    end
    end
end