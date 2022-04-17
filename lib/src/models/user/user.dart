import '../index.dart';

class User extends Indexable {
  User({
    required this.id,
    required this.firebaseUid,
    required this.nickName,
    required this.email,
    required this.fullName,
    required this.residentStatus,
    required this.gender,
    required this.phone,
    required this.age,
    required this.isPhoneVerified,
    required this.updatedAt,
    required this.createdAt,
  }) : super(id);

  int id;
  String firebaseUid;
  String nickName;
  String email;
  String fullName;
  String residentStatus;
  String gender;
  String phone;
  String age;
  bool isPhoneVerified;
  String updatedAt;
  String createdAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int,
        firebaseUid: json['firebase_uid'] as String,
        nickName: json['nick_name'] as String,
        email: json['email'] as String,
        fullName: json['full_name'] as String,
        residentStatus: json['resident_status'] as String,
        gender: json['gender'] as String,
        phone: json['phone'] as String,
        age: json['age'] as String,
        isPhoneVerified: json['is_phone_verified'] as bool,
        updatedAt: json['updated_at'] as String,
        createdAt: json['created_at'] as String,
      );

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "firebase_uid": firebaseUid,
        "nick_name": nickName,
        "email": email,
        "full_name": fullName,
        "resident_status": residentStatus,
        "gender": gender,
        "phone": phone,
        "age": age,
        "is_phone_verified": isPhoneVerified,
        "updated_at": updatedAt,
        "created_at": createdAt,
      };
}
