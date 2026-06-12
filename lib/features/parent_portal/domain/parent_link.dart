/// A manager-created link giving a parent/guardian read-only access to one
/// child's activities, achievements, and (optionally) photos.
class ParentLink {
  const ParentLink({
    required this.id,
    required this.parentUserId,
    required this.childId,
    required this.homeId,
    required this.canViewPhotos,
    required this.grantedBy,
    required this.createdAt,
    this.revokedAt,
    this.childName,
    this.childPhotoUrl,
    this.parentEmail,
  });

  final String id;
  final String parentUserId;
  final String childId;
  final String homeId;

  /// Whether this parent may see the child's photo in the portal.
  final bool canViewPhotos;
  final String grantedBy;
  final DateTime createdAt;
  final DateTime? revokedAt;

  /// Resolved from the embedded `children` row.
  final String? childName;
  final String? childPhotoUrl;

  /// Resolved from `user_profiles` (manager view only).
  final String? parentEmail;

  bool get isActive => revokedAt == null;

  String get displayName => childName ?? 'Child ${childId.substring(0, 8)}…';

  factory ParentLink.fromJson(Map<String, dynamic> json) {
    final child = json['children'] as Map<String, dynamic>?;
    final users = json['users'] as Map<String, dynamic>?;
    return ParentLink(
      id: json['id'] as String,
      parentUserId: json['parent_user_id'] as String,
      childId: json['child_id'] as String,
      homeId: json['home_id'] as String,
      canViewPhotos: json['can_view_photos'] as bool? ?? false,
      grantedBy: json['granted_by'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      revokedAt: json['revoked_at'] == null
          ? null
          : DateTime.parse(json['revoked_at'] as String),
      childName: child?['name'] as String?,
      childPhotoUrl: child?['photo_url'] as String?,
      parentEmail: users?['email'] as String?,
    );
  }
}
