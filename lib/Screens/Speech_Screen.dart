import 'dart:convert';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:hospital_application/API/speech_api.dart';
import 'package:hospital_application/Widget/substring_highlighted.dart';
import 'package:hospital_application/utils.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  static String routName = '/SpeechScreen';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String text = 'Press the button and start speaking';
  bool isListening = false;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("Speech"),
      centerTitle: true,
      actions: [
        Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.content_copy),
            onPressed: () async {
              await FlutterClipboard.copy(text);

              Scaffold.of(context).showSnackBar(
                SnackBar(content: Text('✓   Copied to Clipboard')),
              );
            },
          ),
        ),
      ],
    ),
    body: SingleChildScrollView(
      reverse: true,
      padding: const EdgeInsets.all(30).copyWith(bottom: 150),
      child: SubstringHighlight(
        text: text,
        terms: Command.all,
        textStyle: TextStyle(
          fontSize: 32.0,
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
        textStyleHighlight: TextStyle(
          fontSize: 32.0,
          color: Colors.red,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    floatingActionButton: AvatarGlow(
      animate: isListening,
      endRadius: 75,
      glowColor: Theme.of(context).primaryColor,
      child: FloatingActionButton(
        child: Icon(isListening ? Icons.mic : Icons.mic_none, size: 36),
        onPressed: toggleRecording,
      ),
    ),
  );

  Future toggleRecording() => SpeechApi.toggleRecording(
    onResult: (text) =>
      setState(() => this.text = text),
    onListening: (isListening) {
      setState(() => this.isListening = isListening);

      if (!isListening) {
        Future.delayed(Duration(seconds: 1), () async {
          Utils.scanText(text);
          Map<String, String> dictToSend = {'Task': text};
          var re = await http.post(
            Uri.parse("http://192.168.0.108:443/speech/"),
            body: {"Task": text},
            headers: {});
          print("${re.statusCode}");
          print("${re.body}");
        });
      }
    },
  );
}