import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gini/models/dialogflow/response.dart' as bot;
import 'package:image_picker/image_picker.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class AssistantChatComposerAddFile extends StatefulWidget {
  AssistantChatComposerAddFile({@required this.insertResponse});

  final Function(bot.BotResponse botResponse) insertResponse;

  @override
  _AssistantChatComposerAddFileState createState() =>
      _AssistantChatComposerAddFileState();
}

class _AssistantChatComposerAddFileState
    extends State<AssistantChatComposerAddFile> {
  final picker = ImagePicker();

  var _progress = 0.0;

  var isUploading = false;

  @override
  Widget build(BuildContext context) {
    return isUploading
        ? Container(
            width: 20.0,
            height: 20.0,
            child: CircularProgressIndicator(strokeWidth: 3.0))
        : Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(50.0),
              child: SvgPicture.asset("assets/chatbot/add_circle.svg"),
              onTap: () async {
                showCupertinoModalPopup(
                  context: context,
                  builder: (popUpContext) => CupertinoActionSheet(
                    actions: [
                      CupertinoActionSheetAction(
                          onPressed: () async {
                            try {
                              final image = await picker.getImage(
                                  source: ImageSource.gallery);
                              Navigator.pop(popUpContext);
                              setState(() {
                                isUploading = true;
                              });
                              final path = await _uploadFile(image);
                              widget.insertResponse(
                                  bot.BotResponse(userImageUrl: path));
                              setState(() {
                                isUploading = false;
                                _progress = 0.0;
                              });
                            } catch (error) {
                              setState(() {
                                isUploading = false;
                                _progress = 0.0;
                              });
                              print(error);
                            }
                          },
                          child: Text(
                            "Select from Library",
                            style: TextStyle(
                                color: Color.fromRGBO(125, 106, 244, 1),
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500),
                          )),
                      CupertinoActionSheetAction(
                          onPressed: () async {
                            try {
                              final image = await picker.getImage(
                                  source: ImageSource.camera);
                              Navigator.pop(popUpContext);
                              setState(() {
                                isUploading = true;
                              });
                              final path = await _uploadFile(image);
                              widget.insertResponse(
                                  bot.BotResponse(userImageUrl: path));
                              setState(() {
                                isUploading = false;
                                _progress = 0.0;
                              });
                            } catch (error) {
                              setState(() {
                                isUploading = false;
                                _progress = 0.0;
                              });
                              print(error);
                            }
                          },
                          child: Text(
                            "Take Photo",
                            style: TextStyle(
                                color: Color.fromRGBO(125, 106, 244, 1),
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500),
                          )),
                    ],
                    cancelButton: CupertinoActionSheetAction(
                        isDestructiveAction: true,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancel")),
                  ),
                );
              },
            ),
          );
  }

  Future<String> _uploadFile(PickedFile image) async {
    updateData();
    final file = File(image.path);

    final Reference ref = FirebaseStorage.instance
        .ref()
        .child("users")
        .child(_auth.currentUser.uid)
        .child("files")
        .child("images")
        .child(Timestamp.now().millisecondsSinceEpoch.toString());
    UploadTask uploadTask = ref.putFile(file);
    uploadTask.snapshotEvents.listen(_onUploadProgress);
    TaskSnapshot taskSnapshot = await uploadTask;
    String photoUrl = await taskSnapshot.ref.getDownloadURL();
    return photoUrl;
  }

  Future updateData() async {
    try {
      // check userdata add in adminData or not
      await FirebaseFirestore.instance
          .doc("adminData/${_auth.currentUser.uid}")
          .get()
          .then((doc) {
        if (!doc.exists) {
          FirebaseFirestore.instance
              .collection('adminData')
              .doc(_auth.currentUser.uid)
              .set({
            'chat': 'usersData/${_auth.currentUser.uid}',
            'email': _auth.currentUser.email,
            'name': _auth.currentUser.displayName,
            'phoneNumber': _auth.currentUser.phoneNumber,
            'userId': _auth.currentUser.uid,
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void _onUploadProgress(TaskSnapshot event) {
    final double progress = event.bytesTransferred / event.totalBytes;
    setState(() {
      _progress = progress;
    });
  }
}
