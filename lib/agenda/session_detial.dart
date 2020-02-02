import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:devfest_app/config/config_bloc.dart';
import 'package:devfest_app/config/config_event.dart';
import 'package:devfest_app/home/session.dart';
import 'package:devfest_app/home/speaker.dart';
import 'package:devfest_app/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class SessionDetail extends StatelessWidget {
  static const String routeName = "/session_detail";
  final Session session;

  const SessionDetail({Key key, @required this.session}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget socialActions(context) => FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.facebook),
            onPressed: () async {
              await launch(speakers[0].fbUrl);
            },
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.github),
            onPressed: () async {
              await launch(speakers[0].githubUrl);
            },
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.linkedinIn),
            onPressed: () async {
              await launch(speakers[0].linkedinUrl);
            },
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.twitter),
            onPressed: () async {
              await launch(speakers[0].twitterUrl);
            },
          ),
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(session.speakerName),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Center(
                child: Hero(
                  tag: session.speakerImage,
                  child: CircleAvatar(
                    radius: 100.0,
                    backgroundImage: CachedNetworkImageProvider(
                      session.speakerImage,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "${session.speakerDesc}",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.title.copyWith(
                    fontSize: 14,
                    color: Tools.multiColors[Random().nextInt(4)]),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "${session.sessionTitle}",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .title
                    .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                session.speakerDesc,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption.copyWith(
                      fontSize: 13,
                    ),
              ),
              SizedBox(height: 20,),
              socialActions(context)
            ],
          ),
        ),
      ),
    );
  }
}
