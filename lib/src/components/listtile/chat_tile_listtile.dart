import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:nyewadotid/src/components/global/index.dart';

class ChatTileListtile {
  // Untuk tile pesan baru sampai ke user
  static ListTile chatTileNewMessage({String? name, String? urlImage, String? message, bool? newMessage, Function()? onTap, String? date}){
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        backgroundImage: urlImage == null ? const AssetImage('assets/images/no_profile.jpg') : NetworkImage(urlImage),
      ),
      title: Text(name ?? "Tidak ada nama", style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold), maxLines: 1),
      subtitle: Text(message ?? "-", style: const TextStyle(color: Colors.black45, fontSize: 12, fontWeight: FontWeight.bold), maxLines: 1),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(date ?? "Now"),
          const Icon(Icons.circle, color: GlobalVariable.secondaryColor, size: 14),
        ],
      ),
    );
  }

  // Untuk tile pesan baru sampai ke user sudah saya baca
  static ListTile chatTileNewMessageReaded({String? name, String? urlImage, String? message, bool? newMessage, Function()? onTap, String? date}){
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        backgroundImage: urlImage == null ? const AssetImage('assets/images/no_profile.jpg') : NetworkImage(urlImage),
      ),
      title: Text(name ?? "Tidak ada nama", style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold), maxLines: 1),
      subtitle: Text(message ?? "-", style: const TextStyle(color: Colors.black45, fontSize: 12), maxLines: 1),
      trailing: Text(date ?? "Now"),
    );
  }

  // Untuk tile saya mengirim pesan tapi belum dibaca penerima
  static ListTile chatTileSentMessageButNotRead({String? name, String? urlImage, String? message, bool? newMessage, Function()? onTap, String? date}){
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        backgroundImage: urlImage == null ? const AssetImage('assets/images/no_profile.jpg') : NetworkImage(urlImage),
      ),
      title: Text(name ?? "Tidak ada nama", style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold), maxLines: 1),
      subtitle: Row(
        children: [
          const Icon(Bootstrap.check2_all, size: 16, color: Colors.black38),
          const SizedBox(width: 5),
          Expanded(child: Text(message ?? "-", style: const TextStyle(color: Colors.black45, fontSize: 12))),
        ],
      ),
      trailing: Text(date ?? "Now"),
    );
  }

  // Untuk tile pesan terkirim dari pengirim berupa pesan saja
  static ListTile chatTileSentMessage({String? name, String? urlImage, String? message, bool? newMessage, Function()? onTap, String? date}){
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        backgroundImage: urlImage == null ? const AssetImage('assets/images/no_profile.jpg') : NetworkImage(urlImage),
      ),
      title: Text(name ?? "Tidak ada nama", style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold), maxLines: 1),
      subtitle: Row(
        children: [
          const Icon(Bootstrap.check2_all, size: 16, color: Colors.blue),
          const SizedBox(width: 5),
          Expanded(child: Text(message ?? "-", style: const TextStyle(color: Colors.black45, fontSize: 12))),
        ],
      ),
      trailing: Text(date ?? "Now"),
    );
  }

  // Untuk menerima pesan berupa gambar tapi belum dibaca
  static ListTile chatTileImageReceivedMessageButNotReaded({String? name, String? urlImage, String? message, bool? newMessage, Function()? onTap, String? date}){
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        backgroundImage: urlImage == null ? const AssetImage('assets/images/no_profile.jpg') : NetworkImage(urlImage),
      ),
      title: Text(name ?? "Tidak ada nama", style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold), maxLines: 1),
      subtitle: Row(
        children: [
          const Icon(Bootstrap.check2_all, size: 16, color: Colors.black38),
          const SizedBox(width: 5),
          const Icon(CupertinoIcons.camera_fill, size: 14, color: Colors.black54),
          const SizedBox(width: 5),
          Expanded(child: Text(message ?? "-", style: const TextStyle(color: Colors.black45, fontSize: 12), maxLines: 1)),
        ],
      ),
      trailing: Text(date ?? "Now"),
    );
  }

  // Untuk menerima pesan berupa gambar tapi belum dibaca
  static ListTile chatTileImageReceivedMessage({String? name, String? urlImage, String? message, bool? newMessage, Function()? onTap, String? date}){
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        backgroundImage: urlImage == null ? const AssetImage('assets/images/no_profile.jpg') : NetworkImage(urlImage),
      ),
      title: Text(name ?? "Tidak ada nama", style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold), maxLines: 1),
      subtitle: Row(
        children: [
          const Icon(CupertinoIcons.camera_fill, size: 14, color: Colors.black54),
          const SizedBox(width: 5),
          Expanded(child: Text(message ?? "-", style: const TextStyle(color: Colors.black45, fontSize: 12, fontWeight: FontWeight.bold), maxLines: 1)),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(date ?? "Now"),
          const Icon(Icons.circle, color: GlobalVariable.secondaryColor, size: 14),
        ],
      ),
    );
  }

  // Untuk menerima pesan berupa gambar dan sudah dibaca
  static ListTile chatTileReceivedReadMessageImage({String? name, String? urlImage, String? message, bool? newMessage, Function()? onTap, String? date}){
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        backgroundImage: urlImage == null ? const AssetImage('assets/images/no_profile.jpg') : NetworkImage(urlImage),
      ),
      title: Text(name ?? "Tidak ada nama", style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold), maxLines: 1),
      subtitle: Row(
        children: [
          const Icon(Bootstrap.check2_all, size: 16, color: Colors.blue),
          const SizedBox(width: 5),
          const Icon(CupertinoIcons.camera_fill, size: 14, color: Colors.black54),
          const SizedBox(width: 5),
          Expanded(child: Text(message ?? "-", style: const TextStyle(color: Colors.black45, fontSize: 12), maxLines: 1)),
        ],
      ),
      trailing: Text(date ?? "Now"),
    );
  }

  // Untuk menerima pesan berupa gambar dan sudah dibaca
  static ListTile chatTileReceivedReadMessageImageWasIreaded({String? name, String? urlImage, String? message, bool? newMessage, Function()? onTap, String? date}){
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        backgroundImage: urlImage == null ? const AssetImage('assets/images/no_profile.jpg') : NetworkImage(urlImage),
      ),
      title: Text(name ?? "Tidak ada nama", style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold), maxLines: 1),
      subtitle: Row(
        children: [
          const Icon(CupertinoIcons.camera_fill, size: 14, color: Colors.black54),
          const SizedBox(width: 5),
          Expanded(child: Text(message ?? "-", style: const TextStyle(color: Colors.black45, fontSize: 12), maxLines: 1)),
        ],
      ),
      trailing: Text(date ?? "Now"),
    );
  }
}