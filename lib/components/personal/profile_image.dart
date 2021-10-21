import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class ProfileImage extends StatefulWidget {
  ProfileImage({@required this.isEnabled});
  final bool isEnabled;
  @override
  _ProfileImageState createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  final picker = ImagePicker();
  var _progress = 0.0;
  var isUploading = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;
    String photoUrl;
    if (_auth.currentUser.photoURL != null) {
      photoUrl = _auth.currentUser.photoURL;
    }
    return InkWell(
      borderRadius: BorderRadius.circular(50.0),
      child: Container(
        height: isPortrait ? size.width * 0.1706 : size.height * 0.1706,
        width: isPortrait ? size.width * 0.1706 : size.height * 0.1706,
        decoration: photoUrl != null
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider("$photoUrl"),
                ),
              )
            : BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
        child: isUploading
            ? CircularProgressIndicator(value: _progress)
            : photoUrl != null
                ? SizedBox.shrink()
                : CircleAvatar(
                    // TODO: change background color
                    child: Text(
                      "${_auth.currentUser.displayName.characters.first}"
                      "${_auth.currentUser.displayName.split(" ").last.characters.first}",
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
      ),
      onTap: widget.isEnabled
          ? () async {
              showCupertinoModalPopup(
                context: context,
                builder: (context) => CupertinoActionSheet(
                  actions: [
                    CupertinoActionSheetAction(
                        onPressed: () async {
                          try {
                            final image = await picker.getImage(
                                source: ImageSource.gallery);
                            setState(() {
                              isUploading = true;
                            });
                            final path = await _uploadFile(image);
                            await _auth.currentUser
                                .updateProfile(photoURL: path);
                            setState(() {
                              isUploading = false;
                              _progress = 0.0;
                            });
                            Navigator.pop(context);
                          } catch (error) {
                            setState(() {
                              isUploading = false;
                              _progress = 0.0;
                            });
                            print(error);
                          }
                        },
                        child: Text("Select from Library")),
                    CupertinoActionSheetAction(
                        onPressed: () async {
                          try {
                            final image = await picker.getImage(
                                source: ImageSource.camera);
                            setState(() {
                              isUploading = true;
                            });
                            final path = await _uploadFile(image);
                            await _auth.currentUser
                                .updateProfile(photoURL: path);
                            setState(() {
                              isUploading = false;
                              _progress = 0.0;
                            });
                            Navigator.pop(context);
                          } catch (error) {
                            setState(() {
                              isUploading = false;
                              _progress = 0.0;
                            });
                            print(error);
                          }
                        },
                        child: Text("Take Photo")),
                  ],
                  cancelButton: CupertinoActionSheetAction(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel")),
                ),
              );
            }
          : null,
    );
  }

  Future<String> _uploadFile(PickedFile image) async {
    final file = File(image.path);

    final Reference ref = FirebaseStorage.instance
        .ref()
        .child("users")
        .child(_auth.currentUser.uid)
        .child("profile");
    UploadTask uploadTask = ref.putFile(file);
    uploadTask.snapshotEvents.listen(_onUploadProgress);
    TaskSnapshot taskSnapshot = await uploadTask;
    return await taskSnapshot.ref.getDownloadURL();
  }

  void _onUploadProgress(TaskSnapshot event) {
    final double progress = event.bytesTransferred / event.totalBytes;
    setState(() {
      _progress = progress;
    });
  }
}
