import 'package:devfest_app/config/config_bloc.dart';
import 'package:devfest_app/config/config_event.dart';
import 'package:devfest_app/home/homeWidget/home_front.dart';
import 'package:devfest_app/home/home_bloc.dart';
import 'package:devfest_app/universal/image_card.dart';
import 'package:devfest_app/utils/devfest.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/home";
  final Widget tabBar;

  const HomePage({Key key, this.tabBar}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var _homeBloc = HomeBloc();
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        bottom: tabBar != null ? tabBar : null,
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
      body: HomeFront(),
    );
  }
}
