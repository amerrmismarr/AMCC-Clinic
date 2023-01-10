import 'package:amcc/screens/todays_appointments.dart';
import 'package:amcc/screens/tomorrows_appointments.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'afteraftertomorrows_appointments.dart';
import 'aftertomorrows_appointments.dart';

class ViewAppointments extends StatefulWidget {
  @override
  _ViewAppointmentsState createState() => _ViewAppointmentsState();
}

class _ViewAppointmentsState extends State<ViewAppointments>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late String formattedDate;

  late String nameOfToday;
  late String nameOfYesterday;
  late String nameOfBeforeYesterday;
  late String nameOfTomorrow;
  late String nameOfAfterTomorrow;
  late String nameOfAfterAfterTomorrow;

  late String nameOfTodayMonth;
  late String nameOfYesterdayMonth;
  late String nameOfBeforeYesterdayMonth;
  late String nameOfTomorrowMonth;
  late String nameOfAfterTomorrowMonth;
  late String nameOfAfterAfterTomorrowMonth;
  @override
  void initState() {
    tabController = new TabController(vsync: this, length: 4, initialIndex: 0);
    //fetchAppointments();

    super.initState();
  }

  List usersProfilesList = [];
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    nameOfToday = DateFormat(DateFormat.ABBR_WEEKDAY)
        .format(DateTime(now.year, now.month, now.day));
    nameOfYesterday = DateFormat(DateFormat.ABBR_WEEKDAY)
        .format(DateTime(now.year, now.month, now.day - 1));
    nameOfBeforeYesterday = DateFormat(DateFormat.ABBR_WEEKDAY)
        .format(DateTime(now.year, now.month, now.day - 2));
    nameOfTomorrow = DateFormat(DateFormat.ABBR_WEEKDAY)
        .format(DateTime(now.year, now.month, now.day + 1));
    nameOfAfterTomorrow = DateFormat(DateFormat.ABBR_WEEKDAY)
        .format(DateTime(now.year, now.month, now.day + 2));
    nameOfAfterAfterTomorrow = DateFormat(DateFormat.ABBR_WEEKDAY)
        .format(DateTime(now.year, now.month, now.day + 3));
    //print(nameOfToday);
    nameOfTodayMonth = DateFormat(DateFormat.ABBR_MONTH)
        .format(DateTime(now.year, now.month, now.day));
    nameOfYesterdayMonth = DateFormat(DateFormat.ABBR_MONTH)
        .format(DateTime(now.year, now.month, now.day - 1));
    nameOfBeforeYesterdayMonth = DateFormat(DateFormat.ABBR_MONTH)
        .format(DateTime(now.year, now.month, now.day - 2));
    nameOfTomorrowMonth = DateFormat(DateFormat.ABBR_MONTH)
        .format(DateTime(now.year, now.month, now.day + 1));
    nameOfAfterTomorrowMonth = DateFormat(DateFormat.ABBR_MONTH)
        .format(DateTime(now.year, now.month, now.day + 2));
    nameOfAfterAfterTomorrowMonth = DateFormat(DateFormat.ABBR_MONTH)
        .format(DateTime(now.year, now.month, now.day + 3));
    //print(nameOfTodayMonth);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: new TabBar(
              controller: tabController,
              tabs: <Widget>[
                new Tab(
                  child: Text(
                    "Today" +
                        "\n" +
                        (DateTime.now().day).toString() +
                        " " +
                        nameOfTodayMonth,
                    textAlign: TextAlign.center,
                  ),
                ),
                new Tab(
                  child: Text(
                    nameOfTomorrow +
                        "\n" +
                        (DateTime.now().add(Duration(days: 1)).day).toString() +
                        " " +
                        nameOfTomorrowMonth,
                    textAlign: TextAlign.center,
                  ),
                ),
                new Tab(
                  child: Text(
                    nameOfAfterTomorrow +
                        "\n" +
                        (DateTime.now().add(Duration(days: 2)).day).toString() +
                        " " +
                        nameOfAfterTomorrowMonth,
                    textAlign: TextAlign.center,
                  ),
                ),
                new Tab(
                  child: Text(
                    nameOfAfterAfterTomorrow +
                        "\n" +
                        (DateTime.now().add(Duration(days: 3)).day).toString() +
                        " " +
                        nameOfAfterAfterTomorrowMonth,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(controller: tabController, children: <Widget>[
          new TodayAppointments(),
          new TomorrowAppointments(),
          new AfterTomorrowAppointments(),
          new AfterAfterTomorrowAppointments(),
        ]));
  }

  Future fetchAppointmentsList() async {
    List appointmentsList = [];
    try {
      await FirebaseFirestore.instance
          .collection('appointments')
          .get()
          .then((querySnapshot) => {
                querySnapshot.docs.forEach((element) {
                  appointmentsList.add(element.data());
                  print(element.data());
                })
              });
      return appointmentsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  fetchAppointments() async {
    dynamic resultant = await fetchAppointmentsList();
    //  print(resultant);

    if (resultant == null) {
      print('unable to retrieve');
    } else {
      print(usersProfilesList);
      if (this.mounted) {
        setState(() {
          usersProfilesList = resultant;
        });
      }
    }
  }
}
