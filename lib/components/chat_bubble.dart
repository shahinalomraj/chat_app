import 'package:chat_app/models/chat_message.dart';
import 'package:chat_app/modules/chat_detail_page.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChatBubble extends StatefulWidget {
  late ChatMessage chatMessage;

  ChatBubble({Key? key, required List<ChatMessage> chatMessage}) : super(key: key);

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
      child: Align(
        alignment: (widget.chatMessage.type== MessageType.Receiver?Alignment.topLeft:Alignment.topRight),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: (widget.chatMessage.type == MessageType.Receiver?Colors.white:Colors.grey.shade400),
          ),
          padding: const EdgeInsets.all(16),
          child: Text(widget.chatMessage.message),
        ),
      ),
    );
  }
}
