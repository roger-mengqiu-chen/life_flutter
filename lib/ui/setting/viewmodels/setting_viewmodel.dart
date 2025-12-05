import 'package:flutter/foundation.dart';
import 'package:life_flutter/data/repositories/setting_repository.dart';
import 'package:life_flutter/domain/models/setting.dart';
import 'package:logging/logging.dart';

class SettingViewmodel extends ChangeNotifier {
  SettingViewmodel({required SettingRepository settingRepository})
  : _settingRepository = settingRepository;

  final SettingRepository _settingRepository;
  final _log = Logger('SettingViewmodel');

  Future<List<Setting>> get settings async {
    return await _settingRepository.settings;
  }

  Future<void> update(Setting setting) async {
    await _settingRepository.update(setting.id!, setting.value);
    _log.info('Updated setting: ${setting.id} with new value ${setting.value}');
    notifyListeners();
  }
}