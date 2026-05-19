import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/dev_mode.dart';
import '../../domain/child.dart';

part 'children_provider.g.dart';

/// Stub — will be replaced with repository + Drift + Supabase sync in Phase 2.
@riverpod
Future<List<Child>> children(Ref ref) async {
  if (kDevMode) return _devChildren;
  // TODO: wire up ChildrenRepository once Drift tables are generated
  return [];
}

final _now = DateTime.now();

final _devChildren = [
  Child(
    id: 'child-001',
    homeId: 'dev-home-001',
    name: 'Jamie Thornton',
    dateOfBirth: DateTime(2012, 3, 14),
    room: '1A',
    createdAt: _now,
    updatedAt: _now,
  ),
  Child(
    id: 'child-002',
    homeId: 'dev-home-001',
    name: 'Priya Osei',
    dateOfBirth: DateTime(2010, 8, 22),
    room: '2B',
    createdAt: _now,
    updatedAt: _now,
  ),
  Child(
    id: 'child-003',
    homeId: 'dev-home-001',
    name: 'Marcus Elliot',
    dateOfBirth: DateTime(2013, 11, 5),
    room: '3A',
    createdAt: _now,
    updatedAt: _now,
  ),
  Child(
    id: 'child-004',
    homeId: 'dev-home-001',
    name: 'Aisha Kamara',
    dateOfBirth: DateTime(2011, 6, 30),
    room: '2A',
    createdAt: _now,
    updatedAt: _now,
  ),
];
