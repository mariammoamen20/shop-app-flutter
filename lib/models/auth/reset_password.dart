/*{
"status": true,
"message": "تم التعديل بنجاح",
"data": {
"email": "remo@hotmail.com"
}
}*/
class ResetPasswordModel {
  bool? status;
  String? message;

  ResetPasswordModel.fromJson(Map<String,dynamic> json) {
    status = json['status'] ;
    message = json['message'] ;
  }
}


