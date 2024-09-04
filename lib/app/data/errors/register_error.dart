import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_error.freezed.dart';

@freezed
class RegisterErrors with _$RegisterErrors {
  const factory RegisterErrors.userNameAlreadyExist() = _UserNameAlreadyExist;
  const factory RegisterErrors.noInternet() = _NoInternet;
  const factory RegisterErrors.unExpectedError() = _UnExpectedError;
  const factory RegisterErrors.serverError({String? errorMessage}) =
      _ServerError;
}
