import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class AppDeliveryAuthUser {
  AppDeliveryAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<AppDeliveryAuthUser> appDeliveryAuthUserSubject =
    BehaviorSubject.seeded(AppDeliveryAuthUser(loggedIn: false));
Stream<AppDeliveryAuthUser> appDeliveryAuthUserStream() =>
    appDeliveryAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
