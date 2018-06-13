local xOffset = 25;
local yOffset = 25;

local xScale = 10;
local yScale = 10;

local xCount;
local yCount;

local pointColor = color(27, 25, 9,255);

function setup()
  size (550, 550);
  stroke(pointColor);
  strokeWeight(4);
  xCount = (width()-xOffset*2)/xScale;
  yCount = (height()-yOffset*2)/yScale;
end


local uistate = {
    wid = 0,
    mousex = 0,
    mousey = 0,
    mousedown = false, -- boolean
    hotitem = 0,
    activeitem = 0
}

function mouseMoved(x,y)
    uistate.mousex = x
    uistate.mousey = y
 end
 
 function mousePressed(x,y)
     uistate.mousedown = true
 end
 
 function mouseReleased(x,y)
     uistate.mousedown = false
 end

 function draw()
    background(color(245,247,232,255));
  
    for y=0, yCount do
  
      for x=0, xCount do
        local xWaveScale = map (uistate.mousex, 0, width(), 0.5, 10.0);
        local yWaveScale = map (uistate.mousey, 0, height(), 0.5, 10.0);
        local xShift = math.sin((y*x+frameCount()/2.0)/xWaveScale)*xScale/2;
        local yShift = math.sin((y+x+frameCount()/3.0)/yWaveScale)*yScale/2;
        point (xOffset+x*xScale+xShift, yOffset+y*yScale+yShift);
      end
    end
  end
  