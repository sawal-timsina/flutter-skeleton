import '../index.dart';

class User extends Indexable {
  User({
    required this.id,
    this.firebaseUid,
    this.nickName,
    this.email,
    this.fullName,
    this.residentStatus,
    this.gender,
    this.phone,
    this.age,
    this.isPhoneVerified,
    this.updatedAt,
    this.createdAt,
  }) : super(id);

  final String id;
  final String? firebaseUid;
  final String? nickName;
  final String? email;
  final String? fullName;
  final String? residentStatus;
  final String? gender;
  final String? phone;
  final String? age;
  final bool? isPhoneVerified;
  final String? updatedAt;
  final String? createdAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as String,
        firebaseUid: json['firebase_uid'] as String?,
        nickName: json['nick_name'] as String?,
        email: json['email'] as String?,
        fullName: json['full_name'] as String?,
        residentStatus: json['resident_status'] as String?,
        gender: json['gender'] as String?,
        phone: json['phone'] as String?,
        age: json['age'] as String?,
        isPhoneVerified: json['is_phone_verified'] as bool?,
        updatedAt: json['updated_at'] as String?,
        createdAt: json['created_at'] as String?,
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
