import 'dart:ffi';

import 'package:amcc/screens/case.dart';
import 'package:amcc/screens/new_case.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';

import 'appointments.dart';

class Cases extends StatefulWidget {
  @override
  _CasesState createState() => _CasesState();
}

class _CasesState extends State<Cases> {
  FirebaseStorage storage = FirebaseStorage.instance;

  String? deviceIdentifier;

  Future<void> _upload(String inputSource) async {
    final picker = ImagePicker();
    XFile? pickedImage;
    try {
      pickedImage = await picker.pickImage(
          source: inputSource == 'camera'
              ? ImageSource.camera
              : ImageSource.gallery,
          maxWidth: 1920);

      final String fileName = path.basename(pickedImage!.path);
      File imageFile = File(pickedImage.path);

      try {
        // Uploading the selected image with some custom meta data
        await storage.ref('cases/$fileName').putFile(
            imageFile,
            SettableMetadata(customMetadata: {
              'uploaded_by': 'A bad guy',
              'description': 'Some description...'
            }));

        // Refresh the UI
        setState(() {});
      } on FirebaseException catch (error) {
        if (kDebugMode) {
          //  print(error);
        }
      }
    } catch (err) {
      if (kDebugMode) {
        // print(err);
      }
    }
  }

  // Retriew the uploaded images
  // This function is called when the app launches for the first time or when an image is uploaded or deleted
  Future<List<Map<String, dynamic>>> _loadDentistryImages() async {
    List<Map<String, dynamic>> files = [];

    final ListResult result = await storage.ref('cases/dentistrycases').list();
    final List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      final FullMetadata fileMeta = await file.getMetadata();
      files.add({
        "url": fileUrl,
        "path": file.fullPath,
        "title": fileMeta.customMetadata?['title'] ?? 'No title',
        "description":
            fileMeta.customMetadata?['description'] ?? 'No description'
      });
    });

    return files;
  }

  Future<List<Map<String, dynamic>>> _loadBotoxImages() async {
    List<Map<String, dynamic>> files = [];

    final ListResult result = await storage.ref('cases/botoxcases').list();
    final List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      final FullMetadata fileMeta = await file.getMetadata();
      files.add({
        "url": fileUrl,
        "path": file.fullPath,
        "title": fileMeta.customMetadata?['title'] ?? 'No title',
        "description":
            fileMeta.customMetadata?['description'] ?? 'No description'
      });
    });

    return files;
  }

  Future<List<Map<String, dynamic>>> _loadImages() async {
    List<Map<String, dynamic>> files = [];

    final ListResult result = await storage.ref('cases/').list();
    final List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      final FullMetadata fileMeta = await file.getMetadata();
      files.add({
        "url": fileUrl,
        "path": file.fullPath,
        "title": fileMeta.customMetadata?['title'] ?? 'No title',
        "description":
            fileMeta.customMetadata?['description'] ?? 'No description'
      });
    });

    return files;
  }

  Future<void> _delete(String ref) async {
    await storage.ref(ref).delete();
    // Rebuild the UI
    setState(() {});
  }

  Future<void> _deviceDetails() async {
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        setState(() {
          deviceIdentifier = build.androidId;
          print(deviceIdentifier);
        });
        //UUID for Android
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        setState(() {
          deviceIdentifier = data.identifierForVendor;
          //  print(deviceIdentifier);
        }); //UUID for iOS
      }
    } on PlatformException {
      //print('Failed to get platform version');
    }
  }

  @override
  void initState() {
    _deviceDetails();
    //   print(deviceIdentifier);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Image.asset(
        "assets/bground33.png",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButton: deviceIdentifier == '4b3b39eb9bdfa7f6' ||
                deviceIdentifier == '8d452c412c2d3301'
            ? FloatingActionButton(
                child: Icon(Icons.add),
                backgroundColor: Colors.teal[300],
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => NewCase()));
                },
              )
            : Container(),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Container(
                  height: 170,
                  width: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/logo.png"),
                    fit: BoxFit.cover,
                  )),
                ),
                SizedBox(
                  height: 300,
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('Cases')
                        .snapshots(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData) {
                        print('no data');
                      }

                      return !snapshot.hasData
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisSpacing: 3, crossAxisCount: 3),
                              itemCount: snapshot.data.docs.length,
                              itemBuilder: (context, index) {
                                return StreamBuilder(
                                    stream: FirebaseFirestore.instance
                                        .collection('Cases')
                                        .doc(snapshot.data.docs[index]['title'])
                                        .collection('image_urls')
                                        .snapshots(),
                                    builder:
                                        (context, AsyncSnapshot snapshott) {
                                      return !snapshott.hasData
                                          ? Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) => Case(
                                                            imageUrls: snapshott
                                                                .data
                                                                .docs[0]['url'],
                                                            title: snapshot.data
                                                                    .docs[index]
                                                                ['title'],
                                                            description: snapshot
                                                                    .data
                                                                    .docs[index]
                                                                ['descrip'])));
                                              },
                                              child: Card(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 500,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              snapshott.data
                                                                      .docs[0]
                                                                  ['url']),
                                                          fit: BoxFit.cover)),
                                                ),
                                              ),
                                            );
                                    });
                              },
                            );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}


/*ListTile(
                            dense: false,
                            leading: Image.network(image['url']),
                            title: Text(image['uploaded_by']),
                            subtitle: Text(image['description']),
                            trailing: IconButton(
                              onPressed: () => _delete(image['path']),
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ),*/