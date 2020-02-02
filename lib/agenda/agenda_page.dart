import 'dart:math';

import 'package:devfest_app/agenda/session_list.dart';
import 'package:devfest_app/config/config_bloc.dart';
import 'package:devfest_app/config/config_event.dart';
import 'package:devfest_app/home/session.dart';
import 'package:devfest_app/universal/dev_scafffold.dart';
import 'package:devfest_app/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';

class AgendaPage extends StatefulWidget {
  static const String routeName = '/agenda';

  @override
  _AgendaPageState createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 1, length: 3);
  }

  TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agenda"),
        centerTitle: true,
        elevation: 0.0,
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          controller: _tabController,
          indicatorColor: Tools.multiColors[Random().nextInt(4)],
          isScrollable: false,
          labelStyle: TextStyle(fontSize: 12),
          tabs: <Widget>[
            Tab(
              child: Text("Cloud"),
              icon: Icon(
                FontAwesomeIcons.cloud,
                size: 12,
              ),
            ),
            Tab(
              child: Text("Mobile"),
              icon: Icon(
                FontAwesomeIcons.mobile,
                size: 12,
              ),
            ),
            Tab(
              child: Text("Web & more"),
              icon: Icon(
                FontAwesomeIcons.chrome,
                size: 12,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                ConfigBloc().darkModeon
                    ? FontAwesomeIcons.lightbulb
                    : FontAwesomeIcons.solidLightbulb,
                size: 18,
              ),
              onPressed: () {
                ConfigBloc().dispatch(DarkModeEvent(!ConfigBloc().darkModeon));
              }),
          IconButton(
              icon: Icon(
                Icons.share,
                size: 20,
              ),
              onPressed: () => Share.share(
                  "Download the new DevFest App and share with your tech friends"))
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          SessionList(allSession: sessions,),
          SessionList(allSession: sessions,),
          SessionList(allSession: sessions,)],
      ),
    );
  }
}
