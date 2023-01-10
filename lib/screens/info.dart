import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  void initState() {
    // TODO: implement initState
    print(GoogleFonts.asMap().keys.toList().toString());
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
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text(AppLocalizations.of(context)!.aboutTheCenter,
                      style: GoogleFonts.abhayaLibre(
                          color: Color.fromARGB(255, 0, 78, 70),
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 25)),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(45, 20, 45, 20),
                  child: Text(AppLocalizations.of(context)!.briefing,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sortsMillGoudy(
                          color: Color.fromARGB(255, 5, 145, 131),
                          fontStyle: FontStyle.normal,
                          fontSize: 19)),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text(AppLocalizations.of(context)!.ourServicesCapital,
                      style: GoogleFonts.abhayaLibre(
                          color: Color.fromARGB(255, 0, 78, 70),
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 25)),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(45, 10, 45, 45),
                  child: Text(
                      AppLocalizations.of(context)!.plasticSurgeryDepartment,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.abhayaLibre(
                          color: Color.fromARGB(255, 0, 78, 70),
                          fontStyle: FontStyle.normal,
                          textStyle: TextStyle(fontWeight: FontWeight.bold),
                          fontSize: 22)),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(45, 10, 45, 0),
                  child: Text(AppLocalizations.of(context)!.supervisedBy,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sortsMillGoudy(
                          color: Color.fromARGB(255, 5, 145, 131),
                          fontStyle: FontStyle.normal,
                          fontSize: 19)),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(45, 10, 45, 0),
                  child: Text(AppLocalizations.of(context)!.drSalahEddinMismar,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sortsMillGoudy(
                          color: Color.fromARGB(255, 5, 145, 131),
                          fontStyle: FontStyle.normal,
                          fontSize: 19)),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text(AppLocalizations.of(context)!.consultant,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sortsMillGoudy(
                          color: Color.fromARGB(255, 5, 145, 131),
                          fontStyle: FontStyle.normal,
                          fontSize: 16)),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(45, 10, 45, 20),
                  child: Text(AppLocalizations.of(context)!.servicesAvailable,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sortsMillGoudy(
                          color: Color.fromARGB(255, 5, 145, 131),
                          fontStyle: FontStyle.normal,
                          textStyle: TextStyle(fontWeight: FontWeight.bold),
                          fontSize: 19)),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(45, 10, 45, 10),
                  child: Text(AppLocalizations.of(context)!.cosmetic,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sortsMillGoudy(
                          color: Color.fromARGB(255, 5, 145, 131),
                          fontStyle: FontStyle.normal,
                          fontSize: 19)),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(45, 10, 45, 10),
                  child: Text(AppLocalizations.of(context)!.doubleChin,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sortsMillGoudy(
                          color: Color.fromARGB(255, 5, 145, 131),
                          fontStyle: FontStyle.normal,
                          fontSize: 19)),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(45, 10, 45, 10),
                  child: Text(AppLocalizations.of(context)!.fatTransfer,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sortsMillGoudy(
                          color: Color.fromARGB(255, 5, 145, 131),
                          fontStyle: FontStyle.normal,
                          fontSize: 19)),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(45, 10, 45, 10),
                  child: Text(AppLocalizations.of(context)!.threadLift,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sortsMillGoudy(
                          color: Color.fromARGB(255, 5, 145, 131),
                          fontStyle: FontStyle.normal,
                          fontSize: 19)),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(45, 10, 45, 45),
                  child: Text(
                      AppLocalizations.of(context)!.minorPlasticSurgeries,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sortsMillGoudy(
                          color: Color.fromARGB(255, 5, 145, 131),
                          fontStyle: FontStyle.normal,
                          fontSize: 19)),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(45, 10, 45, 45),
                  child: Text(AppLocalizations.of(context)!.dentistryDepartment,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.abhayaLibre(
                          color: Color.fromARGB(255, 0, 78, 70),
                          fontStyle: FontStyle.normal,
                          textStyle: TextStyle(fontWeight: FontWeight.bold),
                          fontSize: 22)),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(45, 10, 45, 0),
                  child: Text(AppLocalizations.of(context)!.supervisedBy,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sortsMillGoudy(
                          color: Color.fromARGB(255, 5, 145, 131),
                          fontStyle: FontStyle.normal,
                          fontSize: 19)),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(45, 10, 45, 0),
                  child: Text(AppLocalizations.of(context)!.drQaisMismar,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sortsMillGoudy(
                          color: Color.fromARGB(255, 5, 145, 131),
                          fontStyle: FontStyle.normal,
                          fontSize: 19)),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(45, 0, 45, 10),
                  child: Text(
                      AppLocalizations.of(context)!.doctorOfDentalSurgery,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sortsMillGoudy(
                          color: Color.fromARGB(255, 5, 145, 131),
                          fontStyle: FontStyle.normal,
                          fontSize: 19)),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(45, 10, 45, 0),
                  child: Text(AppLocalizations.of(context)!.drAmerMismar,
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
                  child: Text(
                      AppLocalizations.of(context)!.doctorOfDentalSurgery,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sortsMillGoudy(
                          color: Color.fromARGB(255, 5, 145, 131),
                          fontStyle: FontStyle.normal,
                          fontSize: 19)),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(45, 40, 45, 10),
                  child: Text(AppLocalizations.of(context)!.inCooperationWith,
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
                  child: Text(AppLocalizations.of(context)!.oralMaxilloFacial,
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
                  child: Text(AppLocalizations.of(context)!.prosthodontics,
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
                  child: Text(AppLocalizations.of(context)!.endodontics,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sortsMillGoudy(
                          color: Color.fromARGB(255, 5, 145, 131),
                          fontStyle: FontStyle.normal,
                          fontSize: 19)),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(45, 0, 45, 45),
                  child: Text(AppLocalizations.of(context)!.orthodontist,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sortsMillGoudy(
                          color: Color.fromARGB(255, 5, 145, 131),
                          fontStyle: FontStyle.normal,
                          fontSize: 19)),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(45, 10, 45, 20),
                  child: Text(AppLocalizations.of(context)!.servicesAvailable,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sortsMillGoudy(
                          color: Color.fromARGB(255, 5, 145, 131),
                          fontStyle: FontStyle.normal,
                          textStyle: TextStyle(fontWeight: FontWeight.bold),
                          fontSize: 19)),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(45, 10, 45, 0),
                  child: Text(AppLocalizations.of(context)!.cosmeticDental,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sortsMillGoudy(
                          color: Color.fromARGB(255, 5, 145, 131),
                          fontStyle: FontStyle.normal,
                          fontSize: 19)),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(45, 10, 45, 0),
                  child: Text(AppLocalizations.of(context)!.restorative,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sortsMillGoudy(
                          color: Color.fromARGB(255, 5, 145, 131),
                          fontStyle: FontStyle.normal,
                          fontSize: 19)),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(45, 10, 45, 0),
                  child: Text(AppLocalizations.of(context)!.dentalImplants,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sortsMillGoudy(
                          color: Color.fromARGB(255, 5, 145, 131),
                          fontStyle: FontStyle.normal,
                          fontSize: 19)),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(45, 10, 45, 0),
                  child: Text(
                      AppLocalizations.of(context)!.orthodonticTreatments,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sortsMillGoudy(
                          color: Color.fromARGB(255, 5, 145, 131),
                          fontStyle: FontStyle.normal,
                          fontSize: 19)),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(45, 10, 45, 0),
                  child: Text(
                      AppLocalizations.of(context)!.periodonticTreatments,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sortsMillGoudy(
                          color: Color.fromARGB(255, 5, 145, 131),
                          fontStyle: FontStyle.normal,
                          fontSize: 19)),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(45, 10, 45, 0),
                  child: Text(
                      AppLocalizations.of(context)!.oralMaxillofacialSurgeries,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sortsMillGoudy(
                          color: Color.fromARGB(255, 5, 145, 131),
                          fontStyle: FontStyle.normal,
                          fontSize: 19)),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(45, 10, 45, 45),
                  child: Text(AppLocalizations.of(context)!.pediatric,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sortsMillGoudy(
                          color: Color.fromARGB(255, 5, 145, 131),
                          fontStyle: FontStyle.normal,
                          fontSize: 19)),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(45, 10, 45, 45),
                  child: Text(AppLocalizations.of(context)!.laserDepartment,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.abhayaLibre(
                          color: Color.fromARGB(255, 0, 78, 70),
                          fontStyle: FontStyle.normal,
                          textStyle: TextStyle(fontWeight: FontWeight.bold),
                          fontSize: 22)),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(45, 10, 45, 0),
                  child: Text(AppLocalizations.of(context)!.trained,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sortsMillGoudy(
                          color: Color.fromARGB(255, 5, 145, 131),
                          fontStyle: FontStyle.normal,
                          fontSize: 19)),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(45, 10, 45, 0),
                  child: Text(AppLocalizations.of(context)!.hairRemoval,
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
                  child: Text(AppLocalizations.of(context)!.faceRejuvenation,
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
                  child: Text(AppLocalizations.of(context)!.hydrafacial,
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
                  child: Text(AppLocalizations.of(context)!.diamondPeel,
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
                  child: Text(AppLocalizations.of(context)!.dermapen,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sortsMillGoudy(
                          color: Color.fromARGB(255, 5, 145, 131),
                          fontStyle: FontStyle.normal,
                          fontSize: 19)),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(45, 0, 45, 45),
                  child: Text(AppLocalizations.of(context)!.hifu,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sortsMillGoudy(
                          color: Color.fromARGB(255, 5, 145, 131),
                          fontStyle: FontStyle.normal,
                          fontSize: 19)),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
