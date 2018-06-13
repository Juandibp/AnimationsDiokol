local angle, speed;
local l0, l1, l2;
local n = 5;
local first = true;


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

function setup() 
  size(800, 800);
  angle = 0;
  speed = 0.01;
  background(0);
end

function draw()
  fill(0, 10);
  rect(0, 0, width(), height());

  translate(width()/2, height()/2);
  rotate(angle);
  
  l0 = map(uistate.mousex, 0, width(), 50, 200);
  l1 = map(uistate.mousey, 0, width(), 37, 150);
  l2 = map(uistate.mousex+ uistate.mousey, 0, width()+height(), 25, 100);
  
  for i=1,n do
    fill(150, 100);
    pushMatrix();
    rotate(i*TWO_PI/n);
    translate(0, l0);
    ellipse(0, 0, 15, 15);

    for j=1,n do
      fill(200, 100);
      pushMatrix();
      rotate(j*TWO_PI/n);
      translate(0, l1);
      ellipse(0, 0, 10, 10);

      for k=1,n do
        fill(250, 100);
        pushMatrix();
        rotate(k*TWO_PI/n);
        translate(0, l2);    
        ellipse(0, 0, 5, 5);
        popMatrix();
      end
      popMatrix();
    end
    popMatrix();
    end
  angle = (angle+speed)%TWO_PI;
end