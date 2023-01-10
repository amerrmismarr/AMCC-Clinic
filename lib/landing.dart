import 'package:amcc/screens/appointments.dart';
import 'package:amcc/screens/cases.dart';
import 'package:amcc/screens/info.dart';
import 'package:amcc/screens/offers.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'dart:io';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 4,
        child: Scaffold(
          bottomNavigationBar: const Material(
            color: Colors.teal,
            child: TabBar(
              tabs: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Tab(icon: Icon(Icons.calendar_today)),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Tab(icon: Icon(Icons.info)),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Tab(icon: Icon(Icons.local_offer)),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Tab(icon: Icon(Icons.more)),
                ),
              ],
            ),
          ),
          body: TabBarView(
              children: <Widget>[Appointments(), Info(), Offers(), Cases()]),
        ));
  }
}
