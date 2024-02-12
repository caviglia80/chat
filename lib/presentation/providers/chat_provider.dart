import 'package:flutter/material.dart';
import 'package:chat/config/helpers/get_yes_no_answer.dart';
import 'package:chat/domain/entidades/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  final List<Message> _messageList = [];

  List<Message> get messageList => _messageList;

  Future<void> _addMessage(Message message) async {
    _messageList.add(message);
    onMessageAdded(message);
  }

  Future<void> sendMessaje(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    _addMessage(newMessage);

    if (text.endsWith('?')) {
      await herReply();
    }

    // await moveScrollToBottom();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    _addMessage(herMessage);
    // await moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(microseconds: 100));
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }

  void onMessageAdded(Message message) async {
    notifyListeners();
    moveScrollToBottom();
  }
}
