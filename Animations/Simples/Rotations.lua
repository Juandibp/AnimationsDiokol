local counter = 0;
local speed = 0;

function setup()

    size(600,400);
    background(0);
    noFill();
    stroke(255);
    strokeWeight(2);
    
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
   
    translate(250,250);
    background(0);
    for i = 0, 20 do
        rotate(counter);
        rect(i , i , i * 5, i * 5);
    end
    speed = map(uistate.mousex , 0 , width() , -0.01 , 0.01);
    counter = counter + speed;
   
    
     
 end