import 'package:kelide_jazzb/database/sqf_entity_base.dart';

import 'entities/tables.dart';

class AppDatabase extends SqfEntityModel {
  AppDatabase() {
    databaseName = "kelide_jazb.db";
    bundledDatabasePath = null;
    databaseTables = [TableLessons.getInstance, TableSection.getInstance, TablePayments.getInstance, TablePosts.getInstance, TableUser.getInstance];
  }
}
