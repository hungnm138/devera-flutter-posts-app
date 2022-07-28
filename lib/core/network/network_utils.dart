import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkUtils {
  Future<bool> get isConnected;
}

class NetworkUtilsImpl implements NetworkUtils {
  final Connectivity _connectivity;

  NetworkUtilsImpl(this._connectivity);

  Stream<ConnectivityResult> get connectionUpdates =>
      _connectivity.onConnectivityChanged;

  Future<ConnectivityResult> getConnectivityResult() =>
      _connectivity.checkConnectivity();

  @override
  Future<bool> get isConnected async {
    var result = await _connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }
}
