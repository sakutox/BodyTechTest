class UserModel {
  String? uid;
  String? correo;
  
  UserModel({this.uid, this.correo});

  factory UserModel.fromMap(map){
    return UserModel(
      uid: map['uid'],
      correo: map['correo']
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'uid': uid,
      'correo': correo
    };
  }
}