import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';

class onlineClassroom extends StatelessWidget {
  onlineClassroom({Key? key});

  final TextEditingController sessionNameController = TextEditingController();
  final TextEditingController sessionDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: const Color(0xff034ada),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Nabeeh"),
        backgroundColor: const Color(0xFFA1CACC),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              child: TextField(
                enabled: false, // Make it read-only
                textAlign: TextAlign.center, // Center align text
                controller: TextEditingController(text: generateRandomConferenceId()),
                decoration: InputDecoration(
                  labelText: 'Session ID',
                  labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Session Name:', // Title for Session Name
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: sessionNameController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Session Description:', // Title for Session Description
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: sessionDescriptionController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF3D8A8E)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Making the button bigger
                    ),
                  ),
                ),
                onPressed: () => jumpToMeetingPage(
                  context,
                  sessionId: generateRandomConferenceId(),
                  sessionName: sessionNameController.text,
                  sessionDescription: sessionDescriptionController.text,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 11),
                  child: Text(
                    'Start Meeting',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Generate a random Conference ID
  String generateRandomConferenceId() {
    Random random = Random();
    String result = '';
    for (int i = 0; i < 10; i++) {
      result += random.nextInt(10).toString();
    }
    return result;
  }

  // Go to Meeting Page
  jumpToMeetingPage(BuildContext context, {required String sessionId, required String sessionName, required String sessionDescription}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoConferencePage(
          sessionID: sessionId,
          sessionName: sessionName,
          sessionDescription: sessionDescription,
        ),
      ),
    );
  }
}







class VideoConferencePage extends StatelessWidget {
  final String sessionID;
  final String sessionName;
  final String sessionDescription;

  VideoConferencePage({
    Key? key,
    required this.sessionID,
    required this.sessionName,
    required this.sessionDescription,
  }) : super(key: key);

  final String userId = "wadha"; // Assuming userId is constant
  final int appID = int.parse(dotenv.env['ZEGO_APP_ID']!);
  final String appSign = dotenv.env['ZEGO_APP_SIGN']!;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ZegoUIKitPrebuiltVideoConference(
            appID: appID,
            appSign: appSign,
            userID: userId,
            userName: 'user_$userId',
            conferenceID: sessionID,
            config: ZegoUIKitPrebuiltVideoConferenceConfig(
              leaveConfirmDialogInfo: ZegoLeaveConfirmDialogInfo(
                title: "Leave the session",
                message: "Are you sure to leave the session?",
                cancelButtonName: "Cancel",
                confirmButtonName: "Confirm",
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.black.withOpacity(0.7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'session ID: $sessionID',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'session Name: $sessionName',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Description: $sessionDescription',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
