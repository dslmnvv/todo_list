import 'package:todo_list/flavor_config/flavor_config.dart';
import 'main_common.dart';

Future<void> main() async{

  final prodConfig = FlavorConfig(
      appTitle: 'Морковка',
      imageLocation: 'assets/png/icon.png',
  );

  await mainCommon(prodConfig);

}