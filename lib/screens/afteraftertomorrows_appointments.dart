import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AfterAfterTomorrowAppointments extends StatefulWidget {
  @override
  _AfterAfterTomorrowAppointmentsState createState() =>
      _AfterAfterTomorrowAppointmentsState();
}

class _AfterAfterTomorrowAppointmentsState
    extends State<AfterAfterTomorrowAppointments> {
  @override
  List usersProfilesList = [];

  void initState() {
    fetchAppointments();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: usersProfilesList.length,
            itemBuilder: (context, index) {
              return ListTile(
                  title: Text(
                    usersProfilesList[index]['name'] +
                        ' ' +
                        usersProfilesList[index]['phoneNumber'],
                    style: TextStyle(color: Colors.black),
                  ),
                  subtitle: Text(
                    usersProfilesList[index]['description'],
                    style: TextStyle(color: Colors.black),
                  ),
                  leading: Text(
                    usersProfilesList[index]['timeSlot'].toString(),
                    style: TextStyle(color: Colors.black),
                  ));
            }));
  }

  Future fetchAppointmentsList() async {
    final now = DateTime.now();
    var outputFormat = DateFormat("yyyy-MM-dd");
    String formattedDate =
        outputFormat.format(DateTime(now.year, now.month, now.day + 3));
    List appointmentsList = [];
    try {
      await FirebaseFirestore.instance
          .collection('appointments')
          .where('date', isEqualTo: formattedDate)
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
    print(resultant);

    if (resultant == null) {
      print('unable to retrieve');
    } else {
      print('hi');
      if (this.mounted) {
        setState(() {
          usersProfilesList = resultant;
        });
      }
    }
  }
}
