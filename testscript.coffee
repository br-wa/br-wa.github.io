###
	wheeee
###



sum = (a,b) -> a + b

bigsum = (nums) ->
	result = 0
	nums.forEach (n) -> result += n 
	result 

array1 = [3,1,4,1,5]

document.write 5

out = bigsum array1

document.write out

#input validator:

adddiv = -> 
	cont = document.getElementById("buttonarea") 
	moo = document.createElement("input")
	moo.type = "text"
	cont.appendChild(moo)
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
		addiv() for x in [1..inp] 
	document.getElementById("outhere").innerHTML = text
	1


