import 'package:flutter/material.dart';

import '../modules/chat_detail_page.dart';

// ignore: must_be_immutable
class ChatUsersList extends StatefulWidget {
  late String text;
  late String secondaryText;
  late String image;
  late String time;
  bool isMessageRead;
  ChatUsersList(
      {Key? key, required this.text,
      required this.secondaryText,
      required this.image,
      required this.time,
        required this.isMessageRead
      }) : super(key: key);
  @override
  State<ChatUsersList> createState() => _ChatUsersListState();
}

class _ChatUsersListState extends State<ChatUsersList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return ChatDetailPage();
        }));
      },
      child: Container(
        padding: const EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.image),
                    maxRadius: 30,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.text),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            widget.secondaryText,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              widget.time,
              // style: TextStyle(fontSize: 12, color: widget.isMessageRead?Colors.pink Colors.grey.shade500),
            ),
          ],
        ),
      ),
    );
  }
}
