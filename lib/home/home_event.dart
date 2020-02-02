import 'package:devfest_app/home/home_bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'index.dart';
@immutable
abstract class HomeEvent{
  Future<HomeState> applyAsync({HomeState currentState, HomeBloc bloc});

}