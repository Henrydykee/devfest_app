import 'package:devfest_app/agenda/agenda_page.dart';
import 'package:devfest_app/agenda/session_detial.dart';
import 'package:devfest_app/config/config_bloc.dart';
import 'package:devfest_app/home/home_page.dart';
import 'package:devfest_app/map/map_page.dart';
import 'package:devfest_app/speakers/speaker_page.dart';
import 'package:devfest_app/sponsors/sponsor_page.dart';
import 'package:devfest_app/team/team_page.dart';
import 'package:devfest_app/utils/devfest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'index.dart';

class ConfigPage extends StatefulWidget {
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  ConfigBloc configBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupApp();
  }

  setupApp() {
    configBloc = ConfigBloc();
    configBloc.darkModeon =
        Devfest.prefs.getBool(Devfest.darkModePref) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => configBloc,
      child: BlocBuilder<ConfigBloc, ConfigState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Google Devfest',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                fontFamily: Devfest.google_sans_family,
                primarySwatch: Colors.red,
                primaryColor:
                    configBloc.darkModeon ? Colors.black : Colors.white,
                disabledColor: Colors.grey,
                cardColor: configBloc.darkModeon ? Colors.black : Colors.white,
                canvasColor:
                    configBloc.darkModeon ? Colors.black : Colors.grey[50],
                brightness:
                    configBloc.darkModeon ? Brightness.dark : Brightness.light,
                buttonTheme: Theme.of(context).buttonTheme.copyWith(
                    colorScheme: configBloc.darkModeon
                        ? ColorScheme.dark()
                        : ColorScheme.light()),
                appBarTheme: AppBarTheme(elevation: 0.0)),
            home: HomePage(),
            routes: {
              HomePage.routeName:(context)=> HomePage(),
              AgendaPage.routeName:(context)=> AgendaPage(),
              SpeakerPage.routeName:(context)=>SpeakerPage(),
              SessionDetail.routeName:(context)=>SessionDetail(session: null,),
              TeamPage.routeName:(context)=>TeamPage(),
              SponsorPage.routeName:(context)=>SponsorPage(),
              MapPage.routeName:(context)=>MapPage()
            },
          );
        },
      ),
    );
  }
}
