import 'package:life_flutter/data/repositories/setting_repository.dart';
import 'package:life_flutter/domain/models/setting.dart';

class SettingViewmodel {
  SettingViewmodel({required SettingRepository settingRepository})
  : _settingRepository = settingRepository;

  final SettingRepository _settingRepository;

  Future<List<Setting>> get settings async {
    return await _settingRepository.settings;
  }

  Future<void> update(int settingId, dynamic value) async {
    await _settingRepository.update(settingId, value);
  }
}