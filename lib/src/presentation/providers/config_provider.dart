import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list/src/_common/hex_color.dart';

import '../../_common/log_handler.dart';
import '../../data/api/repository/config_repository.dart';

class ConfigProvider with ChangeNotifier{

  Color importance;

  ConfigProvider(this.importance){
    startListen();
  }


  startListen(){
    ConfigRepository rep = GetIt.instance<ConfigRepository>();
    rep.remoteConfig.onConfigUpdated.listen((event) async {
      await rep.remoteConfig.activate();
      importance = HexColor.fromHex(rep.remoteConfig.getString('importanceColor'));
      Log.wtf('Новый цвет: $importance');
      notifyListeners();
    });
  }

}