import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';


class OnlineClassroom extends StatelessWidget {
  OnlineClassroom({Key? key});

  final TextEditingController sessionNameController = TextEditingController();
  final TextEditingController sessionDescriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>(); // Add form key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nabeeh"),
        backgroundColor: const Color(0xFFA1CACC),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(60),
        child: Center(
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Form(
                key: _formKey, // Assign the form key
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Create a Session',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      enabled: false,
                      textAlign: TextAlign.center,
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
                    SizedBox(height: 20),
                    TextFormField(
                      controller: sessionNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Session name is required';
                        } else if (value.length < 3 || value.length > 20) {
                          return 'Session name must be between 3 and 20 characters';
                        } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                          return 'Session name must contain only letters';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Session Name',
                        labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: sessionDescriptionController,
                      validator: (value) {
                        if (value != null && value.length > 100) {
                          return 'Description must be less than 100 characters';
                        }
                        return null;
                      },
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: 'Session Description',
                        labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF3D8A8E)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Validation passed
                            jumpToMeetingPage(
                              context,
                              sessionId: generateRandomConferenceId(),
                              sessionName: sessionNameController.text,
                              sessionDescription: sessionDescriptionController.text,
                            );
                          }
                        },
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
            ),
          ),
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

  final String userId = "Dr.Nadia";
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
        ],
      ),
    );
  }
}
