import 'package:hive/hive.dart';

part 'item.g.dart';

@HiveType(typeId: 1)
class Item extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String nome;

  Item({required this.id, required this.nome});
}
