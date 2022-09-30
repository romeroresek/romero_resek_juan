//EJERCICIO 3 

const factorialOf = integer => {
    let factorial = 1;
  
    for(let i = 1; i <= integer; i++) {
      factorial *= i;
    }
  
    return factorial;
  }

console.log(factorialOf(2));
console.log(factorialOf(5));
console.log(factorialOf(4));
console.log(factorialOf(6));