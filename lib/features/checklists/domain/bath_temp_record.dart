import 'package:freezed_annotation/freezed_annotation.dart';

import '../../daily_notes/domain/daily_note.dart';

part 'bath_temp_record.freezed.dart';
part 'bath_temp_record.g.dart';

/// A single bath temperature check for a child.
/// Water must be measured before the child enters the bath.
@freezed
class BathTempRecord with _$BathTempRecord {
  const factory BathTempRecord({
    required String id,
    required String homeId,
    required String childId,
    required double temperatureCelsius,
    required ShiftType shift,
    required DateTime recordedAt,
    required String recordedById,
    required String recordedByName,
    String? notes,
    String? createdById,
    String? updatedById,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isSynced,
  }) = _BathTempRecord;

  factory BathTempRecord.fromJson(Map<String, dynamic> json) =>
      _$BathTempRecordFromJson(json);
}

/// Returns the safety status of a bath temperature.
enum BathTempStatus { tooCold, safe, tooHot }

BathTempStatus bathTempStatus(double celsius) {
  if (celsius < 37.0) return BathTempStatus.tooCold;
  if (celsius > 40.0) return BathTempStatus.tooHot;
  return BathTempStatus.safe;
}
