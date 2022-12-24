import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:pips_flutter/app/app.dart';
import 'package:pips_flutter/app/dependency_injection.dart';

void main() async {
  // debugPaintSizeEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();

  runApp(MyApp());
}
