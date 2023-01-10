import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Case extends StatefulWidget {
  late String imageUrls;
  late String title;
  late String description;

  Case(
      {required this.imageUrls,
      required this.title,
      required this.description});
  @override
  _CaseState createState() => _CaseState(imageUrls, title, description);
}

class _CaseState extends State<Case> {
  late String imageUrls;
  late String title;
  late String description;

  _CaseState(this.imageUrls, this.title, this.description);
  @override
  Widget build(BuildContext context) {
    print(description);
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 100,
        ),
        StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Cases')
                .doc(title)
                .collection('image_urls')
                .snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
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
                        autoPlay: true,
                      ),
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index, int pageViewIndex) {
                        return GestureDetector(
                          onTap: () {},
                          child: Card(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 500,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          snapshot.data.docs[index]['url']),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        );
                      },
                    );
            }),
        Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: Text(title,
                style: GoogleFonts.abhayaLibre(
                    color: Color.fromARGB(255, 0, 78, 70),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 25)),
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(45, 20, 45, 45),
            child: Text(description,
                textAlign: TextAlign.center,
                style: GoogleFonts.abel(
                    color: Color.fromARGB(255, 5, 145, 131),
                    fontStyle: FontStyle.normal,
                    fontSize: 19)),
          ),
        )
      ],
    ));
  }
}
