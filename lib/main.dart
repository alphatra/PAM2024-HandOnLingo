import 'package:flutter/material.dart';
import 'package:handsonling/utilis/routes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
Future<void> main() async {
  await Supabase.initialize(
      url: 'https://hafkiakndvprsyhcdlfe.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhhZmtpYWtuZHZwcnN5aGNkbGZlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQzMDEzMDUsImV4cCI6MjAyOTg3NzMwNX0.4UGoZ-5hGpKJiebv4OWh75ckMsweIAVYRGBM82VAV-k'
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}