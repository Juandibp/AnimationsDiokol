function setup()
  size(640, 640);
  noFill();
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
  background(0);
  fill( 255);
  local maxX = 180/width()*uistate.mousex;
  local maxY = 180/height()*uistate.mousey;

  translate(width()/2, height()/2);
  for i = 0, 360 do
    local x = math.sin(radians(i)) * maxX;
    local y = math.cos(radians(i)) * maxY;
    pushMatrix();
    translate(x, y);
    rotate(radians(i-frameCount()));
    stroke(0)
    rect(0, 0, 140, 100);
    popMatrix();

    pushMatrix();
    translate(-x, -y);
    rotate(radians(i-frameCount()));
    rect(0, 0, 100, 100);
    popMatrix();
    i=i+5
  end
end

