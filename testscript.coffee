adddiv = (n) -> 
	conta = document.getElementById("buttonarea")
	contanew = document.createElement("div")
	contanew.id = "line" + n
	conta.appendChild(contanew)
	ltype = document.createElement("select")
	ltype.innerHTML = "<option>ray</option><option>segment</option>"
	contanew.appendChild(ltype)
	moo = document.createElement("input")
	moo.type = "text"
	contanew.appendChild(moo)
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
		adddiv() for x in [1..inp] 
	document.getElementById("outhere").innerHTML = text
	1


