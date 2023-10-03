import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_call/videoCallApp.dart';


class joinMeet extends StatefulWidget {
  joinMeet({super.key});

  @override
  State<joinMeet> createState() => _joinMeetState();
}

class _joinMeetState extends State<joinMeet> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                      onTap: Get.back,
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 40,
                      )),
                ),
              ),
              const SizedBox(
                height: 50,
                width: 40,
              ),
              const Center(
                  child: Image(
                image: AssetImage('images/photo3.png'),
                height: 250,
              )),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 16.0),
                child: Card(
                  elevation: 20,
                  color: const Color.fromARGB(255, 204, 230, 202),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    controller: _controller,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Example: 312143",
                    ),
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Center(
                  child: ElevatedButton.icon(
                onPressed: () {
                  Get.to(videoCallApp(
                    channelName: _controller.text.trim(),
                  ));
                },
                icon: const Icon(Icons.join_full),
                label: const Text(
                  "Join",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
