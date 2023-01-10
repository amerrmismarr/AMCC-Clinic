import 'dart:io';

import 'package:amcc/screens/cases.dart';
import 'package:amcc/screens/view_appointments.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class Appointments extends StatefulWidget {
  @override
  _AppointmentsState createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  String? deviceIdentifier;
  DateTime? date;
  String? name;
  String? phoneNumber;
  String? description;
  String? selectedTimeSlot;
  List<String> items = [
    '09:00 - 10:00',
    '10:00- 11:00',
    '11:00 - 12:00',
    '12:00 - 13:00',
    '13:00 - 14:00',
    '14:00 - 15:00',
    '15:00 - 16:00',
    '16:00 - 17:00',
    '17:00 - 18:00',
  ];
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  String? formattedDate;
  var outputFormat = DateFormat("yyyy-MM-dd");

  @override
  void initState() {
    _deviceDetails();

    // TODO: implement initState
    super.initState();
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
          print(deviceIdentifier);
        }); //UUID for iOS
      }
    } on PlatformException {
      print('Failed to get platform version');
    }
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime.now().subtract(Duration(days: 0)),
        lastDate: DateTime(DateTime.now().year + 5));

    if (newDate == null) return;

    setState(() {
      date = newDate;
      formattedDate = outputFormat.format(newDate);
    });
  }

  String getText() {
    if (date == null) {
      return AppLocalizations.of(context)!.selectDate;
    } else {
      return '${date?.day}/${date?.month}/${date?.year}';
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
                Container(
                  height: 60,
                  width: 250,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          pickDate(context);
                        },
                        child: Text(
                          getText(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isExpanded: true,
                    hint: Row(
                      children: const [
                        Icon(
                          Icons.watch,
                          size: 25,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                      ],
                    ),
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                        .toList(),
                    value: selectedTimeSlot,
                    onChanged: (value) {
                      setState(() {
                        selectedTimeSlot = value as String;
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios_outlined,
                    ),
                    iconSize: 14,
                    iconEnabledColor: Colors.white,
                    iconDisabledColor: Colors.white,
                    buttonHeight: 50,
                    buttonWidth: 300,
                    buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                    buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: Colors.white,
                      ),
                      color: Colors.teal[300],
                    ),
                    buttonElevation: 2,
                    itemHeight: 40,
                    itemPadding: const EdgeInsets.only(left: 14, right: 14),
                    dropdownMaxHeight: 200,
                    dropdownWidth: 300,
                    dropdownPadding: null,
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.teal[200],
                    ),
                    dropdownElevation: 8,
                    scrollbarRadius: const Radius.circular(40),
                    scrollbarThickness: 6,
                    scrollbarAlwaysShow: true,
                    offset: const Offset(-20, 0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 40, 50, 0),
                  child: TextField(
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.name,
                        hintStyle: TextStyle(color: Colors.grey),
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
                        name = text;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                  child: TextField(
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.phoneNumber,
                        hintStyle: TextStyle(color: Colors.grey),
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
                        phoneNumber = text;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                  child: TextField(
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.procedure,
                        hintStyle: TextStyle(color: Colors.grey),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 300,
                    height: 80,
                    child: ElevatedButton(
                        onPressed: () {
                          if (name != null &&
                              phoneNumber != null &&
                              description != null &&
                              formattedDate != null &&
                              selectedTimeSlot != null) {
                            FirebaseFirestore.instance
                                .collection('appointments')
                                .add({
                              'name': name,
                              'phoneNumber': phoneNumber,
                              'description': description,
                              'date': formattedDate,
                              'timeSlot': selectedTimeSlot
                            });

                            Fluttertoast.showToast(
                                msg:
                                  AppLocalizations.of(context)!.thankYou  ,
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 2,
                                backgroundColor: Colors.teal[200],
                                textColor: Colors.white,
                                fontSize: 16.0);
                            Navigator.of(context).pop();
                          } else {
                            Fluttertoast.showToast(
                                msg:
                                    AppLocalizations.of(context)!.makeSure,
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 2,
                                backgroundColor: Colors.teal[200],
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                        },
                        child:
                            Text(AppLocalizations.of(context)!.bookAppointment,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ))),
                  ),
                ),
                deviceIdentifier == '4b3b39eb9bdfa7f6' ||
                        deviceIdentifier == '8d452c412c2d3301'
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ViewAppointments()));
                            },
                            child: Text('View Appointments')),
                      )
                    : Container()
              ],
            ),
          )),
    ]);
  }
}
