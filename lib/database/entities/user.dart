import 'package:kelide_jazzb/database/sqf_entity_base.dart';

class TableUser extends SqfEntityTable {
  static SqfEntityTable _instance;

  static SqfEntityTable get getInstance {
    if (_instance == null) _instance = TableUser();
    return _instance;
  }

  TableUser() {
    tableName = "user";
    primaryKeyName = "id";
    primaryKeyisIdentity = true;

    fields = [
      SqfEntityField("password", DbType.text),
      SqfEntityField("active", DbType.bool, defaultValue: 'false'),
      SqfEntityField("mobile_number", DbType.text),
      SqfEntityField("api_token", DbType.text),
      SqfEntityField("device_id", DbType.text),
      SqfEntityField("created_at", DbType.text),
      SqfEntityField("updated_at", DbType.text),
    ];

    super.init();
  }
}