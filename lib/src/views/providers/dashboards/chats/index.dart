import 'package:flutter/material.dart';
import 'package:nyewadotid/src/components/listtile/chat_tile_listtile.dart';

class IndexChat extends StatefulWidget {
  const IndexChat({super.key});

  @override
  State<IndexChat> createState() => _IndexChatState();
}

class _IndexChatState extends State<IndexChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Scrollbar(
        radius: const Radius.circular(10),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverAppBar(
              pinned: true,
              scrolledUnderElevation: 0,
              stretchTriggerOffset: 200,
              expandedHeight: 100.0,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                title: Text('Messages', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                if(index == 0){
                  return ChatTileListtile.chatTileNewMessage(
                    message: "Pesan baru belum dibaca",
                    name: "Bub's",
                    onTap: (){}
                  );
                }else if(index == 1){
                  return ChatTileListtile.chatTileNewMessageReaded(
                    message: "Pesan baru sudah saya baca",
                    name: "Bub's",
                    onTap: (){}
                  );
                }else if(index == 2){
                  return ChatTileListtile.chatTileSentMessageButNotRead(
                    message: "Saya mengirim pesan tapi belum dibaca",
                    name: "Bub's",
                    onTap: (){}
                  );
                }else if(index == 3){
                  return ChatTileListtile.chatTileSentMessage(
                    message: "Saya mengirim pesan tapi sudah dibaca",
                    name: "Bub's",
                    onTap: (){}
                  );
                }else if(index == 4){
                  return ChatTileListtile.chatTileImageReceivedMessageButNotReaded(
                    message: "Saya mengirim pesan gambar tapi belum dibaca oleh penerima",
                    name: "Bub's",
                    onTap: (){}
                  );
                }else if(index == 5){
                  return ChatTileListtile.chatTileReceivedReadMessageImage(
                    message: "Saya Mengirim pesan gambar tapi sudah dibaca",
                    name: "Bub's",
                    onTap: (){}
                  );
                }else if(index == 6){
                  return ChatTileListtile.chatTileImageReceivedMessage(
                    message: "Saya menerima pesan gambar tapi belum saya baca",
                    name: "Bub's",
                    onTap: (){}
                  );
                }else if(index == 7){
                  return ChatTileListtile.chatTileReceivedReadMessageImageWasIreaded(
                    message: "Saya menerima pesan gambar tapi sudah saya baca",
                    name: "Bub's",
                    onTap: (){}
                  );
                }
                return ChatTileListtile.chatTileNewMessage(
                  message: "Lagi apa bub? 😡",
                  name: "Bub's",
                  onTap: (){}
                );
              }, 
              childCount: 8
              ),
            ),
          ],
        ),
      )
    );
  }
}