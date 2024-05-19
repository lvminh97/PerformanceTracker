class Account {
  String username = "";
  String email = "";
  String password = "";

  Account(this.username, this.password, this.email);

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "email": email,
      "password": password
    };
  }
}