import 'package:kelide_jazzb/database/sqf_entity_base.dart';

class TablePayments extends SqfEntityTable {
  static SqfEntityTable _instance;

  static SqfEntityTable get getInstance {
    if (_instance == null) _instance = TablePayments();
    return _instance;
  }

  TablePayments() {
    tableName = "month";
    primaryKeyName = "id";
    primaryKeyisIdentity = true;

    fields = [
      SqfEntityField("resnumber", DbType.text),
      SqfEntityField("invoice_id", DbType.text),
      SqfEntityField("payment", DbType.text),
      SqfEntityField("month_key", DbType.text),
    ];

    super.init();
  }
}
