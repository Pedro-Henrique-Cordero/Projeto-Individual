var database = require("../database/config")

function listar() {
    console.log("ACESSEI O QUIZ MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucao = `
        select * from resposta;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function registrarQuiz(fkusuario, Pontuacao) {
    console.log("ACESSEI O QUIZ MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function registrar(): ", fkusuario, Pontuacao);

    var instrucao = `
        insert into resposta (fkusuario, fkquiz, qtdacertos )
        values (${fkusuario}, 1, ${Pontuacao});
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function buscarQtdTentativas(idUsuario) {
    var instrucao = `
        select count(*) as tentativas 
        from resposta 
        where fkusuario = ${idUsuario};
    `;
    return database.executar(instrucao);
}

function buscarMaiorPontuacao(idUsuario) {
    var instrucao = `
        select max(qtdacertos) as maiorpontuacao 
        from resposta 
        where fkusuario = ${idUsuario};
    `;
    return database.executar(instrucao);
}

function obterTentativasEPontuacao(idUsuario) {
  const instrucao = `
    select 
      count(*) as tentativas,
      max(qtdacertos) as maiorpontuacao
    from resposta
    where fkusuario = ${idUsuario};
  `;
  return database.executar(instrucao);
}

function buscarUltimaTentativa(idUsuario) {
    var instrucao = `
        select max(date_format(dtresposta, '%d/%m/%y')) as ultimatentativa 
        from resposta 
        where fkusuario = ${idUsuario};
    `;
    return database.executar(instrucao);
}

function obterAcertosErrosUltimaTentativa(idUsuario) {
  const instrucao = `
    select 
      qtdacertos,
      (10 - qtdacertos) as erros
    from resposta
    where fkusuario = ${idUsuario}
    order by tentativa desc
    limit 1;
  `;
  return database.executar(instrucao);
}

function obterPontuacoesPorTentativa(idUsuario) {
    const instrucao = `
        select tentativa, qtdacertos as pontuacao
        from resposta
        where fkusuario = ${idUsuario}
        order by tentativa desc
        limit 5;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}


module.exports = {
    listar,
    registrarQuiz,
    buscarQtdTentativas,
    buscarMaiorPontuacao,
    buscarUltimaTentativa,
    obterAcertosErrosUltimaTentativa,
    obterTentativasEPontuacao,
    obterPontuacoesPorTentativa
};
