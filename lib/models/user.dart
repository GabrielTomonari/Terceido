class User {

  final String uid;
  
  User({ this.uid });

}

class UserData {

  final String uid, jogador, personagem, personalidade, comportamentos, raca, classe, classeFavorecida, pele,
  olhos, cabelo, outros, luzNatureza, data;
  final int nivel, exp, idade, agilidade, armas, forca, vigor, magica, inteligencia, mente, luz, bondade,
  acrobacia, aura, bloqueio, briga, conhecimento, concentracao, dialetos, diglade, equilibrio, escalar, esquiva,
  mergulhar, nadar, potencia, prontidao, resistencia, saltar, sobrevivencia, velocidade, vontade, cabeca, tronco,
  abdomen, bracos, pernas, zonas, pm, cansaco, ouro, prata, bronze, sessoes;
  final double peso, altura;
  final List habilidadesExtra, especiaisIniciais, especiaisExtra, especiaisRaca, especiaisClasse, especiaisFavorecida, itens;

  UserData({ this.uid, this.jogador, this.personagem, this.personalidade, this.comportamentos, this.raca, 
  this.classe, this.classeFavorecida, this.pele, this.olhos, this.cabelo, this.outros, this.luzNatureza,
  this.data, this.nivel, this.exp, this.idade, this.agilidade, this.armas, this.forca, this.vigor, this.magica,
  this.inteligencia, this.mente, this.luz, this.bondade, this.acrobacia, this.aura, this.bloqueio, this.briga,
  this.conhecimento, this.concentracao, this.dialetos, this.diglade, this.equilibrio, this.escalar, this.esquiva,
  this.mergulhar, this.nadar, this.potencia, this.prontidao, this.resistencia, this.saltar, this.sobrevivencia,
  this.velocidade, this.vontade, this.cabeca, this.tronco, this.abdomen, this.bracos, this.pernas,
  this.zonas, this.pm, this.cansaco, this.ouro, this.prata, this.bronze, this.sessoes, this.peso, this.altura,
  this.habilidadesExtra, this.especiaisIniciais, this.especiaisExtra, this.especiaisRaca, this.especiaisClasse,
  this.especiaisFavorecida, this.itens});

}