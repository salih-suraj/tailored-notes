import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../shared/models/app_strings.dart';

/// Translates a raw sign-in error into a calm, user-facing message.
///
/// Supabase surfaces failures as [AuthException]s whose `toString()` leaks
/// status codes and internal codes (e.g.
/// `AuthApiException(message: Invalid login credentials, statusCode: 400)`).
/// We never show that to users — we map the known cases to friendly copy and
/// fall back to a generic line for anything unexpected.
String signInErrorMessage(Object? error) {
  if (error is AuthException) {
    final code = error.code?.toLowerCase();
    final message = error.message.toLowerCase();

    if (code == 'invalid_credentials' ||
        message.contains('invalid login credentials')) {
      return AppStrings.signInInvalidCredentials;
    }
    if (code == 'email_not_confirmed' ||
        message.contains('email not confirmed')) {
      return AppStrings.signInEmailNotConfirmed;
    }
    if (code == 'over_request_rate_limit' ||
        error.statusCode == '429' ||
        message.contains('too many')) {
      return AppStrings.signInTooManyAttempts;
    }
    return AppStrings.signInFailed;
  }

  if (error is SocketException || _looksLikeNetworkError(error)) {
    return AppStrings.signInNoConnection;
  }

  return AppStrings.signInFailed;
}

/// Translates an MFA challenge/verify failure into user-facing copy.
String mfaErrorMessage(Object? error) {
  if (error is AuthException) {
    final code = error.code?.toLowerCase();
    final message = error.message.toLowerCase();
    if (code == 'mfa_verification_failed' ||
        message.contains('invalid totp code') ||
        message.contains('invalid code') ||
        message.contains('code')) {
      return AppStrings.mfaInvalidCode;
    }
    return AppStrings.mfaVerifyFailed;
  }

  if (error is SocketException || _looksLikeNetworkError(error)) {
    return AppStrings.signInNoConnection;
  }

  return AppStrings.mfaVerifyFailed;
}

bool _looksLikeNetworkError(Object? error) {
  final text = error.toString().toLowerCase();
  return text.contains('socketexception') ||
      text.contains('failed host lookup') ||
      text.contains('connection closed') ||
      text.contains('network is unreachable');
}
