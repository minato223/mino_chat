import 'package:flutter/material.dart';
import 'package:mino_chat/themes/theme_provider.dart';
import 'package:mino_chat/views/home/chats/chats_detail.dart';
import 'package:mino_chat/views/home/home.dart';
import 'package:mino_chat/views/landscape/landscape.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mino Chat',
      theme: ThemeProvider.light,
      home: const ChatsDetail(),
    );
  }
}
