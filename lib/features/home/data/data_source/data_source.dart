import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:skinalyze/features/home/data/model/api_upload_file.dart';

class RemoteDataSource {
  Future<ApiUploadFile> addPhoto(File file) async {
    final uri = Uri.parse('https://ss-production-a66e.up.railway.app/predict/');
    final request = http.MultipartRequest('POST', uri);

    request.files.add(await http.MultipartFile.fromPath('file', file.path));

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(
        streamedResponse); // ← convert stream to regular response

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonBody = jsonDecode(response.body);
      return ApiUploadFile.fromJson(jsonBody); // ← dictionary-style parsing
    } else {
      throw Exception('Failed to upload photo');
    }
  }
}
