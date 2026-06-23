import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/supabase_client.dart';
import '../../data/staff_repository.dart';
import '../../domain/staff_member.dart';

part 'staff_provider.g.dart';

@riverpod
StaffRepository staffRepository(Ref ref) =>
    StaffRepository(supabaseClient: ref.watch(supabaseClientProvider));

/// All staff in [homeId]. Manager view.
@riverpod
Future<List<StaffMember>> staffForHome(Ref ref, String homeId) =>
    ref.watch(staffRepositoryProvider).fetchStaff(homeId);
