import 'dart:convert';

import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';

typedef OnMessageCallback = void Function(String message);
typedef OnErrorCallback = void Function(String error);
typedef OnSystemCallback = void Function(String message);

class ChatbotWebSocketUtil {
  static const String _url =
      'wss://financial-chatbot.nicesea-280278de.eastus.azurecontainerapps.io/api/v1/ws/chat';

  final String name;
  final int stocks;
  final int bonds;
  final int cash;
  final String riskLevel;

  final OnMessageCallback onBotMessage;
  final OnErrorCallback onError;
  final OnSystemCallback? onSystem;

  late final WebSocketChannel _channel;
  bool _isConnected = false;

  ChatbotWebSocketUtil({
    required this.name,
    required this.stocks,
    required this.bonds,
    required this.cash,
    required this.riskLevel,
    required this.onBotMessage,
    required this.onError,
    this.onSystem,
  });

  void connect() {
    try {
      _channel = WebSocketChannel.connect(Uri.parse(_url));

      _channel.stream.listen(
        (data) {
          final decoded = jsonDecode(data);
          final type = decoded['type'];
          final content = decoded['content'];

          if (type == 'message') {
            onBotMessage(content);
          } else if (type == 'error') {
            onError(content);
          } else if (onSystem != null) {
            onSystem!("[$type] $content");
          }
        },
        onDone: () => onSystem?.call("Disconnected from chatbot."),
        onError: (e) => onError(e.toString()),
      );

      _sendInitData();
      _isConnected = true;
      onSystem?.call("Connected to chatbot.");
    } catch (e) {
      onError(e.toString());
    }
  }

  void _sendInitData() {
    final initPayload = {
      "type": "init",
      "data": {
        "name": name,
        "investment_portfolio": {
          "stocks": stocks,
          "bonds": bonds,
          "cash": cash,
        },
        "risk_level": riskLevel,
      }
    };

    _channel.sink.add(jsonEncode(initPayload));
  }

  void sendMessage(String message) {
    if (!_isConnected) {
      onError("WebSocket is not connected.");
      return;
    }

    final msg = {
      "type": "message",
      "content": message,
    };

    _channel.sink.add(jsonEncode(msg));
  }

  void disconnect() {
    _channel.sink.close(status.normalClosure);
    _isConnected = false;
    onSystem?.call("Connection closed.");
  }
}
