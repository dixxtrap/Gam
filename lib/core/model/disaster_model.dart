class DisasterModel {
  late Map<String, dynamic> niveauPerte;
  late Map<String, dynamic> niveauControle;
  late Map<String, dynamic> frequence;
  late Map<String, dynamic> vitesse;
  late Map<String, dynamic> profondeur;
  late Map<String, dynamic> catastrophe;
  DisasterModel({
    required this.niveauPerte,
    required this.niveauControle,
    required this.frequence,
    required this.vitesse,
    required this.profondeur,
  });
  DisasterModel.fromJson(Map<String, dynamic> json) {
    niveauPerte = json['niveauPerte'];
    niveauControle = json['niveauControle'];
    catastrophe = json['catastrophe'];
    profondeur = json['profondeur'];
    frequence = json['frequence'];
    vitesse = json['vitesse'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['niveauPerte'] = niveauPerte;
    data['niveauControle'] = niveauControle;
    data['catastrophe'] = catastrophe;
    data['profondeur'] = profondeur;
    data['frequence'] = frequence;
    data['vitesse'] = vitesse;

    return data;
  }
}
