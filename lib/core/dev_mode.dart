/// True when the app is launched with --dart-define=DEV_MODE=true.
/// Bypasses authentication and seeds fake data. Never ship with this enabled.
const kDevMode = bool.fromEnvironment('DEV_MODE');
