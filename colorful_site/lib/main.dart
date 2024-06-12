import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'themes/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      child: Builder(
        builder: (context) {
          final themeProvider = ThemeProvider.of(context);
          return MaterialApp(
            title: 'Colorful Site',
            theme: themeProvider.theme,
            home: HomePage(),
          );
        },
      ),
    );
  }
}

class ThemeProvider extends StatefulWidget {
  final Widget child;

  ThemeProvider({required this.child});

  static _ThemeProviderState of(BuildContext context) {
    final _ThemeProviderInherited? inherited =
        context.dependOnInheritedWidgetOfExactType<_ThemeProviderInherited>();
    return inherited!.data;
  }

  @override
  _ThemeProviderState createState() => _ThemeProviderState();
}

class _ThemeProviderState extends State<ThemeProvider> {
  ThemeData _theme = AppTheme.lightTheme;

  ThemeData get theme => _theme;

  void setTheme(ThemeData theme) {
    setState(() {
      _theme = theme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _ThemeProviderInherited(
      data: this,
      child: widget.child,
    );
  }
}

class _ThemeProviderInherited extends InheritedWidget {
  final _ThemeProviderState data;

  _ThemeProviderInherited({required Widget child, required this.data})
      : super(child: child);

  @override
  bool updateShouldNotify(_ThemeProviderInherited oldWidget) {
    return true;
  }
}
