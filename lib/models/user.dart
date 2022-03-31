class UserObj {
  final String id;
  final String name;
  final String email;
  final String imgUrl;
  final String test;

  UserObj({
    required this.id,
    required this.name,
    required this.email,
    required this.imgUrl,
    required this.test
  });

  Map<String, dynamic> toJSON() => {
    "id": id,
    "name": name,
    "email": email,
    "imgUrl": imgUrl,
    "test": test
  };

  factory UserObj.fromMap(Map<String, dynamic>? data) {
    return UserObj(
      id: data?["id"], 
      name: data?["name"], 
      email: data?["email"], 
      imgUrl: data?["imgUrl"],
      test: data?["test"]
    );
  }
}