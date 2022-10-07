part of "objects.dart";

@JsonSerializable()
class UserModel {
  final String name;
  final String email;
  final String uid;

  UserModel(this.uid, this.name, this.email);
  //-------bind json data to user model
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  // UserModel.fromJson(Map<String, dynamic> json)
  //     : uid = json['uid'],
  //       name = json['name'],
  //       email = json['email'];

  //--------convert user model into json object
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
  // Map<String, dynamic> toJson() => {
  //       'uid': uid,
  //       'name': name,
  //       'email': email,
  //     };
}
