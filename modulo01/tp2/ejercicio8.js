//EJERCICIO 8

function generateRandomIntegerInRange(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}
var array = []
for(let i=0; array.length<100; i++){
    var num = generateRandomIntegerInRange(0, 100)

    var found = array.find (el => el == num)
    if (found == undefined){
        array.push(num)
    }
}
console.log(array)
document.write(array)



