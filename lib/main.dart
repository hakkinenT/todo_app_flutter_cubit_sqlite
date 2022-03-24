import 'package:bloc_studies/di/service_locator.dart';
import 'package:bloc_studies/router.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App(
    router: AppRouter(),
  ));
}
