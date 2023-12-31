import 'package:flutter/material.dart';

class ThemeWrapper extends StatefulWidget {
  const ThemeWrapper({super.key, required this.child});

  final Widget child;

  static ThemeWrapperState of(BuildContext context) {
    return context.findAncestorStateOfType<ThemeWrapperState>()!;
  }

  @override
  ThemeWrapperState createState() => ThemeWrapperState();
}

class ThemeWrapperState extends State<ThemeWrapper> {
  ThemeState data = ThemeState(themeMode: ThemeMode.dark);

  @override
  Widget build(BuildContext context) {
    return ThemeScope(data: data, child: widget.child);
  }
}

class ThemeScope extends InheritedWidget {
  const ThemeScope({
    super.key,
    required this.data,
    required super.child,
  });

  final ThemeState data;

  static ThemeScope? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeScope>();
  }

  static ThemeScope of(BuildContext context) {
    final ThemeScope? result = maybeOf(context);
    assert(result != null, 'No ThemeScope found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ThemeScope oldWidget) => data != oldWidget.data;
}

class ThemeState {
  ThemeMode themeMode;

  ThemeState({required this.themeMode});
}
