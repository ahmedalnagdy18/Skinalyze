import 'package:skinalyze/features/home/data/model/api_upload_file.dart';
import 'package:skinalyze/features/home/domain/entity/upload_photo_input.dart';

abstract class UploadRepository {
  Future<ApiUploadFile> uploadPhoto(UploadPhotoInput input);
}
