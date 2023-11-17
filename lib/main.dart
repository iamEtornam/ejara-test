import 'package:ejara_assignment/services/injection_container.dart';
import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initFeatures();

  runApp(const App());
}
