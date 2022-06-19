class GricaResponseModel {
  List<NiveauPerte>? niveauPerte;
  List<Catastrophe>? catastrophe;
  List<Profondeur>? profondeur;
  List<NiveauControle>? niveauControle;
  List<Frequence>? frequence;
  List<Vitesse>? vitesse;

  GricaResponseModel(
      {niveauPerte,
      catastrophe,
      profondeur,
      niveauControle,
      frequence,
      vitesse});

  GricaResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['niveauPerte'] != null) {
      niveauPerte = [];
      json['niveauPerte'].forEach((v) {
        niveauPerte!.add(new NiveauPerte.fromJson(v));
      });
    }
    if (json['catastrophe'] != null) {
      catastrophe = [];
      json['catastrophe'].forEach((v) {
        catastrophe!.add(new Catastrophe.fromJson(v));
      });
    }
    if (json['profondeur'] != null) {
      profondeur = [];
      json['profondeur'].forEach((v) {
        profondeur!.add(new Profondeur.fromJson(v));
      });
    }
    if (json['niveauControle'] != null) {
      niveauControle = [];
      json['niveauControle'].forEach((v) {
        niveauControle!.add(new NiveauControle.fromJson(v));
      });
    }
    if (json['frequence'] != null) {
      frequence = [];
      json['frequence'].forEach((v) {
        frequence!.add(new Frequence.fromJson(v));
      });
    }
    if (json['vitesse'] != null) {
      vitesse = [];
      json['vitesse'].forEach((v) {
        vitesse!.add(new Vitesse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (niveauPerte != null) {
      data['niveauPerte'] = niveauPerte!.map((v) => v.toJson()).toList();
    }
    if (catastrophe != null) {
      data['catastrophe'] = catastrophe!.map((v) => v.toJson()).toList();
    }
    if (profondeur != null) {
      data['profondeur'] = profondeur!.map((v) => v.toJson()).toList();
    }
    if (niveauControle != null) {
      data['niveauControle'] = niveauControle!.map((v) => v.toJson()).toList();
    }
    if (frequence != null) {
      data['frequence'] = frequence!.map((v) => v.toJson()).toList();
    }
    if (vitesse != null) {
      data['vitesse'] = vitesse!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NiveauPerte {
  int? idniveauperte;
  String? libelle;

  NiveauPerte({idniveauperte, libelle});

  NiveauPerte.fromJson(Map<String, dynamic> json) {
    idniveauperte = json['idniveauperte'];
    libelle = json['libelle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idniveauperte'] = idniveauperte;
    data['libelle'] = libelle;
    return data;
  }
}

class Catastrophe {
  int? idcatastrophe;
  String? libelle;
  String? description;

  Catastrophe({idcatastrophe, libelle, description});

  Catastrophe.fromJson(Map<String, dynamic> json) {
    idcatastrophe = json['idcatastrophe'];
    libelle = json['libelle'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idcatastrophe'] = idcatastrophe;
    data['libelle'] = libelle;
    data['description'] = description;
    return data;
  }
}

class Profondeur {
  int? idprofondeur;
  String? libelle;

  Profondeur({idprofondeur, libelle});

  Profondeur.fromJson(Map<String, dynamic> json) {
    idprofondeur = json['idprofondeur'];
    libelle = json['libelle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idprofondeur'] = idprofondeur;
    data['libelle'] = libelle;
    return data;
  }
}

class NiveauControle {
  int? idniveaucontrole;
  String? libelle;

  NiveauControle({idniveaucontrole, libelle});

  NiveauControle.fromJson(Map<String, dynamic> json) {
    idniveaucontrole = json['idniveaucontrole'];
    libelle = json['libelle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idniveaucontrole'] = idniveaucontrole;
    data['libelle'] = libelle;
    return data;
  }
}

class Frequence {
  int? idfrequence;
  String? libelle;

  Frequence({idfrequence, libelle});

  Frequence.fromJson(Map<String, dynamic> json) {
    idfrequence = json['idfrequence'];
    libelle = json['libelle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idfrequence'] = idfrequence;
    data['libelle'] = libelle;
    return data;
  }
}

class Vitesse {
  int? idvitesse;
  String? libelle;

  Vitesse({idvitesse, libelle});

  Vitesse.fromJson(Map<String, dynamic> json) {
    idvitesse = json['idvitesse'];
    libelle = json['libelle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idvitesse'] = idvitesse;
    data['libelle'] = libelle;
    return data;
  }
}
