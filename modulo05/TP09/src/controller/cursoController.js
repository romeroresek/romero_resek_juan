require("rootpath")();
const express = require('express');
const app = express();

const cursoDb = require("../datasource/cursoDB.js");


app.get('/', getAll);

app.get('/:dni', getByDni);

app.post('/', create);

app.put('/:dni', update);

app.delete('/del/:dni', eliminar);

app.delete('/:idcurso', eliminacionlogica);

// Metododo para listar todas las cursos 
function getAll(req, res) {
    cursoDb.getAll(function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
// Metodo para buscar cursos por su dni
function getByDni(req, res) {
    cursoDb.getByDni(req.params.dni,function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
// Metodo para agregar cursoas
function create(req, res) {
    cursoDb.create(req.body, function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
// Metodo para modificar curso
function update(req, res) {
    cursoDb.update(req.params.dni, req.body, function (result) {
        if (result.code == 3) {
            res.status(500).send(err);
        } else if (result.code == 2) {
            res.status(404).json(result);
        } else {
            res.json(result);
        }
    });
}
// Metodo par eliminar fisicmente cursos de la base de datos
function eliminar(req, res) {
    cursoDb.delete(req.params.dni,  function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            if (result.detail.affectedRows == 0) {
                res.status(404).json(result);
            } else {
                res.json(result);
            }
        }
    });
}
// Metodo par eliminar cursos cambiando el estado a 0
function eliminacionlogica(req, res) {
    cursoDb.logdelete(req.params.idcurso, function (result) {
        if (result.code == 3) {
            res.status(500).send(err);
        } else if (result.code == 2) {
                res.status(404).json(result);  
        } else if (result.code == 1) {      
            res.json(result);
        }
    });
}

module.exports = app;