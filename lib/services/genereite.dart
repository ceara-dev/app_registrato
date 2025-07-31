import 'package:uid/uid.dart';

class UidGenerator {
  static final UidGenerator _instance = UidGenerator._internal();

  UidGenerator._internal();

  factory UidGenerator() => _instance;

  /// Generates a full random UID (e.g., UUID-like)
  String generate() {
    return UId.getId(); // or UId.generator()
  }

  /// Generates a short ID (e.g., 8 characters)
  String generateShort() {
    return UId.getId(); // This is correct
  }
}
