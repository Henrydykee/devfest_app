import 'package:devfest_app/config/config_bloc.dart';
import 'package:devfest_app/config/config_event.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';

class DevScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget tabBar;

  const DevScaffold(
      {Key key, @required this.title, @required this.body, this.tabBar})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
          top: false,
          bottom: false,
          child: Scaffold(
            appBar: AppBar(
              title: Text(title),
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
                      ConfigBloc()
                          .dispatch(DarkModeEvent(!ConfigBloc().darkModeon));
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
          )),
    );
  }
}
