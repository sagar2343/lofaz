import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_failures.freezed.dart';

@freezed
class ApiFailure with _$ApiFailure {
  const factory ApiFailure.noInternet() = _NoInternet;
  const factory ApiFailure.noData() = _NoData;

  const factory ApiFailure.serverError({String? errorMessage}) = _ServerError;

  const factory ApiFailure.unExpectedError({String? errorMessage}) =
      _UnExpectedError;
}

extension ApiFailureX on ApiFailure {
  String get errorMessage {
    return when(
        noInternet: () => "Please check your internet connection",
        noData: () => "No data found",
        serverError: (String? errorMessage) =>
            errorMessage ?? "Server error, please try again later",
        unExpectedError: (String? errorMessage) =>
            errorMessage ?? "Something went wrong, please try again later");
  }
}
