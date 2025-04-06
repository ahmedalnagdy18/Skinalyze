import 'dart:convert';

ApiUploadFile apiUploadFileFromJson(String str) =>
    ApiUploadFile.fromJson(json.decode(str));

String apiUploadFileToJson(ApiUploadFile data) => json.encode(data.toJson());

class ApiUploadFile {
  final List<Detail>? detail;

  ApiUploadFile({
    this.detail,
  });

  factory ApiUploadFile.fromJson(Map<String, dynamic> json) => ApiUploadFile(
        detail: json["detail"] == null
            ? []
            : List<Detail>.from(json["detail"]!.map((x) => Detail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "detail": detail == null
            ? []
            : List<dynamic>.from(detail!.map((x) => x.toJson())),
      };
}

class Detail {
  final List<dynamic>? loc;
  final String? msg;
  final String? type;

  Detail({
    this.loc,
    this.msg,
    this.type,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        loc: json["loc"] == null
            ? []
            : List<dynamic>.from(json["loc"]!.map((x) => x)),
        msg: json["msg"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "loc": loc == null ? [] : List<dynamic>.from(loc!.map((x) => x)),
        "msg": msg,
        "type": type,
      };
}
