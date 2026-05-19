/// Represents a child resident in the home.
class Child {
  const Child({
    required this.id,
    required this.homeId,
    required this.name,
    required this.dateOfBirth,
    required this.room,
    this.photoUrl,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  final String id;
  final String homeId;
  final String name;
  final DateTime dateOfBirth;
  final String room;
  final String? photoUrl;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  /// Returns initials for the avatar (up to 2 characters).
  String get initials {
    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
    }
    return name.substring(0, name.length.clamp(0, 2)).toUpperCase();
  }

  int get ageYears {
    final now = DateTime.now();
    int age = now.year - dateOfBirth.year;
    if (now.month < dateOfBirth.month ||
        (now.month == dateOfBirth.month && now.day < dateOfBirth.day)) {
      age--;
    }
    return age;
  }

  Child copyWith({
    String? name,
    String? room,
    String? photoUrl,
    String? notes,
  }) {
    return Child(
      id: id,
      homeId: homeId,
      name: name ?? this.name,
      dateOfBirth: dateOfBirth,
      room: room ?? this.room,
      photoUrl: photoUrl ?? this.photoUrl,
      notes: notes ?? this.notes,
      createdAt: createdAt,
      updatedAt: DateTime.now(),
      deletedAt: deletedAt,
    );
  }
}
