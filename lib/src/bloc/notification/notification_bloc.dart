import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firstapp/src/models/legacy_notification.dart';
import 'package:firstapp/src/models/models.dart';
import 'package:firstapp/src/services/api.dart';
import 'package:flutter/foundation.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final Api api = Api();
  NotificationBloc() : super(const NotificationState()) {
    on<GetAllNotifications>(_onLoadNotifications);
    on<GetLegacyNotifications>(_onLoadLegacyNotification);
    on<NotificationError>(_onError);
  }

  void _onLoadNotifications(GetAllNotifications event, Emitter<NotificationState> emit) async {
    try {
      List<NotiList> notifications = await api.getNotification();
      emit(state.copyWith(notifications: notifications));
    } catch (e) {
      emit(state.copyWith(isError: true));
      if (kDebugMode) print(e);
    }
  }

  void _onLoadLegacyNotification(GetLegacyNotifications event, Emitter<NotificationState> emit) async {
    try {
      List<LegacyNotificationList> legacyNotification = await api.getLegacyNotification();
      emit(state.copyWith(legacyNotifications: legacyNotification));
    } catch (e) {
      emit(state.copyWith(isError: true));
      if(kDebugMode) print(e);
    }
  }

  void _onError(NotificationError event, Emitter<NotificationState> emit) {
    emit(state.copyWith(isError: event.error));
  }
}
