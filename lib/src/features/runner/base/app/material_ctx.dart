import 'package:flutter/material.dart';
import 'package:untitled14/src/common/components/themes/dark_theme.dart';
import 'package:untitled14/src/common/components/themes/light_theme.dart';
import 'package:untitled14/src/features/announcement/announcement_publisher/presentation/screens/announcement_publisher_screen.dart';
import 'package:untitled14/src/features/settings/locale/wrappers/localiztions_wrapper.dart';
import 'package:untitled14/src/features/settings/theme/wrappers/theme_wrapper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../announcement/announcement_publisher/presentation/screens/select_image_screen.dart';
import '../../../announcement/announcement_viewer/presentation/screens/announcement_viewer_screen.dart';

class MaterialCtx extends StatelessWidget {
  const MaterialCtx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: LocaleScope.of(context).data.appLocale,
      themeMode: ThemeScope.of(context).data.themeMode,
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: SelectImageScreen(),
    );
  }
}
