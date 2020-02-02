import 'package:devfest_app/agenda/agenda_page.dart';
import 'package:devfest_app/config/config_bloc.dart';
import 'package:devfest_app/map/map_page.dart';
import 'package:devfest_app/speakers/speaker_page.dart';
import 'package:devfest_app/sponsors/sponsor_page.dart';
import 'package:devfest_app/team/team_page.dart';
import 'package:devfest_app/universal/image_card.dart';
import 'package:devfest_app/utils/devfest.dart';
import 'package:devfest_app/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeFront extends StatelessWidget {
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'could not launch $url';
    }
  }

  List<Widget> devFestTexts(context) => [
        Text(
          Devfest.welcomeText,
          style: Theme.of(context).textTheme.headline,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          Devfest.descText,
          style: Theme.of(context).textTheme.caption,
          textAlign: TextAlign.center,
        )
      ];

  Widget socialActions(context) => FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.twitter),
              onPressed: () async {
                await _launchURL("https://twitter.com/henrydykee1");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.github),
              onPressed: () async {
                await _launchURL("https://github.com/Henrydykee");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.linkedinIn),
              onPressed: () async {
                await _launchURL(
                    ":​https://www.linkedin.com/in/dike-ugochukwu");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.male),
              onPressed: () async {
                await _launchURL("https://henrydykee.github.io");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.behance),
              onPressed: () async {
                await _launchURL("https://www.behance.net/henrydykee");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.envelope),
              onPressed: () async {
                var emailUrl =
                    '''mailto:dykeehenry@gmail.com?subject=support needed for developers ''';
                var out = Uri.encodeFull(emailUrl);
                await _launchURL(out);
              },
            ),
          ],
        ),
      );
  Widget newActions(context) => Wrap(
    spacing: 20.0,
    runSpacing: 20.0,
    alignment: WrapAlignment.center,
    children: <Widget>[
      ActionCard(
        onPressed:()=>Navigator.pushNamed(context,AgendaPage.routeName),
        icon: Icons.schedule,
        color: Colors.red ,
        title: Devfest.agenda_text,
      ),
      ActionCard(
        icon: Icons.person,
        color: Colors.green,
        title: Devfest.speakers_text,
        onPressed: ()=>Navigator.pushNamed(context,SpeakerPage.routeName),
      ),
      ActionCard(
        icon: Icons.people,
        color: Colors.amber,
        title: Devfest.team_text,
        onPressed: ()=>Navigator.pushNamed(context,TeamPage.routeName),
      ),
      ActionCard(
        icon: Icons.attach_money,
        color: Colors.purple,
        title: Devfest.sponsor_text,
        onPressed: ()=>Navigator.pushNamed(context,SponsorPage.routeName),
      ),
      ActionCard(
        icon: Icons.question_answer,
        color: Colors.brown,
        title: Devfest.faq_text,
        onPressed: (){},
      ),
      ActionCard(
        icon: Icons.map,
        color: Colors.blue,
        title: Devfest.map_text,
        onPressed: () =>Navigator.pushNamed(context,MapPage.routeName),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ImageCard(
              img: ConfigBloc().darkModeon
                  ? Devfest.banner_dark
                  : Devfest.banner_light,
            ),
            SizedBox(height: 20),
            ...devFestTexts(context),
            SizedBox(
              height: 20,
            ),
            newActions(context),
            SizedBox(
              height: 20,
            ),
            socialActions(context),
            SizedBox(
              height: 20,
            ),
            Text(
              Devfest.app_version,
              style: Theme.of(context).textTheme.caption.copyWith(fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  final Function  onPressed;
  final IconData icon;
  final String title;
  final Color color;

  const ActionCard({Key key, this.onPressed, this.icon, this.title, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onPressed,
      child: Ink(
        height: MediaQuery.of(context).size.height*0.1,
        width: MediaQuery.of(context).size.width*0.2,
        decoration: BoxDecoration(
            color: ConfigBloc().darkModeon?Tools.hexToColor("#1f2124"):Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: !ConfigBloc().darkModeon?[
              BoxShadow(color: Colors.grey[200],blurRadius: 10,spreadRadius: 5)
            ]:null
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon,color: color,),
            SizedBox(height: 10,),
            Text(title,style: Theme.of(context).textTheme.title.copyWith(fontSize: 12),)
          ],
        ),
      ),
    );
  }
}

