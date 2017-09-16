--[
	Based on Turtle Tree Farm by oneupe1even
	http://turtlescripts.com/project/gjdh1a-Turtle-Tree-Farm
]--

--[
	Inventory slots
	1: saplings
	2: bonemeal
	3: coal. will also become wood slot once fueling is complete 
]--

--[
	TODO: gather nearby saplings from tree harvests
]--

--[
	Script was written pre-fuel adding functionality to support fueling up turtle
	TODO: figure out a more elegant function name reserved functions are causing a challenge
]--
function fuelUpTurtle()
	turtle.select(3)
	turtle.refuel()
end

--[
	fuction makeTree handles planting of saplings and use of bonemeal
]--
function makeTree()
  turtle.select(1)
  turtle.place()
  turtle.select(2)
  turtle.place()
end

--[
	function cutTree handles harvesting of wood
]--
function cutTree()
  turtle.dig()
  turtle.forward()
  while turtle.detectUp() do
    turtle.digUp()
    turtle.up()
  end
  while not turtle.detectDown() do
    turtle.down()
  end
  turtle.back()
end

--[
	function depositWood puts wood into chest
]--
function depositWood()
  turtle.select(3)
  turtle.dropDown()
end

--[
	Turtle will need to be refueled and restocked after 64 iterations 
]--
fuelUpTurtle()
for i = 1, 64 do  
  makeTree()
  cutTree()
  depositWood()
end
