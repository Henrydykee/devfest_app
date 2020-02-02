import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:devfest_app/home/speaker.dart';
import 'package:devfest_app/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SpeakerPage extends StatelessWidget {
  static const String routeName = '/speaker';

  Widget socialActions(context, Speaker speaker) => FittedBox(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Speakers"),
        centerTitle: true,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: speakers.length,
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
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: speakers[i].speakerImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
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
                              speakers[i].speakerName,
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
                          speakers[i].speakerDesc,
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          speakers[i].speakerSession,
                          style: Theme.of(context).textTheme.caption,
                        ),
                        socialActions(context, speakers[i])
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
