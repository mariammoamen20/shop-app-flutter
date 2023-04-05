/*
* {
    "status": true,
    "message": "تم التسجيل بنجاح",
    "data": {
        "name": "Abdullah mansour Ali",
        "email": "abulah@gmail.co",
        "phone": "54554454",
        "id": 53455,
        "image": "https://student.valuxapps.com/storage/assets/defaults/user.jpg",
        "token": "bqkBULN9HNOcGwbIwTB61c5Ci7NUYMsyd0xkXsFmG5S50GJn8DzAMlj9TmH3zvjZGAaYNx"
    }
}
* */
class RegisterModel {
  bool? status;
  String? message;
  UserData? userData;

  RegisterModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    userData = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
}

class UserData {
  String? name;
  String? email;
  String? phone;
  int? id;
  String? token;

  UserData.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    id = json['id'];
    token = json['token'];
  }
}
