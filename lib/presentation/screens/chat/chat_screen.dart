import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat/domain/entidades/message.dart';
import 'package:chat/presentation/providers/chat_provider.dart';
import 'package:chat/presentation/widgets/chat/her_message_bubble.dart';
import 'package:chat/presentation/widgets/chat/my_message_bubble.dart';
import 'package:chat/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://play-lh.googleusercontent.com/7Ak4Ye7wNUtheIvSKnVgGL_OIZWjGPZNV6TP_3XLxHC-sDHLSE45aDg41dFNmL5COA=s256-rw'),
          ),
        ),
        title: const Text('Mi amor ❤️'),
        centerTitle: false,
      ),
      body: _Chatview(),
    );
  }
}

class _Chatview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      // left: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messageList[index];

                return (message.fromWho == FromWho.hers)
                    ? HerMessageBubble(message: message)
                    : MyMessageBubble(message: message);
              },
            )),
            MessageFieldBox(
              // onValue: (value) => chatProvider.sendMessaje(value),
              onValue: chatProvider.sendMessaje,
            ),
          ],
        ),
      ),
    );
  }
}
