import 'package:floward/floward_app.dart';
import 'package:floward/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => HomeProvider()),
      ],
      child: const FlowardApp(),
    ),
  );
}
