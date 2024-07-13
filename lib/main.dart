import 'package:child_moments/core/Local/shared_pref.dart';
import 'package:child_moments/src/app_root.dart';
import 'package:flutter/material.dart';

import 'core/Network/Dio.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  DioHelper.init();

  runApp(const MyApp());
}
