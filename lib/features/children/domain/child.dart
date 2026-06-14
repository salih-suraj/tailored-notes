import 'package:freezed_annotation/freezed_annotation.dart';

part 'child.freezed.dart';
part 'child.g.dart';

/// A child resident in the home.
/// Written to local Drift first; synced to Supabase when online.
@freezed
class Child with _$Child {
  const Child._();

  const factory Child({
    required String id,
    required String homeId,
    required String name,
    required String dateOfBirth, // YYYY-MM-DD
    required String room,
    String? photoUrl,
    String? notes,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
    String? createdById,
    String? updatedById,
    @Default(false) bool isSynced,
  }) = _Child;

  factory Child.fromJson(Map<String, dynamic> json) =>
      _$ChildFromJson(json);

  /// Up to two initials for the avatar.
  String get initials {
    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
    }
    return name.substring(0, name.length.clamp(0, 2)).toUpperCase();
  }

  /// Age in whole years, computed from [dateOfBirth].
  /// Returns 0 for an unparseable date rather than throwing — this getter
  /// renders in the children list and profile, so it must never crash a row.
  int get ageYears {
    final parts = dateOfBirth.split('-');
    if (parts.length != 3) return 0;
    final year = int.tryParse(parts[0]);
    final month = int.tryParse(parts[1]);
    final day = int.tryParse(parts[2]);
    if (year == null || month == null || day == null) return 0;
    final dob = DateTime(year, month, day);
    final now = DateTime.now();
    int age = now.year - dob.year;
    if (now.month < dob.month ||
        (now.month == dob.month && now.day < dob.day)) {
      age--;
    }
    return age;
  }
}
