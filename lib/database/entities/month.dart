import 'package:kelide_jazzb/database/sqf_entity_base.dart';

class TableSection extends SqfEntityTable {
  static SqfEntityTable _instance;

  static SqfEntityTable get getInstance {
    if (_instance == null) _instance = TableSection();
    return _instance;
  }

  TableSection() {
    tableName = "month_section";
    primaryKeyName = "id";
    primaryKeyisIdentity = true;

    fields = [
      SqfEntityField("month_title", DbType.text),
      SqfEntityField("month_description", DbType.text),
      SqfEntityField("price", DbType.text),
      SqfEntityField("key", DbType.text),
    ];

    super.init();
  }
}
