class Session {
  String name = "";
  int fluency = 0;
  int temperament = 0;

  Session(this.name, this.fluency, this.temperament);

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "fluency": fluency,
      "temperament": temperament
    };
  }
}