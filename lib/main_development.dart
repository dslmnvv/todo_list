import 'package:todo_list/flavor_config/flavor_config.dart';
import 'package:todo_list/main_common.dart';

Future<void> main() async{

  final devConfig = FlavorConfig(
      appTitle: 'Морковка dev',
      imageLocation: 'assets/png/icon.png',
  );

 await mainCommon(devConfig);

}