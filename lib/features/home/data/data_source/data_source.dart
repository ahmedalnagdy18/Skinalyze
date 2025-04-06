import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:skinalyze/features/home/data/model/api_upload_file.dart';

class RemoteDataSource {
  Future<ApiUploadFile> addPhoto(File file) async {
    final uri = Uri.parse('https://ss-production-a66e.up.railway.app/predict');
    final request = http.MultipartRequest('POST', uri);

    request.files.add(await http.MultipartFile.fromPath('file', file.path));

    final response = await request.send();

    if (response.statusCode == 200) {
      final resStr = await response.stream.bytesToString();
      return apiUploadFileFromJson(resStr);
    } else {
      throw Exception('Failed to upload photo');
    }
  }
}
