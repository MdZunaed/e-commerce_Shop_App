class UserModel {
  UserModel({this.id, this.name, this.email, this.pass, this.imageUrl});
  String? id;
  String? name;
  String? email;
  String? pass;
  String? imageUrl;
  UserModel.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    name = map["name"];
    email = map["email"];
    pass = map["pass"];
    imageUrl = map["imageUrl"];
  }
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "pass": pass,
      "imageUrl": imageUrl,
    };
  }
}
