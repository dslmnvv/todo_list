import 'package:firebase_remote_config/firebase_remote_config.dart';

class ConfigRepository {
  final FirebaseRemoteConfig _remoteConfig;


  FirebaseRemoteConfig get remoteConfig => _remoteConfig;

  ConfigRepository(this._remoteConfig);

  String get importanceColor => _remoteConfig.getString(_ConfigFields.importanceColor);

  Future<void> init() async {
    _remoteConfig.setDefaults({
      _ConfigFields.importanceColor: '#FF0000',
    });
  }
}

abstract class _ConfigFields {
  static const importanceColor = 'importanceColor';
}