import 'package:terceido/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  var now = DateTime.now();

  // collection reference
  final CollectionReference characterCollection = Firestore.instance.collection('characters');

  Future<void> updateUserData(
      String
      jogador,
      personagem,
      personalidade,
      comportamentos,
      raca,
      classe,
      classeFavorecida,
      pele,
      olhos,
      cabelo,
      outros,
      luzNatureza,
      data,
      ultimaSessao,
      int nivel,
      exp,
      idade,
      agilidade,
      armas,
      forca,
      vigor,
      magica,
      inteligencia,
      mente,
      luz,
      bondade,
      acrobacia,
      aura,
      bloqueio,
      briga,
      conhecimento,
      concentracao,
      dialetos,
      diglade,
      equilibrio,
      escalar,
      esquiva,
      mergulhar,
      nadar,
      potencia,
      prontidao,
      resistencia,
      saltar,
      sobrevivencia,
      velocidade,
      vontade,
      cabeca,
      tronco,
      abdomen,
      bracos,
      pernas,
      zonas,
      pm,
      cansaco,
      ouro,
      prata,
      bronze,
      sessoes,
      double peso,
      altura,
      List habilidadesExtra,
      especiaisIniciais,
      especiaisExtra,
      especiaisRaca,
      especiaisClasse,
      especiaisFavorecida) async {
    return await characterCollection.document(uid).setData({
      'jogador': jogador,
      'personagem': personagem,
      'personalidade': personalidade,
      'comportamentos': comportamentos,
      'raca': raca,
      'classe': classe,
      'classeFavorecida': classeFavorecida,
      'pele': pele,
      'olhos': olhos,
      'cabelo': cabelo,
      'outros': outros,
      'luzNatureza': luzNatureza,
      'data': data,
      'ultimaSessao': ultimaSessao,
      'nivel': nivel,
      'exp': exp,
      'idade': idade,
      'agilidade': agilidade,
      'armas': armas,
      'forca': forca,
      'vigor': vigor,
      'magica': magica,
      'inteligencia': inteligencia,
      'mente': mente,
      'luz': luz,
      'bondade': bondade,
      'acrobacia': acrobacia,
      'aura': aura,
      'bloqueio': bloqueio,
      'briga': briga,
      'conhecimento': conhecimento,
      'concentracao': concentracao,
      'dialetos': dialetos,
      'diglade': diglade,
      'equilibrio': equilibrio,
      'escalar': escalar,
      'esquiva': esquiva,
      'mergulhar': mergulhar,
      'nadar': nadar,
      'potencia': potencia,
      'prontidao': prontidao,
      'resistencia': resistencia,
      'saltar': saltar,
      'sobrevivencia': sobrevivencia,
      'velocidade': velocidade,
      'vontade': vontade,
      'cabeca': cabeca,
      'tronco': tronco,
      'abdomen': abdomen,
      'bracos': bracos,
      'pernas': pernas,
      'zonas': zonas,
      'pm': pm,
      'cansaco': cansaco,
      'ouro': ouro,
      'prata': prata,
      'bronze': bronze,
      'sessoes': sessoes,
      'peso': peso,
      'altura': altura,
      'habilidadesExtra': habilidadesExtra,
      'especiaisIniciais': especiaisIniciais,
      'especiaisExtra': especiaisExtra,
      'especiaisRaca': especiaisRaca,
      'especiaisClasse': especiaisClasse,
      'especiaisFavorecida': especiaisFavorecida,
    });
  }

  // Create Spells Collection
  Future<void> createSpellsCollection() async{
    return await characterCollection.document(uid).collection('Magias').document('Magia').setData({

    });
  }
  // Create Items Collection
  Future<void> createItemsCollection() async{
    return await characterCollection.document(uid).collection('Itens').document('Item').setData({

    });
  }
  // Create Abilities Collection
  Future<void> createAbilitiesCollection() async{
    return await characterCollection.document(uid).collection('Habilidades').document('Habilidade').setData({

    });
  }
  // Create Specials Collection
  Future<void> createSpecialsCollection() async{
    return await characterCollection.document(uid).collection('Especiais').document('Tipos').setData({

    });
  }
   // Create Specials Subtype 1: Evolução Collection
  Future<void> createEvolutionCollection() async{
    return await characterCollection.document(uid).collection('Especiais').document('Tipos').collection('Evolução').document('Nenhum Especial').setData({

    });
  }
   // Create Specials Subtype 2: Iniciais Collection
  Future<void> createStarterCollection() async{
    return await characterCollection.document(uid).collection('Especiais').document('Tipos').collection('Iniciais').document('Nenhum Especial').setData({

    });
  }
  // Create Specials Subtype 3: Raça/Classe Collection
  Future<void> createClassCollection() async{
    return await characterCollection.document(uid).collection('Especiais').document('Tipos').collection('Raça-Classe').document('Nenhum Especial').setData({

    });
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        jogador: snapshot.data['jogador'],
        personagem: snapshot.data['personagem'],
        personalidade: snapshot.data['personalidade'],
        comportamentos: snapshot.data['comportamentos'],
        raca: snapshot.data['raca'],
        classe: snapshot.data['classe'],
        classeFavorecida: snapshot.data['classeFavorecida'],
        pele: snapshot.data['pele'],
        olhos: snapshot.data['olhos'],
        cabelo: snapshot.data['cabelo'],
        outros: snapshot.data['outros'],
        luzNatureza: snapshot.data['luzNatureza'],
        data: snapshot.data['data'],
        nivel: snapshot.data['nivel'],
        exp: snapshot.data['exp'],
        idade: snapshot.data['idade'],
        agilidade: snapshot.data['agilidade'],
        armas: snapshot.data['armas'],
        forca: snapshot.data['forca'],
        vigor: snapshot.data['vigor'],
        magica: snapshot.data['magica'],
        inteligencia: snapshot.data['inteligencia'],
        mente: snapshot.data['mente'],
        luz: snapshot.data['luz'],
        bondade: snapshot.data['bondade'],
        acrobacia: snapshot.data['acrobacia'],
        aura: snapshot.data['aura'],
        bloqueio: snapshot.data['bloqueio'],
        briga: snapshot.data['briga'],
        conhecimento: snapshot.data['conhecimento'],
        concentracao: snapshot.data['concetracao'],
        dialetos: snapshot.data['dialetos'],
        diglade: snapshot.data['diglade'],
        equilibrio: snapshot.data['equilibrio'],
        escalar: snapshot.data['escalar'],
        esquiva: snapshot.data['esquiva'],
        mergulhar: snapshot.data['mergulhar'],
        nadar: snapshot.data['nadar'],
        potencia: snapshot.data['potencia'],
        prontidao: snapshot.data['prontidao'],
        resistencia: snapshot.data['resistencia'],
        saltar: snapshot.data['saltar'],
        sobrevivencia: snapshot.data['sobrevivencia'],
        velocidade: snapshot.data['velocidade'],
        vontade: snapshot.data['vontade'],
        cabeca: snapshot.data['cabeca'],
        tronco: snapshot.data['tronco'],
        abdomen: snapshot.data['abdomen'],
        bracos: snapshot.data['bracos'],
        pernas: snapshot.data['pernas'],
        zonas: snapshot.data['zonas'],
        pm: snapshot.data['pm'],
        cansaco: snapshot.data['cansaco'],
        ouro: snapshot.data['ouro'],
        prata: snapshot.data['prata'],
        bronze: snapshot.data['bronze'],
        sessoes: snapshot.data['sessoes'],
        peso: snapshot.data['peso'],
        altura: snapshot.data['altura'],
        habilidadesExtra: snapshot.data['habilidadesExtra'],
        especiaisIniciais: snapshot.data['especiaisIniciais'],
        especiaisExtra: snapshot.data['especiaisExtra'],
        especiaisRaca: snapshot.data['especiaisRaca'],
        especiaisClasse: snapshot.data['especiaisClasse'],
        especiaisFavorecida: snapshot.data['especiaisFavorecida'],);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return characterCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }

}