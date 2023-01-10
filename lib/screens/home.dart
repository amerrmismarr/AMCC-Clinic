import 'package:amcc/screens/appointments.dart';
import 'package:amcc/screens/cases.dart';
import 'package:amcc/screens/contact_us.dart';
import 'package:amcc/screens/info.dart';
import 'package:amcc/screens/offers.dart';
import 'package:amcc/screens/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
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
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Info()));
                          },
                          child: Text(AppLocalizations.of(context)!.aboutus)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Cases()));
                          },
                          child:
                              Text(AppLocalizations.of(context)!.casesGallery)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Offers()));
                          },
                          child: Text(
                              AppLocalizations.of(context)!.offers + '🔥')),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 40),
                    child: SizedBox(
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ContactUs()));
                          },
                          child: Text(AppLocalizations.of(context)!.contactUs)),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                    child: SizedBox(
                      height: 80,
                      width: 300,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Appointments()));
                          },
                          child: Shimmer.fromColors(
                            period: Duration(seconds: 7),
                            baseColor: Colors.white,
                            highlightColor: Colors.grey,
                            child: Text(
                              AppLocalizations.of(context)!.bookAnAppointment,
                              style: GoogleFonts.notoSansThai(
                                  color: Color.fromARGB(255, 5, 145, 131),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          )),
    ]);
  }
}
