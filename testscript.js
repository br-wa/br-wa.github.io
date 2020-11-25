  /*
  	wheeee
  */
  var array1, bigsum, check, out, sum;

  sum = function(a, b) {
    return a + b;
  };

  bigsum = function(nums) {
    var result;
    result = 0;
    nums.forEach(function(n) {
      return result += n;
    });
    return result;
  };

  array1 = [3, 1, 4, 1, 5];

  document.write(5);

  out = bigsum(array1);

  document.write(out);

  //input validator:
  check = function() {
    var inp, text;
    inp = document.getElementById("sz").value;
    if (isNaN(inp)) {
      text = "enter an actual number";
    } else if (inp < 1) {
      text = "enter a positive number";
    } else if (inp > 20) {
      text = "smaller input please";
    } else {
      text = "enter lines below";
    }
    document.getElementById("outhere").innerHTML = text;
    return function() {
      return 1;
    };
  };

