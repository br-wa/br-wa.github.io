getlines = (n) -> 
	conta = document.getElementById("buttonarea")
	contanew = document.createElement("div")
	contanew.id = "line" + n
	conta.appendChild(contanew)
	
	ltype = document.createElement("select")
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

check = -> 
	inp = document.getElementById("sz").value
	if isNaN(inp) 
		text = "enter an actual number"
	else if inp < 1
		text = "enter a positive number"
	else if inp > 20
		text = "smaller input please"
	else 
		text = "enter lines below"
		getlines x for x in [1..inp] 
		addsubbox()
	document.getElementById("outhere").innerHTML = text
	1

draw = ->
	alert("you clicked a button!")
	1
