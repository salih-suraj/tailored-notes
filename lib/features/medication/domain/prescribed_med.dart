import 'package:freezed_annotation/freezed_annotation.dart';

part 'prescribed_med.freezed.dart';
part 'prescribed_med.g.dart';

enum MedRoute {
  @JsonValue('oral')
  oral,
  @JsonValue('topical')
  topical,
  @JsonValue('inhaler')
  inhaler,
  @JsonValue('subcutaneous')
  subcutaneous,
  @JsonValue('transdermal')
  transdermal,
  @JsonValue('rectal')
  rectal,
  @JsonValue('other')
  other;

  String get displayName => switch (this) {
    MedRoute.oral => 'Oral',
    MedRoute.topical => 'Topical',
    MedRoute.inhaler => 'Inhaler / Nebuliser',
    MedRoute.subcutaneous => 'Subcutaneous',
    MedRoute.transdermal => 'Transdermal (patch)',
    MedRoute.rectal => 'Rectal',
    MedRoute.other => 'Other',
  };
}

enum MedFrequency {
  @JsonValue('morning')
  morning,
  @JsonValue('evening')
  evening,
  @JsonValue('night')
  night,
  @JsonValue('morning_evening')
  morningEvening,
  @JsonValue('three_times_daily')
  threeTimesDaily,
  @JsonValue('four_times_daily')
  fourTimesDaily,
  @JsonValue('prn')
  prn,
  @JsonValue('other')
  other;

  String get displayName => switch (this) {
    MedFrequency.morning => 'Morning',
    MedFrequency.evening => 'Evening',
    MedFrequency.night => 'Night',
    MedFrequency.morningEvening => 'Morning & Evening',
    MedFrequency.threeTimesDaily => 'Three Times Daily',
    MedFrequency.fourTimesDaily => 'Four Times Daily',
    MedFrequency.prn => 'PRN (As Required)',
    MedFrequency.other => 'Other',
  };

  bool get isPrn => this == MedFrequency.prn;
}

/// A medication entry on a child's medication chart.
@freezed
class PrescribedMed with _$PrescribedMed {
  const factory PrescribedMed({
    required String id,
    required String homeId,
    required String childId,
    required String medicationName,
    required String dose,
    required MedRoute route,
    required MedFrequency frequency,
    String? instructions,
    String? prescribedBy,
    required String startDate, // 'YYYY-MM-DD'
    String? endDate, // 'YYYY-MM-DD' — null means ongoing
    @Default(true) bool isActive,
    String? createdById,
    String? updatedById,
    DateTime? deletedAt,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isSynced,
  }) = _PrescribedMed;

  factory PrescribedMed.fromJson(Map<String, dynamic> json) =>
      _$PrescribedMedFromJson(json);
}
