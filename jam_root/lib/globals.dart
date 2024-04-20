import 'package:flutter/material.dart';
import 'package:jam/domain/domain.dart';
import 'package:rxdart/subjects.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

///
/// Globally available through the app
///
final Map<int, BehaviorSubject<ChatModel>> MAIN_CHATS_STREAM = {};
final Map<int, RealtimeChannel> MAIN_CHATS_SOCKETS = {};

///
/// key for push notification in foreground mainly
///
final MAIN_PAGE_KEY = GlobalKey<ScaffoldState>();

///
/// key to identify the router and current context /w current route
///
final ROUTER_KEY = GlobalKey<NavigatorState>(debugLabel: 'routerKey');
