function setup()
  size(640, 640);
  noStroke();
  fill(234, 46, 73);
  frameRate(120)
end

function dist ( x1, y1, x2, y2 )
    local dx = x1 - x2
    local dy = y1 - y2
    return math.sqrt ( dx * dx + dy * dy )
  end

function draw() 
  background(51, 55, 69);
  translate(width()/2, height()/2);
  -- The amount of layers
  for j = 2, 60 do
    local temp = j*20
    local h = temp*2+5;
    -- The amount of shapes per layer
    for q = 0, 60 do
      local temp2=q*30
      local x2 = math.sin(radians(temp2+h))*j;
      local y2 = math.cos(radians(temp2+h))*j;
      local d = map(dist(x2, y2, 0, 0), 0, 120, 0, 360);
      pushMatrix();
      translate(x2, y2);
      scale(map(j, 0, 180, 0.1, 0.4));
      rotate(radians(-temp2-h));
      beginShape();
      -- The shape, made from openprocessing.org/sketch/162912
      for i = 0, 36 do
        local temp3=i*5
        local x = math.sin(radians(i)) * temp3/3;
        local angle = math.sin(radians(temp3+frameCount()*3+d)) * 50;
        vertex(x-angle, temp3*2);
      end
      local i = 180
      while(true) do
        if (i == 0) then break; end
        local x = math.sin(radians(i)) * i/3;
        local angle = math.sin(radians(i+frameCount()*3+d)) * 50;
        vertex(-x-angle, i*2);
        i = i - 5
    end
      endShape(CLOSE);
      popMatrix();
end
end
end