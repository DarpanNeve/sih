  import 'package:flutter/material.dart';
  import 'package:socket_io_client/socket_io_client.dart' as io;
  //creating instances
  io.Socket? socket;

  class Demo extends StatefulWidget {
    const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  //init state
  @override
  void initState() {
    super.initState();
    initSocket();
  }
  //dispose state .closing state
  @override
  void dispose() {
    socket?.disconnect();
    socket?.dispose();
    super.dispose();
  }

  initSocket() {
    socket = io.io("http://192.168.0.118:80", <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
    });
    socket?.connect();
    socket?.onConnect((_) {
      print('Connection established');
    });
    socket?.onDisconnect((_) => print('Connection Disconnection'));
    socket?.onError((err) {
      print(err);
    });

    // Add this line to enable debug logs
  }

  @override
    Widget build(BuildContext context) {
      return const Scaffold(
        body: Center(child: Text("Flutter")),
      );
    }
}
