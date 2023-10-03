import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:video_call/videoCallApp.dart';
import 'package:flutter_share/flutter_share.dart';

String _meetingCode = "jsa";

class createMeeting extends StatefulWidget {
  createMeeting({super.key});

  @override
  State<createMeeting> createState() => _createMeetingState();
}

class _createMeetingState extends State<createMeeting> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    var uuid = Uuid();
    _meetingCode = uuid.v4().substring(0, 8);
    super.initState();
  }

  Future<void> share() async {
    await FlutterShare.share(
      title: 'Example share',
      text: 'Code: $_meetingCode',
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
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
              height: 20,
              width: 50,
            ),
            const Image(
              image: AssetImage('images/photo2.png'),
              height: 250,
            ),
            const SizedBox(
              height: 20,
              width: 50,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 16.0),
              child: Card(
                elevation: 20,
                color: const Color.fromARGB(255, 204, 230, 202),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ListTile(
                  leading: const Icon(Icons.link),
                  title: SelectableText(
                    _meetingCode,
                    style: const TextStyle(
                        fontSize: 15, color: Color.fromARGB(255, 86, 87, 85)),
                  ),
                  trailing: const Icon(Icons.copy_all_outlined),
                ),
              ),
            ),
            Center(
                child: ElevatedButton.icon(
              onPressed: () {
                share();
              },
              icon: const Icon(Icons.join_full),
              label: const Text(
                "Invite",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
            const Divider(
              thickness: 0,
              height: 20,
            ),
            OutlinedButton.icon(
                onPressed: () {
                  Get.to(videoCallApp(channelName: _meetingCode));
                },
                icon: const Icon(Icons.add_call),
                label: const Text("Start Meeting")),
          ],
        ),
      ),
    );
  }
}
