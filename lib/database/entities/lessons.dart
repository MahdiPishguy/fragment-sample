import 'package:kelide_jazzb/database/entities/month.dart';
import 'package:kelide_jazzb/database/sqf_entity_base.dart';

class TableLessons extends SqfEntityTable {
  static SqfEntityTable _instance;

  static SqfEntityTable get getInstance {
    if (_instance == null) _instance = TableLessons();
    return _instance;
  }

  TableLessons() {
    tableName = "lessons";
    primaryKeyName = "id";
    primaryKeyisIdentity = true;

    fields = [
      SqfEntityField("title", DbType.text),
      SqfEntityField("content", DbType.text),
      SqfEntityField("file_url", DbType.text),
      SqfEntityField("filename", DbType.text),
      SqfEntityField("time", DbType.text),
      SqfEntityField("media", DbType.integer),
      SqfEntityField("key", DbType.integer),
      SqfEntityField("download_complete", DbType.bool, defaultValue: "false"),
      SqfEntityFieldRelationship(TableSection.getInstance,DeleteRule.CASCADE,),
    ];

    super.init();
  }
}
