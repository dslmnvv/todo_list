import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/flavor_config/config_provider.dart';
import 'package:todo_list/flavor_config/flavor_config.dart';
import 'package:todo_list/src/_common/hex_color.dart';
import 'package:todo_list/src/_common/log_handler.dart';
import 'package:todo_list/src/data/api/repository/config_repository.dart';
import 'package:todo_list/src/presentation/providers/config_provider.dart';
import 'package:todo_list/src/presentation/providers/home_provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:todo_list/src/presentation/to_do_llist_app.dart';
import 'package:todo_list/src/setup_service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> mainCommon(FlavorConfig flavorConfig) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Log.init();

  await setupServiceLocator();
  initializeDateFormatting();

  final rep = GetIt.instance<ConfigRepository>();
  final color = HexColor.fromHex(rep.importanceColor);




  await GetIt.instance.allReady();
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => FlavorConfigProvider(flavorConfig)),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => ConfigProvider(color)),
      ],
      child: const TodoListApp(),
      ),
  );
}



