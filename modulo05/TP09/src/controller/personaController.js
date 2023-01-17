require("rootpath")();
const express = require('express');
const app = express();

const personaDb = require("../datasource/personaDB.js");


app.get('/', getAll);

app.get('/idpersona/:idpersona', getByIdPersona);

app.get('/dni/:dni', getByDni);

app.post('/', create);

app.put('/idpersona/:idpersona', updateByIdPersona);

app.put('/dni/:dni', update);

app.delete('/del/:dni', eliminar);

app.delete('/idpersona/:idpersona', eliminarByIdPersona); // Metodo par eliminar personas byId

app.delete('/:idpersona', eliminacionlogica); // Metodo par eliminar personas cambiando el estado a 0

// Metododo para listar todas las personas 
function getAll(req, res) {
    personaDb.getAll(function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}

// Metodo para buscar personas por su idpersona
function getByIdPersona(req, res) {
    personaDb.getByIdPersona(req.params.idpersona,function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}

// Metodo para buscar personas por su dni
function getByDni(req, res) {
    personaDb.getByDni(req.params.dni,function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}


// Metodo para agregar personaas
function create(req, res) {
    personaDb.create(req.body, function (err, result) {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
}
// Metodo para modificar updateByIdPersona
function updateByIdPersona(req, res) {
    personaDb.updateByIdPersona(req.params.idpersona, req.body, function (result) {
        if (result.code == 3) {
            res.status(500).send(err);
        } else if (result.code == 2) {
            res.status(404).json(result);
        } else {
            res.json(result);
        }
    });
}

// Metodo para modificar personas por id
function update(req, res) {
    personaDb.update(req.params.dni, req.body, function (result) {
        if (result.code == 3) {
            res.status(500).send(err);
        } else if (result.code == 2) {
            res.status(404).json(result);
        } else {
            res.json(result);
        }
    });
}


// Metodo par eliminar fisicmente personas de la base de datos
function eliminar(req, res) {
    personaDb.delete(req.params.dni,  function (err, result) {
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

// Metodo par eliminar fisicmente personas de la base de datos por ByIdPersona
function eliminarByIdPersona(req, res) {
    personaDb.deleteByIdPersona(req.params.idpersona,  function (err, result) {
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

// Metodo par eliminar personas cambiando el estado a 0
function eliminacionlogica(req, res) {
    personaDb.logdelete(req.params.idpersona, function (result) {
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