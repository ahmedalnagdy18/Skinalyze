import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:skinalyze/features/home/data/model/api_upload_file.dart';
import 'package:skinalyze/features/home/domain/entity/upload_photo_input.dart';
import 'package:skinalyze/features/home/domain/usecase/upload_photo_usecase.dart';

part 'upload_file_state.dart';

class UploadFileCubit extends Cubit<UploadFileState> {
  final UploadPhotoUsecase uploadPhotoUsecase;

  UploadFileCubit(this.uploadPhotoUsecase) : super(UploadFileInitial());

  Future<void> upload(File file) async {
    emit(UploadFileLoading());
    try {
      final result = await uploadPhotoUsecase(UploadPhotoInput(file: file));
      emit(UploadFileSuccess(result));
    } catch (e) {
      emit(UploadFileFailure(e.toString()));
    }
  }
}
