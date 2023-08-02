import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    debugPrint('*** Create ===>>> ${bloc.runtimeType}');
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('*** ${bloc.runtimeType}, Change To ===>>> ${change.nextState.runtimeType.toString().replaceAll('_\$', '')}');
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('*** Error ===>>> ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('*** Close ===>>> ${bloc.runtimeType}');
    super.onClose(bloc);
  }
}
