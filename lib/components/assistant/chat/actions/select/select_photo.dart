import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gini/models/dialogflow/response.dart' as bot;

FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

class AssistantChatSelectImage extends StatefulWidget {
  AssistantChatSelectImage(
      {@required this.insertResponse, @required this.botResponse});
  final Function(bot.BotResponse botResponse) insertResponse;
  final bot.BotResponse botResponse;

  @override
  _AssistantChatSelectImageState createState() =>
      _AssistantChatSelectImageState();
}

class _AssistantChatSelectImageState extends State<AssistantChatSelectImage>
    with AutomaticKeepAliveClientMixin {
  var _progress = 0.0;
  var isUploading = false;
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final mediaQuery = MediaQuery.of(context);
    return widget.botResponse.queryResult.action == null
        ? SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 64.0,
                  child: CircleAvatar(
                    child: Image.asset(
                      "assets/chatbot/angelina.png",
                      fit: BoxFit.cover,
                      width: 32.0,
                      height: 32.0,
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(right: 72.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          border: Border.all(
                            color: Color.fromRGBO(221, 225, 234, 1),
                          ),
                        ),
                        child: isUploading
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 48.0),
                                child: SizedBox(
                                    height: 16.0,
                                    width: 16.0,
                                    child: CircularProgressIndicator(
                                        strokeWidth: 3.0)),
                              )
                            : GestureDetector(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 16.0),
                                  child: Text(
                                    "Select photo",
                                    style: TextStyle(
                                        color: Color.fromRGBO(125, 106, 244, 1),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.0,
                                        height:
                                            mediaQuery.textScaleFactor * 1.31),
                                  ),
                                ),
                                onTap: () async {
                                  showCupertinoModalPopup(
                                    context: context,
                                    builder: (popUpContext) =>
                                        CupertinoActionSheet(
                                      actions: [
                                        CupertinoActionSheetAction(
                                            onPressed: () async {
                                              try {
                                                final image =
                                                    await picker.getImage(
                                                        source: ImageSource
                                                            .gallery);
                                                Navigator.pop(popUpContext);
                                                setState(() {
                                                  isUploading = true;
                                                });
                                                final path =
                                                    await _uploadFile(image);
                                                await _firebaseFirestore
                                                    .collection("serviceOrders")
                                                    .doc(_auth.currentUser.uid)
                                                    .collection("images")
                                                    .add({
                                                  "imagePath": path,
                                                  "isDone": false,
                                                  "ref": widget.botResponse
                                                      .documentReference
                                                });
                                                await widget.botResponse
                                                    .documentReference
                                                    .set({
                                                  "queryResult": {
                                                    "action": null
                                                  }
                                                }, SetOptions(merge: true));
                                                widget.botResponse.queryResult
                                                    .action = null;
                                                var response = bot.BotResponse(
                                                    queryResult: bot.QueryResult(
                                                        fulfillmentMessages: [
                                                          bot
                                                              .FulfillmentMessage(
                                                                  text: bot.Text(
                                                                      text: [
                                                                "Photo is successfully added",
                                                                "My team is working on your photo. I’ll let you know when it’s ready."
                                                              ]))
                                                        ],
                                                        intent: bot.Intent()),
                                                    timestamp: Timestamp.now(),
                                                    userImageUrl: path);
                                                var documentReference =
                                                    _firebaseFirestore
                                                        .collection("usersData")
                                                        .doc(_auth
                                                            .currentUser.uid)
                                                        .collection('chat')
                                                        .doc();

                                                _firebaseFirestore
                                                    .runTransaction(
                                                        (transaction) async {
                                                  transaction.set(
                                                    documentReference,
                                                    response.toJson(),
                                                  );
                                                });
                                                widget.insertResponse(response);
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
                                                  color: Color.fromRGBO(
                                                      125, 106, 244, 1),
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w500),
                                            )),
                                        CupertinoActionSheetAction(
                                            onPressed: () async {
                                              try {
                                                final image =
                                                    await picker.getImage(
                                                        source:
                                                            ImageSource.camera);
                                                Navigator.pop(popUpContext);
                                                setState(() {
                                                  isUploading = true;
                                                });
                                                final path =
                                                    await _uploadFile(image);
                                                widget.insertResponse(
                                                    bot.BotResponse(
                                                        userImageUrl: path));
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
                                                  color: Color.fromRGBO(
                                                      125, 106, 244, 1),
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }

  Future<String> _uploadFile(PickedFile image) async {
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

  void _onUploadProgress(TaskSnapshot event) {
    final double progress = event.bytesTransferred / event.totalBytes;
    setState(() {
      _progress = progress;
    });
  }

  @override
  bool get wantKeepAlive => true;
}
