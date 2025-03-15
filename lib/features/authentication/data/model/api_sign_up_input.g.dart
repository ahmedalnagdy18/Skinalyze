// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_sign_up_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiSignUpInput _$ApiSignUpInputFromJson(Map<String, dynamic> json) =>
    ApiSignUpInput(
      email: json['email'] as String,
      password: json['password'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$ApiSignUpInputToJson(ApiSignUpInput instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
    };
