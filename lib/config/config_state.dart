import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ConfigState extends Equatable {
  ConfigState([List props = const <dynamic>[]]) : super(props);

  ConfigState getStateCopy();
}

class UnConfigState extends ConfigState {
  @override
  String toString() => 'UnConfigState';
  @override
  ConfigState getStateCopy() {
    // TODO: implement getStateCopy
    return UnConfigState();
  }
}

class InConfigState extends ConfigState {
  @override
  String toString() => 'InConfigState';
  @override
  ConfigState getStateCopy() {
    // TODO: implement getStateCopy
    return InConfigState();
  }
}

class ErrorConfigState extends ConfigState {
  final String errorMessaage;

  ErrorConfigState(this.errorMessaage);

  @override
  String toString() => 'ErrorConfigState';
  @override
  ConfigState getStateCopy() {
    // TODO: implement getStateCopy
    return ErrorConfigState(this.errorMessaage);
  }
}
