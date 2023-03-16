class User {
  String username;
  String profil;
  int lastConnexion;
  String description;
  int? unreadMessage;
  User(
      {required this.username,
      required this.profil,
      required this.lastConnexion,
      required this.description,
      this.unreadMessage});
}
