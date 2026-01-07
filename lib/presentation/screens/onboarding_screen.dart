// lib/presentation/screens/onboarding_screen.dart
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'title': 'Welcome to MindSpace',
      'subtitle': 'Your safe space for mental well-being',
      'image': 'assets/onboarding1.svg',
      'description': 'A supportive platform designed for young people to understand and nurture their mental health.',
    },
    {
      'title': 'Track Your Mood',
      'subtitle': 'Understand your emotional patterns',
      'image': 'assets/onboarding2.svg',
      'description': 'Use our daily mood tracker to recognize patterns and celebrate progress.',
    },
    {
      'title': 'Guided Exercises',
      'subtitle': 'Practice mindfulness and self-care',
      'image': 'assets/onboarding3.svg',
      'description': 'Access breathing exercises, journaling, and mindfulness activities anytime.',
    },
    {
      'title': 'Learn & Grow',
      'subtitle': 'Easy-to-read mental health articles',
      'image': 'assets/onboarding4.svg',
      'description': 'Explore topics like stress, anxiety, self-esteem, and more in simple language.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundWhite,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
                itemCount: onboardingData.length,
                itemBuilder: (context, index) {
                  return OnboardingPage(
                    title: onboardingData[index]['title']!,
                    subtitle: onboardingData[index]['subtitle']!,
                    description: onboardingData[index]['description']!,
                  );
                },
              ),
            ),
            _buildIndicators(),
            _buildButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicators() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SmoothPageIndicator(
        controller: _controller,
        count: onboardingData.length,
        effect: const WormEffect(
          dotHeight: 8,
          dotWidth: 8,
          activeDotColor: AppTheme.primaryBlue,
          dotColor: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              // Skip to main app
              Navigator.pushReplacementNamed(context, '/home');
            },
            child: const Text(
              'Skip',
              style: TextStyle(color: AppTheme.textLight),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_currentPage == onboardingData.length - 1) {
                Navigator.pushReplacementNamed(context, '/home');
              } else {
                _controller.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 12,
              ),
            ),
            child: Text(
              _currentPage == onboardingData.length - 1 ? 'Get Started' : 'Next',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Placeholder for illustration
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: AppTheme.secondaryTeal.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.psychology_outlined,
              size: 80,
              color: AppTheme.primaryBlue,
            ),
          ),
          const SizedBox(height: 40),
          Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppTheme.textDark,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 18,
              color: AppTheme.primaryBlue,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            description,
            style: const TextStyle(
              fontSize: 16,
              color: AppTheme.textLight,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}