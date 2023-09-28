import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://rftvbsvcljemoonofdhk.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJmdHZic3ZjbGplbW9vbm9mZGhrIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU5MTYzNDQsImV4cCI6MjAxMTQ5MjM0NH0.X-GtVHCkph5RGu_3nijIMSSe-bFX7YxgvxJ8TfqO5E8';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
