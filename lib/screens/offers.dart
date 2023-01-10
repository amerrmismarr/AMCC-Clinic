import 'package:amcc/screens/new_offer.dart';
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

class Offers extends StatefulWidget {
  @override
  _OffersState createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  FirebaseStorage storage = FirebaseStorage.instance;

  String? deviceIdentifier;

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
          print(deviceIdentifier);
        }); //UUID for iOS
      }
    } on PlatformException {
      print('Failed to get platform version');
    }
  }

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
        await storage.ref('offers/$fileName').putFile(
            imageFile,
            SettableMetadata(customMetadata: {
              'uploaded_by': 'A bad guy',
              'description': 'Some description...'
            }));

        // Refresh the UI
        setState(() {});
      } on FirebaseException catch (error) {
        if (kDebugMode) {
          print(error);
        }
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }

  // Retriew the uploaded images
  // This function is called when the app launches for the first time or when an image is uploaded or deleted
  Future<List<Map<String, dynamic>>> _loadImages() async {
    List<Map<String, dynamic>> files = [];

    final ListResult result = await storage.ref('offers').list();
    final List<Reference> allFiles = result.items;

    await Future.forEach<Reference>(allFiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      final FullMetadata fileMeta = await file.getMetadata();
      files.add({
        "url": fileUrl,
        "path": file.fullPath,
        "uploaded_by": fileMeta.customMetadata?['uploaded_by'] ?? 'Nobody',
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

  @override
  void initState() {
    _deviceDetails();
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
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => NewOffer()));
                },
                child: Icon(Icons.add),
                backgroundColor: Colors.teal[300],
              )
            : Container(),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Offers').snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            return !snapshot.hasData
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('Offers')
                                  .doc(snapshot.data.docs[index]['title'])
                                  .collection('image_urls')
                                  .snapshots(),
                              builder: (context, AsyncSnapshot snapshott) {
                                return !snapshot.hasData
                                    ? Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : CarouselSlider.builder(
                                        options: CarouselOptions(
                                          aspectRatio: 1.0,
                                          enlargeCenterPage: true,
                                          enableInfiniteScroll: false,
                                          initialPage: 0,
                                          autoPlay: false,
                                        ),
                                        itemCount:
                                            snapshott.data?.docs.length ?? 0,
                                        itemBuilder: (context, index,
                                            int pageViewIndex) {
                                          return GestureDetector(
                                            onTap: () {},
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
                                                                    .docs[index]
                                                                ['url']),
                                                        fit: BoxFit.cover)),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                              }),
                          Container(
                            width: MediaQuery.of(context).size.width - 75,
                            child: Card(
                                child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Text(
                                      snapshot.data.docs[index]['title'],
                                      style: GoogleFonts.abhayaLibre(
                                          color: Color.fromARGB(255, 0, 78, 70),
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Text(
                                        snapshot.data.docs[index]['descrip'],
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.sortsMillGoudy(
                                            textStyle: TextStyle(),
                                            color:
                                                Color.fromARGB(255, 0, 78, 70),
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Appointments()));
                                        },
                                        child: Text(
                                          'Book an appointment ',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                ),
                              ],
                            )),
                          ),
                        ],
                      );
                    },
                  );
          },
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
