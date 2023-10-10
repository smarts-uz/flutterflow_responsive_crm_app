// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<CustomersRow>> searchCustomers(String? textSearch) async {
  final SupabaseClient supabaseClient = Supabase.instance.client;
  final response = await supabaseClient
      .from('customers')
      .select('*')
      .ilike('name', '%$textSearch%');
  return response.data;
}
