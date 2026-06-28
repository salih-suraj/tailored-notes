import 'dart:async';
import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

const _generic = 'Something went wrong. Please try again.';

/// Turns any thrown error into a clear, human sentence for end users.
///
/// Staff should read *what went wrong* — never a status code, a database
/// error code, or an exception class name (no "404", no
/// "PostgrestException(... 42501)").
String friendlyError(Object? error) {
  if (error == null) return _generic;

  // Network first — the most common real-world failure.
  if (error is SocketException || _looksLikeNetwork(error)) {
    return 'No internet connection. Check your network and try again.';
  }
  if (error is TimeoutException) {
    return 'That took too long to respond. Check your connection and try again.';
  }

  if (error is AuthException) {
    return 'There was a problem with your session. Please sign in again.';
  }

  if (error is FunctionException) {
    // Our Edge Functions return a friendly { error } message — prefer it.
    final details = error.details;
    final message = details is Map ? details['error'] as String? : null;
    if (message != null && message.trim().isNotEmpty) return message;
    return _byStatus(error.status);
  }

  if (error is PostgrestException) {
    final code = error.code;
    if (code == '42501' || code == 'PGRST301' || code == '42P17') {
      return "You don't have permission to do that.";
    }
    if (code == '23505') return 'That record already exists.';
    if (code == '23503') {
      return "That can't be saved because a linked record is missing.";
    }
    return 'Couldn’t reach the records right now. Please try again.';
  }

  // Our own StateErrors carry messages already written for humans.
  if (error is StateError) return error.message;

  return _generic;
}

String _byStatus(int? status) {
  switch (status) {
    case 401:
    case 403:
      return "You don't have permission to do that.";
    case 404:
      return "We couldn't reach that service. Please try again in a moment, "
          'or contact your administrator if it continues.';
    case 408:
    case 429:
      return 'The service is busy right now — please try again in a moment.';
  }
  if (status != null && status >= 500) {
    return 'The service is temporarily unavailable. Please try again shortly.';
  }
  return _generic;
}

bool _looksLikeNetwork(Object error) {
  final text = error.toString().toLowerCase();
  return text.contains('socketexception') ||
      text.contains('failed host lookup') ||
      text.contains('network is unreachable') ||
      text.contains('connection refused') ||
      text.contains('connection closed') ||
      text.contains('clientexception');
}
