import 'package:skinalyze/features/home/domain/entity/upload_photo_input.dart';

abstract class UploadRepository {
  Future<void> uploadPhoto(UploadPhotoInput input);
}
