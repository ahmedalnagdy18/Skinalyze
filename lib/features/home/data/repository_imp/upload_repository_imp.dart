import 'package:skinalyze/features/home/data/data_source/data_source.dart';
import 'package:skinalyze/features/home/data/model/api_upload_file.dart';
import 'package:skinalyze/features/home/domain/entity/upload_photo_input.dart';
import 'package:skinalyze/features/home/domain/repository/repostory.dart';

class UploadRepositoryImp implements UploadRepository {
  final RemoteDataSource remoteDataSource;

  UploadRepositoryImp({required this.remoteDataSource});

  @override
  Future<ApiUploadFile> uploadPhoto(UploadPhotoInput input) async {
    try {
      return await remoteDataSource.addPhoto(input.file);
    } catch (e) {
      rethrow;
    }
  }
}
