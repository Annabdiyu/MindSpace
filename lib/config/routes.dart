import 'package:flutter/material.dart';
import 'package:mind_space/screens/auth/welcome_screen.dart';
import 'package:mind_space/screens/auth/login_screen.dart';
import 'package:mind_space/screens/auth/signup_screen.dart';
import 'package:mind_space/screens/home/home_screen.dart';
import 'package:mind_space/screens/mood/mood_checkin_screen.dart';
import 'package:mind_space/screens/mood/mood_insights_screen.dart';
import 'package:mind_space/screens/journal/journal_list_screen.dart';
import 'package:mind_space/screens/journal/journal_entry_screen.dart';
import 'package:mind_space/screens/breathing/breathing_screen.dart';
import 'package:mind_space/screens/knowledge/articles_screen.dart';
import 'package:mind_space/screens/community/community_screen.dart';
import 'package:mind_space/screens/professional/find_doctor_screen.dart';
import 'package:mind_space/screens/professional/appointments_screen.dart';

class AppRoutes {
  static const String welcome = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String moodCheckin = '/mood-checkin';
  static const String moodInsights = '/mood-insights';
  static const String journalList = '/journal';
  static const String journalEntry = '/journal-entry';
  static const String breathing = '/breathing';
  static const String articles = '/articles';
  static const String community = '/community';
  static const String findDoctor = '/find-doctor';
  static const String appointments = '/appointments';

  static Map<String, WidgetBuilder> get routes => {
    welcome: (context) => const WelcomeScreen(),
    login: (context) => const LoginScreen(),
    signup: (context) => const SignupScreen(),
    home: (context) => const HomeScreen(),
    moodCheckin: (context) => const MoodCheckinScreen(),
    moodInsights: (context) => const MoodInsightsScreen(),
    journalList: (context) => const JournalListScreen(),
    journalEntry: (context) => const JournalEntryScreen(),
    breathing: (context) => const BreathingScreen(),
    articles: (context) => const ArticlesScreen(),
    community: (context) => const CommunityScreen(),
    findDoctor: (context) => const FindDoctorScreen(),
    appointments: (context) => const AppointmentsScreen(),
  };
}
