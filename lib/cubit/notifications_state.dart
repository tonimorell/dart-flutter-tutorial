import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications_state.freezed.dart';

@freezed
class NotificationsState with _$NotificationsState {
  const factory NotificationsState({
    @Default([]) List<dynamic> notifications,
  }) = _NotificationsState;

  factory NotificationsState.initial() => const NotificationsState();
}
