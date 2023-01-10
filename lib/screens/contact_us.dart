import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  var httpsMapUri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=31.949893011602825, 35.90654890894627');

  var httpsInstagramUri = Uri.parse('https://www.instagram.com/dr.qaismismar');

  Future<void> openInstagram(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print('There was a problem with $url');
    }
  }

  Future<void> openLocation(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print('There was a problem with $url');
    }
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
          body: SingleChildScrollView(
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
                IconButton(
                  color: Colors.green,
                  iconSize: 50,
                  icon: FaIcon(FontAwesomeIcons.whatsapp),
                  onPressed: () {},
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(45, 20, 45, 0),
                    child: Text(AppLocalizations.of(context)!.salahWithNumber,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sortsMillGoudy(
                            color: Color.fromARGB(255, 5, 145, 131),
                            fontStyle: FontStyle.normal,
                            fontSize: 19)),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(45, 0, 45, 0),
                    child: Text(AppLocalizations.of(context)!.qaisWithNumber,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sortsMillGoudy(
                            color: Color.fromARGB(255, 5, 145, 131),
                            fontStyle: FontStyle.normal,
                            fontSize: 19)),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(45, 0, 45, 90),
                    child: Text(AppLocalizations.of(context)!.amerWithNumber,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sortsMillGoudy(
                            color: Color.fromARGB(255, 5, 145, 131),
                            fontStyle: FontStyle.normal,
                            fontSize: 19)),
                  ),
                ),
                Center(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                            AppLocalizations.of(context)!.followUsOnInstagram,
                            style: GoogleFonts.sortsMillGoudy(
                                color: Color.fromARGB(255, 5, 145, 131),
                                fontStyle: FontStyle.normal,
                                fontSize: 25)),
                      )),
                ),
                Center(
                  child: Center(
                    child: Text('@dr.qaismismar',
                        style: GoogleFonts.sortsMillGoudy(
                            color: Color.fromARGB(255, 5, 145, 131),
                            fontStyle: FontStyle.normal,
                            fontSize: 19)),
                  ),
                ),
                Center(
                  child: Center(
                    child: Text('@consultationcenteram',
                        style: GoogleFonts.sortsMillGoudy(
                            color: Color.fromARGB(255, 5, 145, 131),
                            fontStyle: FontStyle.normal,
                            fontSize: 19)),
                  ),
                ),
                IconButton(
                  color: Colors.pink,
                  iconSize: 50,
                  icon: FaIcon(FontAwesomeIcons.instagram),
                  onPressed: () {
                    openInstagram(httpsInstagramUri);
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Center(
                    child: Text('@tajmeel2000',
                        style: GoogleFonts.sortsMillGoudy(
                            color: Color.fromARGB(255, 5, 145, 131),
                            fontStyle: FontStyle.normal,
                            fontSize: 19)),
                  ),
                ),
                IconButton(
                  color: Colors.yellow,
                  iconSize: 50,
                  icon: FaIcon(FontAwesomeIcons.snapchat),
                  onPressed: () {},
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Center(
                    child: Text(AppLocalizations.of(context)!.address1,
                        style: GoogleFonts.sortsMillGoudy(
                            color: Color.fromARGB(255, 5, 145, 131),
                            fontStyle: FontStyle.normal,
                            fontSize: 19)),
                  ),
                ),
                Center(
                  child: Center(
                    child: Text(AppLocalizations.of(context)!.address2,
                        style: GoogleFonts.sortsMillGoudy(
                            color: Color.fromARGB(255, 5, 145, 131),
                            fontStyle: FontStyle.normal,
                            fontSize: 19)),
                  ),
                ),
                Center(
                  child: Center(
                    child: Text(AppLocalizations.of(context)!.address3,
                        style: GoogleFonts.sortsMillGoudy(
                            color: Color.fromARGB(255, 5, 145, 131),
                            fontStyle: FontStyle.normal,
                            fontSize: 19)),
                  ),
                ),
                IconButton(
                  color: Colors.red,
                  iconSize: 50,
                  icon: FaIcon(FontAwesomeIcons.mapPin),
                  onPressed: () {
                    openLocation(httpsMapUri);
                  },
                ),
                SizedBox(height: 20),
              ],
            ),
          )),
    ]);
  }
}
