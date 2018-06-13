local coor;

function setup() 
	size(1400, 800);
	background(100);
	coor = {1, 1};
end

function draw() 
	
	for i = 1,200 do
		point(coor[1] * height()/2+300, height()*0.9-coor[2] * height()/2);
		coor = sifs(coor);
end
end

function sifs(list) 
	local x2 = list[1] / 2;
	local y2 = list[2] / 2;
	local answer ={
		{x2, y2},
		{x2 + 0.5, y2 + 0.86},
		{x2 + 1, y2}
	};
	return (answer[math.random(1,3)]);
end