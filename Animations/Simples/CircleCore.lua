function setup()
  size(640, 640);
  background(0, 20, 35);
end

function draw()
  background(0, 20, 35);
  translate(width()/2, height()/2);
  rotate(radians(frameCount()));
  for i = 0, 360
  do
    local x = math.sin(radians(i+frameCount()));
    local y = math.cos(radians(i+frameCount()));
    
    local x2 = x * math.sqrt(1 - math.pow(y, 2));
    local y2 = y * math.sqrt(1 - math.pow(x, 2));
    
    stroke(0, 255, 255);
    strokeWeight(1);
    line(x*150, y*150, x2*100, y2*100);
    strokeWeight(3);
    
    stroke(255, 150, 0);
    ellipse(x2*100, y2*100, 3, 3);
    ellipse(x*150, y*150, 5, 5);

    i=i+10

  end
end