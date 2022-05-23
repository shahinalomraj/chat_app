import 'package:chat_app/components/chat_bubble.dart';
import 'package:chat_app/models/chat_message.dart';
import 'package:chat_app/models/send_menu_items.dart';
import 'package:flutter/material.dart';
import '../components/chat_detail_page_appBar.dart';

enum MessageType{
  // ignore: constant_identifier_names
  Sender,
  // ignore: constant_identifier_names
  Receiver,
}

// ignore: must_be_immutable
class ChatDetailPage extends StatelessWidget {
  List<ChatMessage> chatMessage = [
    ChatMessage(message: "Hi John", type: MessageType.Receiver),
    ChatMessage(message: "Hope tou are join good", type: MessageType.Receiver),
    ChatMessage(message: "Hello Jane, I am good what about you ", type: MessageType.Sender),
    ChatMessage(message: "I am fine, Working for home", type: MessageType.Receiver),
    ChatMessage(message: "Oh Nice same hare man", type: MessageType.Sender),
  ];

  List<SendMenuItems> menuItems = [
    SendMenuItems(text: "Photos & Videos", color: Colors.amber, icons: Icons.image),
    SendMenuItems(text: "Document", color: Colors.blue, icons: Icons.insert_drive_file),
    SendMenuItems(text: "Audio", color: Colors.orange, icons: Icons.music_note),
    SendMenuItems(text: "Location", color: Colors.green, icons: Icons.location_on),
    SendMenuItems(text: "Contact", color: Colors.purple, icons: Icons.person),
  ];

  ChatDetailPage({Key? key}) : super(key: key);

  get context => null;
  
  void showModal(){
    showModalBottomSheet(
        context: context,
        builder: (context){
          return Container(
            height: MediaQuery.of(context).size.height/2,
            color: const Color(0xff737373),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 16,),
                  Center(
                    child: Container(
                      height: 4,
                      width: 50,
                      color: Colors.grey.shade200,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  ListView.builder(
                    itemCount: menuItems.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                      return Container(
                        padding: const EdgeInsets.only(top: 10,bottom: 10),
                        child: ListTile(
                          leading: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: menuItems[index].color.shade50,
                            ),
                            height: 50,
                            width: 50,
                            child: Icon(menuItems[index].icons,size: 20,color: menuItems[index].color.shade400,),
                          ),
                          title: Text(menuItems[index].text),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChatDetailPageAppBar(),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: chatMessage.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10,bottom: 10),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              return ChatBubble(
                chatMessage: chatMessage,
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 16,bottom: 10),
              height: 80,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      showModal();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 21,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16,),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Type message",
                          hintStyle: TextStyle(color: Colors.grey.shade500),
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: const EdgeInsets.only(right: 30, bottom: 50),
              child: FloatingActionButton(
                onPressed: (){},
                child: const Icon(Icons.send,color: Colors.white,),
                backgroundColor: Colors.pink,
                elevation: 0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
