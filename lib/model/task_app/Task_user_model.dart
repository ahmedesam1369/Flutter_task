import 'package:firebase_database/firebase_database.dart';
import 'package:fristapp/modules/shop_app/shop_register/shop_register_screen.dart';

class TaskUserModel {
  late String name;
  late String email;
  late String phone;
  late String uId;
  late String image;
  late String cover;
  late String bio;
  late bool isEmailVerfied;
  TaskUserModel({
    this.name ='',
    this.email = '',
    this.phone ='',
    this.uId = '',
    this.image = '',
    this.cover = '',
    this.bio = '',
    this.isEmailVerfied = false,
  });
  TaskUserModel.fromJson(Map<String, dynamic>? json){
    name = json!['name'];
    email = json['email'];
    phone = json['phone'];
    uId = json['uId'];
    image = json['image'];
    cover = json['cover'];
    bio = json['bio'];
    isEmailVerfied = json['isEmailVerfied'];
  }
  Map<String,dynamic> toMap(){
    return {
      'name' : name,
      'email' : email,
      'phone': phone,
      'uId' : uId,
      'image' : image,
      'cover': cover,
      'bio':bio,
      'isEmailVerfied' : isEmailVerfied,
    };
  }
}

class UsersModel{
  late String key;
  late String name;
  late String birthDay;
  late String age;
  late String bio;
  late String phone;
  UsersModel({
    this.key = '',
    this.name ='',
    this.birthDay= '',
    this.age = '',
    this.bio = '',
    this.phone = '',
  }){
  }
  UsersModel.fromSnapshot(DataSnapshot snapshot){
    name = snapshot.child("name").value.toString();
    birthDay = snapshot.child("birthDay").value.toString();
    age = snapshot.child("id").value.toString();
    bio = snapshot.child("bio").value.toString();
    phone = snapshot.child("phone").value.toString();
  }
  Map<String,dynamic> toMap()
  {
    return {
      'name' : name,
      'birthDay' : birthDay,
      'age' : age,
      'bio' : bio,
      'phone' : phone,
    };
  }
}