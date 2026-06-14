import 'package:supabase_flutter/supabase_flutter.dart';

/// Calls the `ai-shift-summary` Edge Function, which holds the Anthropic
/// API key server-side and returns a written handover brief for the shift.
class AiSummaryService {
  AiSummaryService({required SupabaseClient? supabaseClient})
    : _supabaseClient = supabaseClient;

  final SupabaseClient? _supabaseClient;

  /// Generates a handover brief from the shift's records.
  /// [children] is a compact JSON view of each child's records this shift,
  /// assembled client-side from the same providers as the handover screen.
  Future<String> generate({
    required String date,
    required String shift,
    required List<Map<String, dynamic>> children,
  }) async {
    final client = _supabaseClient;
    if (client == null) {
      throw StateError('No connection — sign in and try again.');
    }

    try {
      final response = await client.functions.invoke(
        'ai-shift-summary',
        body: {'date': date, 'shift': shift, 'children': children},
      );
      final data = response.data;
      final summary = data is Map ? data['summary'] as String? : null;
      if (summary == null || summary.isEmpty) {
        throw StateError('The AI service returned no summary.');
      }
      return summary;
    } on FunctionException catch (e) {
      final details = e.details;
      final message = details is Map ? details['error'] as String? : null;
      throw StateError(message ?? 'AI summary failed (${e.status}).');
    }
  }
}
