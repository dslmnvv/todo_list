import 'package:flutter/cupertino.dart';
import 'package:todo_list/flavor_config/flavor_config.dart';

class FlavorConfigProvider with ChangeNotifier{

  FlavorConfig config;

  FlavorConfigProvider(this.config);
}