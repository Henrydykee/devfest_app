import 'package:bloc/bloc.dart';
import 'index.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  static final HomeBloc _homeBlocSingleton = HomeBloc._internal();
  HomeBloc._internal();
  factory HomeBloc() {
    return _homeBlocSingleton;
  }
  @override
  // TODO: implement initialState
  HomeState get initialState => UnHomeState();

  @override
  Stream<HomeState> mapEventToState(
      HomeEvent event,
      ) async* {
    // TODO: implement mapEventToState
    try {
      yield UnHomeState();
      yield await event.applyAsync(currentState: currentState,bloc: this);
    } catch (_, stackTrace) {
      print('$_$stackTrace');
      yield currentState;
    }
  }
}
