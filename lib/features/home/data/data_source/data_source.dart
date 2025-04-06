import 'package:http/http.dart' as http;
import 'package:skinalyze/features/home/data/model/api_upload_file.dart';

class RemoteDataSource {
  Future<void> addPhoto(ApiUploadFile uploadModel) async {
    final body = {
      "detail": uploadModel.detail,
    };

    final response = await http.post(
        Uri.parse('https://ss-production-a66e.up.railway.app/docs'),
        body: body);
    if (response.statusCode == 201) {
      return;
    } else {
      throw Exception('Failed to add post');
    }
  }
}
