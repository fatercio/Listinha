// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class ConfigurationModel extends _ConfigurationModel
    with RealmEntity, RealmObjectBase, RealmObject {
  ConfigurationModel(
    String themeModelName, {
    DateTime? syncDate,
  }) {
    RealmObjectBase.set(this, 'themeModelName', themeModelName);
    RealmObjectBase.set(this, 'syncDate', syncDate);
  }

  ConfigurationModel._();

  @override
  String get themeModelName =>
      RealmObjectBase.get<String>(this, 'themeModelName') as String;
  @override
  set themeModelName(String value) =>
      RealmObjectBase.set(this, 'themeModelName', value);

  @override
  DateTime? get syncDate =>
      RealmObjectBase.get<DateTime>(this, 'syncDate') as DateTime?;
  @override
  set syncDate(DateTime? value) => RealmObjectBase.set(this, 'syncDate', value);

  @override
  Stream<RealmObjectChanges<ConfigurationModel>> get changes =>
      RealmObjectBase.getChanges<ConfigurationModel>(this);

  @override
  ConfigurationModel freeze() =>
      RealmObjectBase.freezeObject<ConfigurationModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(ConfigurationModel._);
    return const SchemaObject(
        ObjectType.realmObject, ConfigurationModel, 'ConfigurationModel', [
      SchemaProperty('themeModelName', RealmPropertyType.string),
      SchemaProperty('syncDate', RealmPropertyType.timestamp, optional: true),
    ]);
  }
}
