local t=0;
local angle =0;
local NUM_LINES = 380;
local v1 =0.4;
local v2;
local increment = false;
local fator =0.00001;

function setup()
    background(20);
    size(500,500);
    v1 = math.random(0.4)+0.2;
    smooth();
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
     increment = true;
    fator = 0.00001;
 end
 
 function mouseReleased(x,y)
     uistate.mousedown = false
     increment = false;
 end

function draw()
  background(0);
  angle = angle+0.01;
  stroke(255,200);
 
  translate(width()/2, height()/2);
 rotate(math.sin(angle));
  
  for i=1, NUM_LINES do
     strokeWeight(4);
    point(x(t+i), y(t+i));
    point(x2(t+i), y2(t+i));
    
    strokeWeight(1.2);
    line(x(t+i),y(t+i),x2(t+i),y2(t+i));
  end
  
  t = t+0.005;
 
 if(increment) then v1=vi+fator end
  
end

function x(t)
    return math.sin(t/10)*100 + math.cos(t/v1)*100;
end


function y(t)
    return math.cos(t/10)*100 + math.sin(t/v1)*100;
end




function x2(t)
    return math.sin(t/10)*10 + math.cos(t/v1)*100;
end


function y2(t)
    return math.cos(t/10)*10 + math.sin(t/v1)*100;
end