import 'package:drift/drift.dart';

// Like example
class CategoryTable extends Table {
  IntColumn get id => integer()();

  TextColumn get name => text()();

  TextColumn get slug => text()();

  IntColumn get auctionsCount => integer()();
}
