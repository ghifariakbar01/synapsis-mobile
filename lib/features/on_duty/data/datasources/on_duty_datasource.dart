import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../dto/message_dto.dart';

class OnDutyDatasource {
  final Dio dio;
  late WebSocketChannel? _webSocketChannel;

  OnDutyDatasource(this.dio);

  /// Subscribe to the WebSocket channel
  Future<void> subscribeToWebSocket({
    String unitId = "82c728120c",
    required Function(dynamic) onError,
  }) async {
    final String channelUrl =
        "wss://wss.apps-madhani.com/connection/websocket/ws/fms-dev/monitoring/messages/equipments/$unitId";

    try {
      const String scheme = 'wss'; // Explicitly set the scheme to 'wss'
      const String host = 'wss.apps-madhani.com';
      const String path =
          '/connection/websocket/ws/fms-dev/monitoring/messages/equipments';
      const String unitId = '82c728120c';

      // Construct the URI manually
      final uri = Uri(
        scheme: scheme,
        host: host,
        path: '$path/$unitId',
      );

      print('Connecting to WebSocket: $uri');

      // Initialize the WebSocket connection
      _webSocketChannel = WebSocketChannel.connect(uri);

      print("WebSocket connected to $channelUrl");
    } catch (err) {
      print('err: $err');
    }

    await _webSocketChannel?.ready;

    // Listen to incoming messages
    _webSocketChannel?.stream.listen(
      (message) {
        print("Message received: $message");
        print("Message received decoded: ${jsonDecode(message)}");

        handleIncomingMessage(jsonDecode(message)); // Example of JSON handling
      },
      onError: onError,
      onDone: () {
        print("WebSocket connection closed.");
      },
    );
  }

  /// Handle the incoming WebSocket message
  void handleIncomingMessage(dynamic message) {
    // Process the message as per your application's logic
    print("Processing message: $message");
  }

  /// Close the WebSocket connection
  void closeWebSocket() {
    _webSocketChannel?.sink.close();
    _webSocketChannel = null;
    print("WebSocket connection closed manually.");
  }

  Future<List<MessageDto>> messages() async {
    final response = await Future.value([
      {
        "id": "slipery-grader",
        "name": "Slipery (Grader)",
        "code": 4,
        "category_id": "2",
        "sending_type": ["Manual"],
        "default_message": "Slippery, segera tangani kondisi jalan ...",
        "created_at": "2024-09-11T13:30:14.68173Z",
        "updated_at": "2024-09-11T13:30:14.68173Z",
        "category_name": "Umum"
      },
      {
        "id": "slipery-fleet",
        "name": "Slipery (Fleet)",
        "code": 6,
        "category_id": "2",
        "sending_type": ["Manual"],
        "default_message": "Start Operasi ...",
        "created_at": "2024-09-11T13:30:14.68173Z",
        "updated_at": "2024-09-11T13:30:14.68173Z",
        "category_name": "Umum"
      },
      {
        "id": "test-fatigue",
        "name": "Test Fatigue",
        "code": 7,
        "category_id": "2",
        "sending_type": ["Manual"],
        "default_message": "Test Fatigue akan dilaksanakan pada Jam ...",
        "created_at": "2024-09-11T13:30:14.68173Z",
        "updated_at": "2024-09-11T13:30:14.68173Z",
        "category_name": "Umum"
      },
      {
        "id": "unit-maintenance",
        "name": "Unit Maintenance",
        "code": 9,
        "category_id": "2",
        "sending_type": ["Manual"],
        "default_message": "Equipment akan di Maintenance ...",
        "created_at": "2024-09-11T13:30:14.68173Z",
        "updated_at": "2024-09-11T13:30:14.68173Z",
        "category_name": "Umum"
      },
      {
        "id": "pray",
        "name": "Pray",
        "code": 14,
        "category_id": "2",
        "sending_type": ["Manual", "Automate"],
        "default_message": "Stop Operasi - Waktunya Ibadah ...",
        "created_at": "2024-09-11T13:30:14.68173Z",
        "updated_at": "2024-09-11T13:30:14.68173Z",
        "category_name": "Umum"
      },
      {
        "id": "after-pray",
        "name": "After Pray",
        "code": 15,
        "category_id": "2",
        "sending_type": ["Manual", "Automate"],
        "default_message": "Waktu jeda untuk ibadah selesai, Start Operasi ...",
        "created_at": "2024-09-11T13:30:14.68173Z",
        "updated_at": "2024-09-11T13:30:14.68173Z",
        "category_name": "Umum"
      },
      {
        "id": "rest",
        "name": "Rest",
        "code": 16,
        "category_id": "2",
        "sending_type": ["Manual", "Automate"],
        "default_message": "Stop Operasi - Waktunya Istirahat ...",
        "created_at": "2024-09-11T13:30:14.68173Z",
        "updated_at": "2024-09-11T13:30:14.68173Z",
        "category_name": "Umum"
      },
      {
        "id": "after-rest",
        "name": "After Rest",
        "code": 17,
        "category_id": "2",
        "sending_type": ["Manual", "Automate"],
        "default_message": "Waktu istirahat selesai, Start Operasi ...",
        "created_at": "2024-09-11T13:30:14.68173Z",
        "updated_at": "2024-09-11T13:30:14.68173Z",
        "category_name": "Umum"
      },
      {
        "id": "other",
        "name": "Other",
        "code": 23,
        "category_id": "2",
        "sending_type": ["Manual"],
        "default_message": "...",
        "created_at": "2024-09-11T13:30:14.68173Z",
        "updated_at": "2024-09-11T13:30:14.68173Z",
        "category_name": "Umum"
      },
      {
        "id": "after-blasting",
        "name": "After Blasting",
        "code": 13,
        "category_id": "1",
        "sending_type": ["Manual"],
        "default_message":
            "Start Operasi (jika kondisi sudah clear) / Stop Operasi - Problem Blasting selesai ditangani ...",
        "created_at": "2024-09-11T13:30:14.68173Z",
        "updated_at": "2024-09-11T13:30:14.68173Z",
        "category_name": "Warning"
      }
    ].map((e) => MessageDto.fromJson(e)).toList());

    return response;
  }
}
