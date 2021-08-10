import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/providers.dart';
import 'package:qr_reader/screens/screens.dart';
import 'package:qr_reader/theme/costum_theme.dart';
//https://stackoverflow.com/a/49837980

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new UiProvider()),
        ChangeNotifierProvider(create: (_) => new ScanProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false, 
        title: 'QR reader',
        initialRoute: 'home',
        routes: {
          'home': (_) => HomeScreen(),
          'maps': (_) => MapScreen(),
        },
        theme: costumeTheme(),
      ),
    );
  }
}
