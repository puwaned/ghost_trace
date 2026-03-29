import 'package:isar/isar.dart';

part 'echo_model.g.dart';

enum EchoType { normal, timeCapsule }

@collection
class EchoModel {
  Id get isarId => fastHash(id);

  late String id;
  late String authorDeviceId;
  late double latitude;
  late double longitude;
  late String content;

  @Enumerated(EnumType.name)
  late EchoType type;

  DateTime? unlockAt;

  late int lifeForce;
  late DateTime createdAt;
  DateTime? expiresAt;

  late bool isDiscovered;

  EchoModel();
}

/// Fast non-cryptographic hash for Isar integer ID from a UUID string.
int fastHash(String string) {
  var hash = 0xcbf29ce484222325;
  for (var i = 0; i < string.length; i++) {
    final codeUnit = string.codeUnitAt(i);
    hash ^= codeUnit >> 8;
    hash *= 0x100000001b3;
    hash ^= codeUnit & 0xFF;
    hash *= 0x100000001b3;
  }
  return hash;
}
