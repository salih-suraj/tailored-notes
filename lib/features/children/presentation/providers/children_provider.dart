import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/audit/audit_log_writer.dart';
import '../../../../core/dev_mode.dart';
import '../../../../core/network/supabase_client.dart';
import '../../../../core/offline/app_database.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/children_repository.dart';
import '../../domain/child.dart';

part 'children_provider.g.dart';

@riverpod
ChildrenRepository childrenRepository(Ref ref) => ChildrenRepository(
  dao: ref.watch(appDatabaseProvider).childrenDao,
  supabaseClient: ref.watch(supabaseClientProvider),
  currentUser: ref.watch(currentUserProvider),
  auditWriter: ref.watch(auditLogWriterProvider),
);

@riverpod
Stream<List<Child>> children(Ref ref) {
  if (kDevMode) return Stream.value(_devChildren);
  final user = ref.watch(currentUserProvider);
  final homeId = user?.homeId ?? '';
  return ref.watch(childrenRepositoryProvider).watchByHome(homeId);
}

final _now = DateTime.now();

final _devChildren = [
  Child(
    id: 'child-001',
    homeId: 'dev-home-001',
    name: 'Jamie Thornton',
    dateOfBirth: '2012-03-14',
    room: '1A',
    createdAt: _now,
    updatedAt: _now,
  ),
  Child(
    id: 'child-002',
    homeId: 'dev-home-001',
    name: 'Priya Osei',
    dateOfBirth: '2010-08-22',
    room: '2B',
    createdAt: _now,
    updatedAt: _now,
  ),
  Child(
    id: 'child-003',
    homeId: 'dev-home-001',
    name: 'Marcus Elliot',
    dateOfBirth: '2013-11-05',
    room: '3A',
    createdAt: _now,
    updatedAt: _now,
  ),
  Child(
    id: 'child-004',
    homeId: 'dev-home-001',
    name: 'Aisha Kamara',
    dateOfBirth: '2011-06-30',
    room: '2A',
    createdAt: _now,
    updatedAt: _now,
  ),
];
