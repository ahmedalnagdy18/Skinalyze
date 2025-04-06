import 'dart:convert';

ApiUploadFile apiUploadFileFromJson(String str) =>
    ApiUploadFile.fromJson(json.decode(str));

String apiUploadFileToJson(ApiUploadFile data) => json.encode(data.toJson());

class ApiUploadFile {
  final String? syndrome;

  ApiUploadFile({
    this.syndrome,
  });

  factory ApiUploadFile.fromJson(Map<String, dynamic> json) => ApiUploadFile(
        syndrome: json["syndrome"],
      );

  Map<String, dynamic> toJson() => {
        "syndrome": syndrome,
      };
}
