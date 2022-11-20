const fs = require('fs');
const rawdata = fs.readFileSync('./departamentos.json', 'utf8');
var departamento = JSON.parse(rawdata);
//console.log(departamento['departamentos'][1]['tecnologia'][0]['nombre'])
//console.log(departamento['departamentos'][1]['tecnologia'].length)


/* solucion 1
const getEmpleado = () => {
    
    for(var i=0;i<departamento['departamentos'][1]['tecnologia'].length;i++){
        console.log(departamento['departamentos'][1]['tecnologia'][i]['nombre']+' '+departamento['departamentos'][1]['tecnologia'][i]['puesto']);
        }
}
getEmpleado();*/

//solucion 2
const getEmpleado = (t,n,p) => {
    
    for(var i=0;i<departamento['departamentos'][1][t].length;i++){
        console.log(departamento['departamentos'][1][t][i][n]+' '+departamento['departamentos'][1][t][i][p]);
        }
}
//Lista depto tecnologia
getEmpleado('tecnologia','nombre','puesto');

