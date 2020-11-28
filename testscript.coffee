###
	classes:
###

class Point
	constructor: (@x,@y) ->

class Line
	constructor: (@isRay, @startPt, @endPt) -> 
	prline: ->
		canv = document.getElementById("canv")
		ctx = canv.getContext("2d")
		ctx.strokeStyle = "#E61973"
		ctx.lineWidth = "5"
		ctx.beginPath()
		ctx.moveTo(@startPt.x,@startPt.y)
		if @isRay
			ctx.lineTo(1000*@endPt.x - 999*@startPt.x, 1000*@endPt.y-999*@startPt.y)
		else 
			alert @startPt.x
			alert @endPt.x
			alert @startPt.y
			alert @endPt.y
			ctx.lineTo(@endPt.x, @endPt.y)
		ctx.stroke()
		1
		
	
###
	basic stuff:
###

getlines = (n) -> 
	conta = document.getElementById("buttonarea")
	contanew = document.createElement("div")
	contanew.id = "line" + n
	conta.appendChild(contanew)
	
	ltype = document.createElement("select")
	ltype.id = "ltype" + n
	ltype.innerHTML = "<option>ray</option><option>segment</option>"
	contanew.appendChild(ltype)
	
	txt = document.createElement("p")
	txt.style = "display:inline" #sorry lol
	txt.innerHTML = "  start point  "
	contanew.appendChild(txt)

	p1 = document.createElement("input")
	p1.type = "text"
	p1.id = "start" + n
	contanew.appendChild(p1)

	txt2 = document.createElement("p")
	txt2.style = "display:inline" #sorry lol
	txt2.innerHTML = "  next (end) point  "
	contanew.appendChild(txt2)

	p2 = document.createElement("input")
	p2.type = "text"
	p2.id = "end" + n
	contanew.appendChild(p2)
	
	errmsg = document.createElement("p")
	errmsg.stype = "display:inline" #sorry again
	errmsg.id = "errmsg" + n
	contanew.appendChild(errmsg)

	endl = document.createElement("p")
	contanew.appendChild(endl)

	1
	
addsubbox = -> 
	loc = document.getElementById("subarea")
	
	subbutton = document.createElement("button")
	subbutton.innerHTML = "do things with the lines!"
	subbutton.id = "subl"
	subbutton.onclick = draw
	loc.appendChild(subbutton)
	
	1

initcanv = ->
	loc = document.getElementById("displayarea")

	loc.appendChild(document.createElement("p"))

	canv = document.createElement("canvas")
	canv.id = "canv"
	canv.width = "600"
	canv.height = "600"
	loc.appendChild(canv)

	ctx = canv.getContext("2d")
	ctx.fillStyle = "#C9F3F1"
	ctx.fillRect(0,0,canv.width,canv.height)

	ctx.strokeStyle = "#E61973" #great color
	ctx.lineWidth = "5"
	ctx.strokeRect(0,0,canv.width,canv.height)

	ctx.translate(300,300)

	1
	

check = -> 
	inp = document.getElementById("sz").value
	if isNaN inp 
		text = "enter an actual number"
	else if inp < 1 #should probably test for isInteger here but it's not working (?)
		text = "enter a positive integer"
	else if inp > 20
		text = "smaller input please"
	else 
		text = 'enter lines below (enter points as "x y" for x,y integer coords; make them in [-300,300] for ideal performance) -- also note that html uses increasing x from left to right and increasing y from top to bottom'
		getlines x for x in [1..inp] 
		addsubbox()
		initcanv()
	document.getElementById("outhere").innerHTML = text
	1

err = (n) -> 
	errmsg = document.getElementById("errmsg" + n)
	errmsg.innerHTML = "error: bad input"
	1

unerr = (n) ->
	errmsg = document.getElementById("errmsg" + n)
	errmsg.innerHTML = ""
	1 

###
	can deal with better error processing eventually
checkval = (n) ->
	start = document.getElementById("start" + n).value
	stfl = start.split " "
	if stfl.length != 2
		err n
		false
	if isNaN stfl[0]
		err n
		false
	if isNaN stfl[1]
		err n
		false
	end = document.getElementById("end" + n).value
	fnfl = end.split " "
	if fnfl.length != 2
		err n
		false
	if isNaN fnfl[0]
		err n
		false
	if isNaN fnfl[1]
		err n
		false
	true
###

conv = (n) ->
	start = document.getElementById("start" + n).value
	stfl = start.split " "
	end = document.getElementById("end" + n).value
	fnfl = end.split " "
	rayStr = document.getElementById("ltype" + n).value
	new Line(rayStr == "ray", new Point(stfl[0],stfl[1]), new Point(fnfl[0], fnfl[1]))

draw = ->
	inp = document.getElementById("sz").value #might be vulnerable to ppl changing inp :/
	#unerr n for n in [1..inp]	
	#checkval n for n in [1..inp]	
	allLines = (conv n for n in [1..inp])
	for ell in allLines
		ell.prline()

	1
