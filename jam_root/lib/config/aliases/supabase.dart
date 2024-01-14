import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;
final supaAuth = supabase.auth;
final supaStorage = supabase.storage;
final supaUser = supaAuth.currentUser;
