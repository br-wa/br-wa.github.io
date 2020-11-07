###
	wheeee
###

sum = (a,b) -> a + b

bigsum = (nums...) ->
	result = 0
	nums.forEach(n) -> result += n
	result 

array1 = [3,1,4,1,5]

bigsum array1
