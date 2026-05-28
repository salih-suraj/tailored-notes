/// An active access grant that allows an inspector to review a care home.
class InspectorGrant {
  const InspectorGrant({
    required this.id,
    required this.inspectorUserId,
    required this.homeId,
    required this.grantedBy,
    required this.expiresAt,
    required this.createdAt,
    this.homeName,
    this.inspectorEmail,
  });

  final String id;
  final String inspectorUserId;
  final String homeId;
  final String grantedBy;
  final DateTime expiresAt;
  final DateTime createdAt;
  final String? homeName;
  final String? inspectorEmail;

  bool get isActive => expiresAt.isAfter(DateTime.now());
  int get daysRemaining => expiresAt.difference(DateTime.now()).inDays;

  String get displayName => homeName ?? 'Home ${homeId.substring(0, 8)}…';

  factory InspectorGrant.fromJson(Map<String, dynamic> json) {
    final homes = json['homes'] as Map<String, dynamic>?;
    final users = json['users'] as Map<String, dynamic>?;
    return InspectorGrant(
      id: json['id'] as String,
      inspectorUserId: json['inspector_user_id'] as String,
      homeId: json['home_id'] as String,
      grantedBy: json['granted_by'] as String,
      expiresAt: DateTime.parse(json['expires_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      homeName: homes?['name'] as String?,
      inspectorEmail: users?['email'] as String?,
    );
  }
}
