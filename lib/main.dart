import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_call/createMeeting.dart';
import 'package:video_call/joinMeet.dart';
// import 'package:agora_uikit/agora_uikit.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Video Conference")),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(width: 10, height: 50),
              Center(
                  child: ElevatedButton.icon(
                      onPressed: () {
                        Get.to(
                           createMeeting(),
                        );
                      },
                      icon: const Icon(Icons.add),
                      label: const Text("Create New Meeting"))),
              const SizedBox(width: 10, height: 20),
              Center(
                  child: OutlinedButton.icon(
                      onPressed: () {
                        Get.to(joinMeet());
                      },
                      icon: const Icon(Icons.add_ic_call),
                      label: const Text("Join with code"))),
              const SizedBox(width: 10, height: 30),
              const Image(image: AssetImage('images/Photo11.png'), height: 300),
            ],
          ),
        ),
      ),
    );
  }
}
