import 'package:devfest_app/config/config_bloc.dart';
import 'package:devfest_app/utils/devfest.dart';
import 'package:flutter/material.dart';
import 'package:devfest_app/utils/tools.dart';

class ImageCard extends StatelessWidget {
  final String img;

  const ImageCard({Key key, this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      child: Image.asset(img,
        fit: BoxFit.cover,
        filterQuality: FilterQuality.high,
      ),
      decoration: BoxDecoration(
          color: ConfigBloc().darkModeon ? Tools.hexToColor("#1f2124") : Colors.white,
           borderRadius:  BorderRadius.circular(10.0)),

    );
  }
}
