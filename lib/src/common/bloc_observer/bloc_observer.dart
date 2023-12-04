import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/failures/logger.dart';

class AppBlocObserver extends BlocObserver {

  ///We can run something, when we create our Bloc
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    ///We can check, if the BlocBase is a Bloc or a Cubit
    if (bloc is Cubit) {
      debugPrint("This is a Cubit");
    } else {
      debugPrint("This is a Bloc");
    }
  }

  ///We can react to events
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    debugPrint("an event Happened in $bloc the event is $event");
  }

  ///We can even react to transitions
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    /// With this we can specifically know, when and what changed in our Bloc
    debugPrint("There was a transition from ${transition.currentState} to ${transition.nextState}");
  }

  ///We can react to errors, and we will know the error and the StackTrace
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    logger.f("$bloc", error: error, stackTrace: stackTrace);
  }

  ///We can even run something, when we close our Bloc
  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    debugPrint("BLOC is closed");
  }
}