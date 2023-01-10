import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Services extends StatefulWidget {
  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 180,
            width: 280,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/logo.png'), fit: BoxFit.fill)),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Text('OUR SERVICES',
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
              child: Text(
                  'The Department of Plastic Surgery offers state-of-the-art, comprehensive, and quality aesthetic and reconstructive surgery in a whole patient care environment to those in our local, regional, national, and international communities. We are dedicated to providing an atmosphere in which excellence in healthcare, education, and research come together.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.sortsMillGoudy(
                      color: Color.fromARGB(255, 5, 145, 131),
                      fontStyle: FontStyle.normal,
                      fontSize: 19)),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(45, 20, 45, 45),
              child: Text(
                  'The Department of Plastic Surgery offers state-of-the-art, comprehensive, and quality aesthetic and reconstructive surgery in a whole patient care environment to those in our local, regional, national, and international communities. We are dedicated to providing an atmosphere in which excellence in healthcare, education, and research come together.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.sortsMillGoudy(
                      color: Color.fromARGB(255, 5, 145, 131),
                      fontStyle: FontStyle.normal,
                      fontSize: 19)),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(45, 20, 45, 45),
              child: Text(
                  'The Department of Plastic Surgery offers state-of-the-art, comprehensive, and quality aesthetic and reconstructive surgery in a whole patient care environment to those in our local, regional, national, and international communities. We are dedicated to providing an atmosphere in which excellence in healthcare, education, and research come together.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.sortsMillGoudy(
                      color: Color.fromARGB(255, 5, 145, 131),
                      fontStyle: FontStyle.normal,
                      fontSize: 19)),
            ),
          )
        ],
      ),
    ));
  }
}
