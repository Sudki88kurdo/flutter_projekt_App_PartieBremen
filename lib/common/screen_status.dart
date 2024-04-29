import 'package:freezed_annotation/freezed_annotation.dart';

part 'screen_status.freezed.dart';

@freezed
class ScreenStatus with _$ScreenStatus {
  const factory ScreenStatus.pure() = ScreenStatusPure;
  const factory ScreenStatus.loading() = ScreenStatusLoading;
  const factory ScreenStatus.success() = ScreenStatusSuccess;
  const factory ScreenStatus.error({String? msg}) = ScreenStatusError;
}