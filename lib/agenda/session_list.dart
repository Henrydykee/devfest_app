import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:devfest_app/agenda/session_detial.dart';
import 'package:devfest_app/home/session.dart';
import 'package:devfest_app/utils/tools.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SessionList extends StatelessWidget {
  final List<Session> allSession;

  const SessionList({Key key, this.allSession}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: false,
      itemCount: allSession.length,
      itemBuilder: (c, i) {
        return Card(
          elevation: 0.0,
          child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SessionDetail(
                              session: allSession[i],
                            )));
              },
              isThreeLine: true,
              trailing: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "${allSession[i].sessionTotalTime}\n",
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: allSession[i].sessionStartTime,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle
                              .copyWith(fontSize: 12))
                    ]),
              ),
              leading: Hero(
                tag: allSession[i].speakerImage,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      CachedNetworkImageProvider(allSession[i].speakerImage),
                ),
              ),
              title: RichText(
                text: TextSpan(
                    text: "${allSession[i].sessionTitle}\n",
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontSize: 16),
                    children: [
                      TextSpan(
                          text: allSession[i].speakerName,
                          style: Theme.of(context).textTheme.subtitle.copyWith(
                              fontSize: 14,
                              color: Tools.multiColors[Random().nextInt(4)]),
                          children: []),
                    ]),
              ),
              subtitle: Text(
                allSession[i].speakerDesc,
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(fontSize: 10.0),
              )),
        );
      },
    );
  }
}
