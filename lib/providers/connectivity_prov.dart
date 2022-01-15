import 'package:connectivity/connectivity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var connectionProvider = StateProvider<bool>(
  (ref) {
    Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        ref.controller.state = result != ConnectivityResult.none;
      },
    );
    return false;
  },
);
