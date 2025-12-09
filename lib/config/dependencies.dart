import 'package:life_flutter/data/repositories/auth_repository.dart';
import 'package:life_flutter/data/repositories/category_repository.dart';
import 'package:life_flutter/data/repositories/setting_repository.dart';
import 'package:life_flutter/data/repositories/transaction_repository.dart';
import 'package:life_flutter/data/services/auth.dart';
import 'package:life_flutter/data/services/db.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get providers {
  return [
    Provider(create: (context) => DB.instance),
    Provider(create: (context) => BiometricService()),
    Provider(create: (context) => CategoryRepository(db: context.read())),
    Provider(create: (context) => SettingRepository(db: context.read())),
    Provider(create: (context) => TransactionRepository(db: context.read())),
    ChangeNotifierProvider(
      create: (context) => AuthRepository(
        db: context.read(),
        biometricService: context.read()
      )
    )
  ];
}