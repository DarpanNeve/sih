import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
//creating instances
IO.Socket socket;
//init state
@override
void initState() {
  initSocket();
  super.initState();
}
//dispose state .closing state
@override
void dispose() {
  socket.disconnect();
  socket.dispose();
  super.dispose();
}

initSocket() {
  socket = IO.io(APIConstants.socketServerURL, <String, dynamic>{
    'autoConnect': false,
    'transports': ['websocket'],
  });
  socket.connect();
  socket.onConnect((_) {
    print('Connection established');
  });
  socket.onDisconnect((_) => print('Connection Disconnection'));
  socket.onConnectError((err) => print(err));
  socket.onError((err) => print(err));
}

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: null,
    );
  }
}
