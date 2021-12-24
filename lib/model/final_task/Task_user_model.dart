class TaskUserModel {
  late String name;
  late String email;
  late String phone;
  late String id;
  late String image;
  late String cover;
  late String bio;
  late bool isEmailVerfied;
  TaskUserModel({
    this.name = '',
    this.email = '',
    this.phone = '',
    this.id = '',
    this.image = '',
    this.cover = '',
    this.bio = '',
    this.isEmailVerfied = false,
  });
  TaskUserModel.fromJson(Map<String, dynamic>? json) {
    name = json!['name'];
    email = json['email'];
    phone = json['phone'];
    id = json['id'];
    image = json['image'];
    cover = json['cover'];
    bio = json['bio'];
    isEmailVerfied = json['isEmailVerfied'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'id': id,
      'image': image,
      'cover': cover,
      'bio': bio,
      'isEmailVerfied': isEmailVerfied,
    };
  }
}

class UsersModel {
  late String id;
  late String name;
  late String birthDay;
  late String age;
  late String bio;
  late String phone;
  late String image;
  UsersModel({
    this.id = '',
    this.name = '',
    this.birthDay = '',
    this.age = '',
    this.bio = '',
    this.phone = '',
    this.image = '',
  }) {}
  UsersModel.fromJson(Map<String, dynamic>? json) {
    name = json!["name"];
    birthDay = json["birthDay"];
    age = json["id"];
    bio = json["bio"];
    phone = json["phone"];
    image = json["image"];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'birthDay': birthDay,
      'age': age,
      'bio': bio,
      'phone': phone,
      'image': image,
    };
  }
}
