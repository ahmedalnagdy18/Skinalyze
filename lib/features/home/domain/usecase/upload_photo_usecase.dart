import 'package:skinalyze/features/home/domain/entity/upload_photo_input.dart';
import 'package:skinalyze/features/home/domain/repository/repostory.dart';
import 'package:skinalyze/features/home/data/model/api_upload_file.dart';

class UploadPhotoUsecase {
  final UploadRepository repository;

  UploadPhotoUsecase({required this.repository});
  Future<ApiUploadFile> call(UploadPhotoInput input) async {
    return await repository.uploadPhoto(input);
  }
}
