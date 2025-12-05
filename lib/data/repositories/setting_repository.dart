import 'package:life_flutter/data/services/db.dart';
import 'package:life_flutter/domain/models/setting.dart';

class SettingRepository {
  SettingRepository({required DB db}) : _db = db;
  final DB _db;

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
    await _db.update(
      'UPDATE settings SET value = ? WHERE id = ?',
      [value, settingId]
    );
  }
}