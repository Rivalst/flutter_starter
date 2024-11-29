import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_starter/src/core/database/drift/table/category_table.dart';
import 'package:flutter_starter/src/core/utils/logger/logger.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'database.g.dart';

@DriftDatabase(tables: [CategoryTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    try {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'data.sqlite'));
      if (Platform.isAndroid) {
        await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
      }
      final cacheBase = (await getTemporaryDirectory()).path;
      sqlite3.tempDirectory = cacheBase;

      return NativeDatabase.createInBackground(file);
    } catch (error, stackTrace) {
      Logger.error('Database Init Error', error, stackTrace);
      rethrow;
    }
  });
}
