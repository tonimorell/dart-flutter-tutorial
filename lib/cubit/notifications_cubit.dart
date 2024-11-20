import 'package:flutter_bloc/flutter_bloc.dart';
import 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsState.initial());

  void addNotification(String notification) {
    final notifications = List.from(state.notifications);
    notifications.add(notification);
    emit(state.copyWith(notifications: notifications));
  }

  int get notificationsLength => state.notifications.length;
}
