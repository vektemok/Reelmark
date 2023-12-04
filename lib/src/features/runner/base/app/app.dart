import 'package:flutter/material.dart';
import 'package:untitled14/src/features/runner/base/app/material_ctx.dart';
import 'package:untitled14/src/features/runner/dependencies/dependencies.dart';
import 'package:untitled14/src/features/settings/locale/wrappers/localiztions_wrapper.dart';
import 'package:untitled14/src/features/settings/theme/wrappers/theme_wrapper.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  void launch() => runApp(this);

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(child: LocalizationsWrapper(child: MaterialCtx()));
  }
}
