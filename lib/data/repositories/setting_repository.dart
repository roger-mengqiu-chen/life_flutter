import 'package:life_flutter/data/services/db.dart';
import 'package:life_flutter/domain/models/setting.dart';
import 'package:logging/logging.dart';

class SettingRepository {
  SettingRepository({required DB db}) : _db = db;
  final DB _db;
  final _log = Logger('SettingRepository');

  Future<List<Setting>> get settings async {
    List<Map<String, dynamic>> res = await _db.query(
      'SELECT * FROM settings'
    );
    return res.map(
      (e) =>
        Setting(
          id: e['id'],
          name: e['name'],
          value: e['value'],
          toggleAttr: e['canToggle']
    )).toList();
  }

  Future<void> update(int settingId, String value) async {
    _log.info('Updating setting $settingId to $value');
    await _db.update(
      'UPDATE settings SET value = ? WHERE id = ?',
      [value, settingId]
    );
  }
}