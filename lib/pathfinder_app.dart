import 'package:flutter/material.dart';

import 'features/sheet/sheet_page.dart';

class PathfinderApp extends StatelessWidget {
  const PathfinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 16, 51, 255),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const SheetPage(),
    );
  }
}
