import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:devfest_app/config/config_bloc.dart';
import 'package:devfest_app/config/config_event.dart';
import 'package:devfest_app/home/team.dart' as prefix0;
import 'package:devfest_app/home/team.dart';
import 'package:devfest_app/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class TeamPage extends StatelessWidget {
  static const String routeName = '/team';
  @override
  Widget build(BuildContext context) {
    Widget socialActions(context) => FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(FontAwesomeIcons.facebook),
                onPressed: () async {
                  await launch(teams[0].fbUrl);
                },
              ),
              IconButton(
                icon: Icon(FontAwesomeIcons.github),
                onPressed: () async {
                  await launch(teams[0].githubUrl);
                },
              ),
              IconButton(
                icon: Icon(FontAwesomeIcons.linkedinIn),
                onPressed: () async {
                  await launch(teams[0].linkedinUrl);
                },
              ),
              IconButton(
                icon: Icon(FontAwesomeIcons.twitter),
                onPressed: () async {
                  await launch(teams[0].twitterUrl);
                },
              ),
            ],
          ),
        );
    //var teamsData = teams;
    return Scaffold(
      appBar: AppBar(
        title: Text("Teams"),
        centerTitle: true,
        elevation: 0.0,
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
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: teams.length,
        itemBuilder: (c, i) {
          return Card(
            elevation: 0.0,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints.expand(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: teams[i].image,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            teams[i].name,
                            style: Theme.of(context).textTheme.title,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: 5,
                            color: Tools.multiColors[Random().nextInt(4)],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        teams[1].desc,
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        teams[i].contribution,
                        style: Theme.of(context).textTheme.caption,
                      ),
                      socialActions(context),
                    ],
                  ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
