local t;

function setup() 
	size(800, 800);
	t=-1200;
end

function distance ( x1, y1, x2, y2 )
    local dx = x1 - x2
    local dy = y1 - y2
    return math.sqrt ( dx * dx + dy * dy )
  end

function draw() 
	background(16, 16, 32);
	translate(width()/2, height()/2);
	noStroke();
	fill(255);
  for theta = 0, 6 do
    for j = 1, 16 do
      for i = 0, j do
        local x = (i - (j - 1) / 2) * 10;
				local y = j * 8.33;
        local d = distance(x, y, 0, 0);
        pushMatrix();
        translate(x, y);
        rotate(radians(d + t) * (j + 16)/24);
        ellipse(x, y, 5, 5);
        popMatrix();
      end
    end
    rotate(PI / 3);
    end
  t=t+1;
end