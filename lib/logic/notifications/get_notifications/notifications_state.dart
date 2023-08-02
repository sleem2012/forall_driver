import 'package:forall_driver/data/models/notifications.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'notifications_state.freezed.dart';

@freezed
abstract class NotificationsState with _$NotificationsState {
  const factory NotificationsState.initial() = NotificationsStateInitial;
  const factory NotificationsState.loading() = NotificationsStateLoading;
  const factory NotificationsState.success({required NotificationsModel notificationsModel}) = NotificationsStateSuccess;
  const factory NotificationsState.error({required String error}) = NotificationsStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs 