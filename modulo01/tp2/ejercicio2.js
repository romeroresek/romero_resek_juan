//EJERCICIO 2

var num1 = 3;
var num2 = 7;

if(num1<num2) {
    console.log("num1 no es mayor que num2");
}   
if(Math.sign(num2)==1) {
    console.log("num2 es positivo");
}
if(Math.sign(num1)==-1 && num1!=0) {
    console.log("num1 es negativo o distinto de cero");
}
if(++num1 < num2)  {
    console.log("Incrementar en 1 unidad el valor de num1 no lo hace mayor o igual que num2"); 
}