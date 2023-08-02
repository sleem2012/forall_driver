import 'package:flutter/foundation.dart';
import 'package:socket_io_client/socket_io_client.dart' as ws;

class SocketCtrl {
  final String url;
  late ws.Socket _socket;

  SocketCtrl(this.url);

  ws.Socket get init {
    _socket = ws.io(
        url,
        ws.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .build());
    _socket.connect();
    _socket
        .onConnect((_) => debugPrint('*** ===>>> Server Connected <<<=== ***'));
    _socket.onDisconnect(
        (_) => debugPrint('*** ===>>>  Server Disconnect  <<<=== ***'));
    return _socket;
  }

  emit(String event, [dynamic data]) {
    _socket.emit(event, data);
  }

  on(String event, dynamic Function(dynamic) handler) {
    _socket.on(event, handler);
  }

  bool get connected => _socket.connected;

  off(String event, [dynamic Function(dynamic)? handler]) {
    _socket.off(event, handler);
  }
}
