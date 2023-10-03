import 'dart:convert';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class videoCallApp extends StatefulWidget {
  String channelName = "temp";

  videoCallApp({required this.channelName});
  @override
  State<videoCallApp> createState() => _videoCallAppState();
}

class _videoCallAppState extends State<videoCallApp> {
  late final AgoraClient client;
  bool _loading = true;
  String? tempToken = "";

  Future<void> getToken() async {
    String link =
        "https://agora-node-tokenserver--sunandhitgupta.repl.co/rtc/${widget.channelName}/audience/userAccount/ekaansh";

    Response _response = await get(Uri.parse(link));
    Map data = jsonDecode(_response.body);

    setState(() {
      tempToken = data["rtcToken"];
      _loading = true;
    });

    final perCam = await Permission.camera.request();
    final perMic = await Permission.microphone.request();

    print(perCam);
    print(perMic);

    client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        appId: "c883080d706048ddac3ac3c293336d9c",
        channelName: "kalu",
        tempToken:
            '007eJxTYNgjHuzp63VORfQUb13a53cXOI5/CQ73+n+HeYXK3J+LZTgUGJItLIwNLAxSzA3MDEwsUlISk42BKNnI0tjY2CzFMvnCJunUhkBGhgMc25gYGSAQxGdhyE7MKWVgAAAYDB7h',
      ),
    );

    await client.initialize();

    Future.delayed(const Duration(seconds: 1))
        .then((value) => setState(() => _loading = false));
        print(_loading);
        
  }

  @override
  void initState() {
    getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: _loading
              ? const CircularProgressIndicator()
              : Stack(children: [
                  AgoraVideoViewer(client: client),
                  AgoraVideoButtons(client: client),
                ])),
    );
  }
}
