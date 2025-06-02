var quizModel = require("../models/quizModel");

function listar(req, res) {
    quizModel.listar()
        .then(function (resultado) {
            if (resultado.length > 0) {
                res.status(200).json(resultado);
            } else {
                res.status(204).send("Nenhum resultado encontrado!")
            }
        }).catch(
            function (erro) {
                console.log(erro);
                console.log("Houve um erro ao realizar a consulta! Erro: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function registrarQuiz(req, res) {
    var fkusuario = req.body.FkUsuario;
    var Pontuacao = req.body.pontuacao;

    if (Pontuacao == undefined) {
        res.status(400).send("A pontuação está indefinido!");
    } else if (fkusuario == undefined) {
        res.status(400).send("O usuario está indefinido!");
    }
        else {
        quizModel.registrarQuiz(fkusuario, Pontuacao)
            .then(function (resultado) {
                res.json(resultado);
            }).catch(function (erro) {
                console.log(erro);
                console.log("\nHouve um erro ao realizar o registro! Erro: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            });
    }
    }


module.exports = {
    listar,
    registrarQuiz
}