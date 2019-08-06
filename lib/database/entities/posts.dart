import 'package:kelide_jazzb/database/sqf_entity_base.dart';

class TablePosts extends SqfEntityTable {
  static SqfEntityTable _instance;

  static SqfEntityTable get getInstance {
    if (_instance == null) _instance = TablePosts();
    return _instance;
  }

  TablePosts() {
    tableName = "payments";
    primaryKeyName = "id";
    primaryKeyisIdentity = true;

    fields = [
      SqfEntityField("title", DbType.text),
      SqfEntityField("category", DbType.text),
      SqfEntityField("image", DbType.text),
    ];

    super.init();
  }
}