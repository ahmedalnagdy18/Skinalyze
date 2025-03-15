import 'package:json_annotation/json_annotation.dart';
import 'package:skinalyze/features/authentication/domain/entity/sign_up_input.dart';

part 'api_sign_up_input.g.dart';

@JsonSerializable()
class ApiSignUpInput {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  ApiSignUpInput(
      {required this.email,
      required this.password,
      required this.firstName,
      required this.lastName});

  factory ApiSignUpInput.fromJson(Map<String, dynamic> json) =>
      _$ApiSignUpInputFromJson(json);

  Map<String, dynamic> toJson() => _$ApiSignUpInputToJson(this);
  factory ApiSignUpInput.fromInput(SignUpInput input) {
    return ApiSignUpInput(
      email: input.email,
      firstName: input.firstName,
      lastName: input.lastName,
      password: input.password,
    );
  }
}
