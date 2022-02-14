// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      email: json['email'] as String,
      fullName: json['full_name'] as String,
      gender: json['gender'] as String,
      phone: json['phone'] as String,
      age: json['age'] as String,
      isPhoneVerified: json['is_phone_verified'] as bool,
      updatedAt: json['updated_at'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'is_phone_verified': instance.isPhoneVerified,
      'email': instance.email,
      'full_name': instance.fullName,
      'gender': instance.gender,
      'phone': instance.phone,
      'age': instance.age,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
    };
