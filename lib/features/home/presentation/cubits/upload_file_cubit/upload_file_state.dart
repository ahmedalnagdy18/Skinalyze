part of 'upload_file_cubit.dart';

sealed class UploadFileState extends Equatable {
  const UploadFileState();

  @override
  List<Object> get props => [];
}

final class UploadFileInitial extends UploadFileState {}

class UploadFileLoading extends UploadFileState {}

class UploadFileSuccess extends UploadFileState {
  final ApiUploadFile response;

  const UploadFileSuccess(this.response);

  @override
  List<Object> get props => [response];
}

class UploadFileFailure extends UploadFileState {
  final String message;

  const UploadFileFailure(this.message);

  @override
  List<Object> get props => [message];
}
