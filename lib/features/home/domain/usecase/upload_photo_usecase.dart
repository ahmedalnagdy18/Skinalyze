import 'package:skinalyze/features/home/domain/entity/upload_photo_input.dart';
import 'package:skinalyze/features/home/domain/repository/repostory.dart';

class UploadPhotoUsecase {
  final UploadRepository repository;

  UploadPhotoUsecase({required this.repository});
  Future<void> call(UploadPhotoInput input) async {
    return await repository.uploadPhoto(input);
  }
}
