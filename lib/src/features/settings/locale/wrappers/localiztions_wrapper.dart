import 'package:flutter/material.dart';

class LocalizationsWrapper extends StatefulWidget {
  const LocalizationsWrapper({super.key, required this.child});

  final Widget child;

  static LocalizationsWrapperState of(BuildContext context) {
    return context.findAncestorStateOfType<LocalizationsWrapperState>()!;
  }

  @override
  LocalizationsWrapperState createState() => LocalizationsWrapperState();
}

class LocalizationsWrapperState extends State<LocalizationsWrapper> {
  LocaleState data = LocaleState(appLocale: const Locale('ru'));

  @override
  Widget build(BuildContext context) {
    return LocaleScope(data: data, child: widget.child);
  }
}

class LocaleScope extends InheritedWidget {
  const LocaleScope({
    super.key,
    required this.data,
    required super.child,
  });

  final LocaleState data;

  static LocaleScope? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LocaleScope>();
  }

  static LocaleScope of(BuildContext context) {
    final LocaleScope? result = maybeOf(context);
    assert(result != null, 'No LocaleScope found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(LocaleScope oldWidget) => data != oldWidget.data;
}

class LocaleState {
  LocaleState({required this.appLocale});

  Locale appLocale;
}
