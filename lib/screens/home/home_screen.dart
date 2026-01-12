import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mind_space/config/theme.dart';
import 'package:mind_space/screens/mood/mood_checkin_screen.dart';
import 'package:mind_space/screens/journal/journal_list_screen.dart';
import 'package:mind_space/screens/breathing/breathing_screen.dart';
import 'package:mind_space/screens/community/community_screen.dart';
import 'package:mind_space/screens/professional/find_doctor_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const MoodCheckinScreen(),
    const JournalListScreen(),
    const BreathingScreen(),
    const CommunityScreen(),
    const FindDoctorScreen(),
  ];

  final List<String> _titles = [
    'Home',
    'Journal',
    'Breathe',
    'Community',
    'Support',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondaryDark,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, Iconsax.home, Iconsax.home_15, 'Home'),
              _buildNavItem(1, Iconsax.book, Iconsax.book5, 'Journal'),
              _buildNavItem(2, Iconsax.wind, Iconsax.wind, 'Breathe'),
              _buildNavItem(3, Iconsax.people, Iconsax.people5, 'Community'),
              _buildNavItem(4, Iconsax.health, Iconsax.health5, 'Support'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, IconData activeIcon, String label) {
    final isSelected = _currentIndex == index;
    
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.accent.withValues(alpha: 0.15) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? activeIcon : icon,
              color: isSelected ? AppColors.accent : AppColors.textMuted,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color: isSelected ? AppColors.accent : AppColors.textMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
