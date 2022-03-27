import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase/supabase.dart';

SupabaseClient getSubabaseClient() {
  return SupabaseClient(
      dotenv.get("SUPABASE_URL"), dotenv.get('SUPABASE_API_KEY'));
}
