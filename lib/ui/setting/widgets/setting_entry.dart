import 'package:flutter/material.dart';
import 'package:life_flutter/domain/models/setting.dart';

class SettingToggle extends StatefulWidget {
  const SettingToggle({
    super.key,
    required this.setting,
    required this.onSettingChanged
  });

  final Setting setting;
  final Function(dynamic newValue) onSettingChanged;

  @override
  State<StatefulWidget> createState() => _SettingToggleState();
}

class _SettingToggleState extends State<SettingToggle> {
  late bool _currentValue;
  @override
  void initState() {
    super.initState();
    _currentValue = widget.setting.value == '1';
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.setting.name),
      trailing: Switch(
        value: _currentValue,
        onChanged: (bool newValue) {
          setState(() {
            _currentValue = newValue;
          });
          widget.onSettingChanged(newValue);
        },
      )
    );
  }
}
