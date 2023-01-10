import 'dart:io';

import 'package:amcc/screens/cases.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class NewCase extends StatefulWidget {
  @override
  _NewCaseState createState() => _NewCaseState();
}

class _NewCaseState extends State<NewCase> {
  late String title;
  late String description;

  List<File> _image = [];
  final picker = ImagePicker();

  FirebaseStorage storage = FirebaseStorage.instance;
  CollectionReference? imgRef;
  CollectionReference? dataRef;
  Reference? ref;

  chooseImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image.add(File(pickedFile.path));
      } else {
        print('no  Image');
      }
    });

    if (pickedFile == null) retrieveLostData();
  }

  Future uploadFile() async {
    imgRef = FirebaseFirestore.instance
        .collection('Cases')
        .doc(title)
        .collection('image_urls');
    for (var img in _image) {
      ref = storage.ref().child('cases/${path.basename(img.path)}');

      await ref!.putFile(img).whenComplete(() async {
        await ref!.getDownloadURL().then((value) {
          imgRef!
              .add({'url': value, 'title': title, 'description': description});
          // dataRef!.add({'title': title, 'description': description});
          FirebaseFirestore.instance
              .collection('Cases')
              .doc(title)
              .set({'title': title, 'descrip': description});
        });
      });
    }
  }

  Future<void> retrieveLostData() async {
    final LostData response = await picker.getLostData();
    if (response.isEmpty) {
      return;
    }

    if (response.file != null) {
      setState(() {
        _image.add(File(response.file!.path));
      });
    } else {
      print(response.file);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          SizedBox(
            height: 300,
            child: GridView.builder(
              itemCount: _image.length + 1,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                return index == 0
                    ? Center(
                        child: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            chooseImage();
                          },
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(_image[index - 1]))),
                      );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                decoration: InputDecoration(
                  hintText: 'Title',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.teal,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (text) {
                  title = text;
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Description',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.teal,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (text) {
                  description = text;
                }),
          ),
          ElevatedButton.icon(
              onPressed: () =>
                  uploadFile().whenComplete(() => Navigator.of(context).pop()),
              icon: const Icon(Icons.library_add),
              label: const Text('Upload Case')),
        ],
      ),
    ));
  }
}
