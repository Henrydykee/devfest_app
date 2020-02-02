import 'package:bloc/bloc.dart';
import 'index.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  static final ConfigBloc _configBlocSingleton = ConfigBloc._internal();
  ConfigBloc._internal();
  factory ConfigBloc() {
    return _configBlocSingleton;
  }
  bool darkModeon = false;
  @override
  // TODO: implement initialState
  ConfigState get initialState => UnConfigState();

  @override
  Stream<ConfigState> mapEventToState(
    ConfigEvent event,
  ) async* {
    // TODO: implement mapEventToState
    try {
      yield UnConfigState();
      yield await event.applyAsync(currentState: currentState,bloc: this);
    } catch (_, stackTrace) {
      print('$_$stackTrace');
      yield currentState;
    }
  }
}
