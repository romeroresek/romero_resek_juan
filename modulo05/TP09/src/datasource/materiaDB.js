const mysql = require('mysql');
const config = require("../config/config.json");

//conectarnos a nuestra DB
var connection = mysql.createConnection(config.database);

connection.connect((err) => {
    if (err) {
        console.log(err);
    } else {
        console.log("DB Conectada correctamente");
    }
});
//fin de conexion db

var materiaDb = {};


materiaDb.getAll = function (funCallback) {
    connection.query("SELECT * FROM materias where estado >=1", function (err, result, fields) {
        if (err) {
            funCallback({
                message: "Surgio un problema, contactese con un administrador. Gracias",
                detail: err
            });
            console.error(err);
        } else {
            funCallback(undefined, result);
        }
    });
}

materiaDb.getByDni = function (dni,funCallback) {
    connection.query("SELECT * FROM materias WHERE dni=?",dni, function (err, result, fields) {
        if (err) {
            funCallback({
                message: "Surgio un problema, contactese con un administrador. Gracias",
                detail: err
            });
            console.error(err);
        } else {
            if(result.length>0){
                funCallback(undefined, result[0]);
            }else{
                funCallback({
                    message: "No se encontro la materia"
                });
            }
            
        }
    });
}

materiaDb.create = function (materia, funCallback) {
    var query = 'INSERT INTO materias (dni,nombre,apellido,sexo,fecha_nacimiento) VALUES (?,?,?,?,?)'
    var dbParams = [materia.dni, materia.nombre, materia.apellido, materia.sexo, materia.fecha_nacimiento];
    connection.query(query, dbParams, function (err, result, fields) {
        if (err) {
            if(err.code == 'ER_DUP_ENTRY'){
                funCallback({
                    message: `Ya existe la materia con el DNI ${materia.dni}`,
                    detail: err
                });
            }else{
                funCallback({
                    message: "Surgio un problema, contactese con un administrador. Gracias",
                    detail: err
                });
            }
            
            console.error(err);
        } else {
            funCallback(undefined, {
                message: `Se creo la materia ${materia.apellido} ${materia.nombre}`,
                detail: result
            });
        }
    });
}

/**
 * 
 * @param {*} dni 
 * @param {*} materia 
 * @param {*} funCallback 
 *         retorna:
 *              code = 1 (EXITO)
 *              code = 2 (NOT FOUND) (NO encontro elemento)
 *              code = 3 (ERROR)
 * 
 */
materiaDb.update = function (dni, materia, funCallback) {
    var query = 'UPDATE materias SET dni = ? , nombre = ?, apellido = ?,  sexo = ?, fecha_nacimiento = ?, estado = ? WHERE dni = ?'
    var dbParams = [materia.dni, materia.nombre, materia.apellido, materia.sexo, materia.fecha_nacimiento, materia.estado, dni];
    connection.query(query, dbParams, function (err, result, fields) {
        if (err) {
            funCallback({
                code:3,
                message: "Surgio un problema, contactese con un administrador. Gracias",
                detail: err
            });
            console.error(err);
        } else {
            if (result.affectedRows == 0) {
                funCallback({
                    code:2,
                    message: `No se encontro la materia ${dni}`,
                    detail: result
                });
            } else {
                funCallback({
                    code:1,
                    message: `Se modifico la materia ${materia.apellido} ${materia.nombre}`,
                    detail: result
                });
            }
        }
    });

}


materiaDb.delete = function(dni,funCallback){
    var query = 'DELETE FROM materias WHERE dni = ?'
    connection.query(query, dni, function (err, result, fields) {
        if (err) {
            funCallback({
                message: "Surgio un problema, contactese con un administrador. Gracias",
                detail: err
            });
            console.error(err);
        } else {
            if (result.affectedRows == 0) {
                funCallback(undefined,{
                    message: `No se encontro la materia ${dni}`,
                    detail: result
                });
            } else {
                funCallback(undefined,{
                    message: `Se elimino la materia ${dni}`,
                    detail: result
                });
            }
        }
    });
}

/**
 *  
 * @param {*} idmateria 
 * @param {*} funCallback
 *         retorna:
 *              code = 1 (EXITO)
 *              code = 2 (NOT FOUND) (NO encontro elemento)
 *              code = 3 (ERROR)
 * 
 */
materiaDb.logdelete = function (idmateria, funCallback) {
    connection.query("UPDATE materias SET estado = 0 WHERE idmateria = ?",idmateria, function (err, result, fields) {
        if (err) {
            funCallback({
                code:3,
                message: "Surgio un problema, contactese con un administrador. Gracias",
                detail: err
            }); 
            console.error(err);
        } else {
            if (result.affectedRows == 0) {
                funCallback({
                    code:2,
                    message: `No se encontro el id  ${idmateria} de la materia`,
                    detail: result
                }); 
            } else {
         //       console.error(err);
                    funCallback({
                    code:1,
                    message: `Se modifico la materia con el id ${idmateria}`,
                    detail: result
                }); 
            }
        }
    });
}

module.exports = materiaDb;
