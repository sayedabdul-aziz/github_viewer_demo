// ignore_for_file: override_on_non_overriding_member

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_viewer_demo/core/network/network-cubit/network_states.dart';

class InternetConnectionCubit extends Cubit<InternetConnectionState> {
  StreamSubscription? subscription;
  InternetConnectionCubit() : super(InternetConnectionInitial());

  // Stream Subscription to listen to internet connection changes.
  void checkConnectivity() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        emit(InternetConnectedState('Internet Connected'));
      } else {
        emit(InternetNotConnectedState('Internet Not Connected'));
      }
    });
  }

  // Close the subscription when the bloc is closed.
  @override
  Future<void> closeSubscription() {
    subscription?.cancel();
    return super.close();
  }
}
