import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled14/src/common/bloc_observer/bloc_observer.dart';
import 'package:untitled14/src/common/external/firebase/firebase_options.dart';
import 'package:untitled14/src/features/runner/base/app/app.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import '../../common/utils/failures/logger.dart';

class Runner {
  static Future<void> runApplication() async => runZonedGuarded(() async {
        BlocOverrides.runZoned(() async {
          WidgetsFlutterBinding.ensureInitialized();
          await Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform);
          await FirebaseAppCheck.instance.activate(
              androidProvider: AndroidProvider.debug,
              appleProvider: AppleProvider.debug);
          WidgetsBinding.instance.platformDispatcher.onError =
              ((error, stackTrace) {
            logger.f('FE:', error: error, stackTrace: stackTrace);
            return true;
          });

          const Application().launch();
        }, blocObserver: AppBlocObserver());
      }, (error, stack) {
        logger.f('Zoned error:', error: error, stackTrace: stack);
      });
}
