import 'package:flutter/material.dart';
import 'package:life_flutter/domain/models/setting.dart';
import 'package:life_flutter/ui/core/app_bar.dart';
import 'package:life_flutter/ui/setting/viewmodels/setting_viewmodel.dart';
import 'package:life_flutter/ui/setting/widgets/setting_entry.dart';

class SettingScreen extends StatefulWidget{
  const SettingScreen({super.key, required this.viewmodel});

  final SettingViewmodel viewmodel;

  @override
  State<StatefulWidget> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DynamicAppBar(
        title: 'Settings',
        showFilter: false,
        showTools: false,
      ),
      body: FutureBuilder(
        future: widget.viewmodel.settings,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.hasData) {
            final settings = snapshot.data as List<Setting>;
            return ListView.builder(
              itemCount: settings.length,
              itemBuilder: (context, index) {
                final setting = settings[index];

                void onSettingChanged(dynamic newValue) {
                  setting.setValue(newValue);
                  widget.viewmodel.update(setting);
                }

                if (setting.canToggle) {
                  return SettingToggle(
                    setting: setting,
                    onSettingChanged: onSettingChanged
                  );
                }
                else {
                  return null;
                }
              },
            );
          }
          return const Center(child: Text('Loading...'));
        }
      )
    );
  }
}