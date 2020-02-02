import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
@immutable
abstract class HomeState extends Equatable{
  HomeState([Iterable props]) : super(props);

  HomeState getStateCopy();
}

class  UnHomeState extends HomeState{
  @override
  String toString() => 'UnHomeState';
  @override
  HomeState getStateCopy() {
    // TODO: implement getStateCopy
    return UnHomeState();
  }

}