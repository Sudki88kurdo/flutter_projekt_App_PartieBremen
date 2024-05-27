// lib/extensions/date_extensions.dart
extension Iso8061SerializableDateTime on DateTime {
  String toJson() => this.toIso8601String();
}
