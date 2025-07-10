import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final _controller = TextEditingController();
  final List<_ChatMessage> _messages = [];

  late WebSocketChannel _channel;
  bool _connected = false;

  @override
  void initState() {
    super.initState();
    _connectWebSocket();
  }

  void _connectWebSocket() {
    _channel = WebSocketChannel.connect(
      Uri.parse(
          'wss://financial-chatbot.nicesea-280278de.eastus.azurecontainerapps.io/api/v1/ws/chat'),
    );

    _channel.stream.listen((event) {
      final decoded = jsonDecode(event);
      if (decoded['type'] == 'message') {
        _addMessage(decoded['content'], isUser: false);
      } else if (decoded['type'] == 'error') {
        _addMessage('⚠️ ${decoded['content']}', isUser: false);
      }
    }, onDone: () {
      _connected = false;
    }, onError: (e) {
      _addMessage('❌ Connection error', isUser: false);
    });

    _channel.sink.add(jsonEncode({
      "type": "init",
      "data": {
        "name": "Abdelrhaman Othman",
        "investment_portfolio": {"stocks": 60, "bonds": 30, "cash": 10},
        "risk_level": "moderate"
      }
    }));

    _connected = true;
  }

  void _addMessage(String msg, {required bool isUser}) {
    setState(() {
      _messages.add(_ChatMessage(msg, isUser));
    });
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty || !_connected) return;

    _addMessage(text, isUser: true);

    _channel.sink.add(jsonEncode({
      "type": "message",
      "content": text,
    }));

    _controller.clear();
  }

  @override
  void dispose() {
    _channel.sink.close();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (_) {
        return AnimatedPadding(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: const EdgeInsets.all(12),
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Column(
              children: [
                Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final msg = _messages[index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: msg.isUser
                              ? MainAxisAlignment.start
                              : MainAxisAlignment.end,
                          children: [
                            if (msg.isUser)
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: SvgPicture.asset(
                                  'assets/svg/user.svg',
                                  width: 32,
                                  height: 32,
                                ),
                              ),
                            if (!msg.isUser) const Spacer(),
                            Flexible(
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: msg.isUser
                                      ? Colors.grey[200]
                                      : const Color(0xFFE0F7FA),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  msg.text,
                                  textDirection: TextDirection.rtl,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                            if (!msg.isUser)
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: SvgPicture.asset(
                                  'assets/icons/nouh.svg',
                                  width: 32,
                                  height: 32,
                                ),
                              ),
                            if (msg.isUser) const Spacer(),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.send, color: Colors.white),
                      onPressed: _sendMessage,
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(const Color(0xFF1DBF73)),
                        shape: WidgetStateProperty.all(const CircleBorder()),
                        padding:
                            WidgetStateProperty.all(const EdgeInsets.all(14)),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        minLines: 1,
                        maxLines: 5, // يمدد لحد 5 سطور
                        decoration: InputDecoration(
                          hintText: 'اكتب سؤالك هنا...',
                          filled: true,
                          fillColor: Colors.grey[100],
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ChatMessage {
  final String text;
  final bool isUser;

  _ChatMessage(this.text, this.isUser);
}
