import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mind_space/config/theme.dart';

class BreathingScreen extends StatefulWidget {
  const BreathingScreen({super.key});

  @override
  State<BreathingScreen> createState() => _BreathingScreenState();
}

class _BreathingScreenState extends State<BreathingScreen>
    with TickerProviderStateMixin {
  late AnimationController _breathingController;
  late AnimationController _pulseController;
  late Animation<double> _breathingAnimation;
  
  bool _isExercising = false;
  int _selectedExercise = 0;
  int _currentPhase = 0; // 0: inhale, 1: hold, 2: exhale, 3: hold
  int _secondsRemaining = 0;
  int _totalSeconds = 0;

  final List<BreathingExercise> _exercises = [
    BreathingExercise(
      name: 'Box Breathing',
      description: 'Equal counts for inhale, hold, exhale, hold',
      inhale: 4,
      holdIn: 4,
      exhale: 4,
      holdOut: 4,
      rounds: 4,
      color: AppColors.accent,
    ),
    BreathingExercise(
      name: '4-7-8 Relaxation',
      description: 'Deep relaxation technique for sleep',
      inhale: 4,
      holdIn: 7,
      exhale: 8,
      holdOut: 0,
      rounds: 4,
      color: const Color(0xFF7C4DFF),
    ),
    BreathingExercise(
      name: 'Calm Breathing',
      description: 'Simple breathing for stress relief',
      inhale: 4,
      holdIn: 2,
      exhale: 6,
      holdOut: 0,
      rounds: 6,
      color: const Color(0xFF00BCD4),
    ),
    BreathingExercise(
      name: 'Energizing Breath',
      description: 'Quick breathing to boost energy',
      inhale: 3,
      holdIn: 0,
      exhale: 3,
      holdOut: 0,
      rounds: 10,
      color: const Color(0xFFFF7043),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _breathingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
    
    _breathingAnimation = Tween<double>(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(parent: _breathingController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _breathingController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  void _startExercise() {
    setState(() {
      _isExercising = true;
      _currentPhase = 0;
    });
    _runBreathingCycle();
  }

  void _stopExercise() {
    setState(() {
      _isExercising = false;
      _currentPhase = 0;
      _secondsRemaining = 0;
    });
    _breathingController.stop();
  }

  Future<void> _runBreathingCycle() async {
    final exercise = _exercises[_selectedExercise];
    final phases = [
      exercise.inhale,
      exercise.holdIn,
      exercise.exhale,
      exercise.holdOut,
    ];

    for (int round = 0; round < exercise.rounds && _isExercising; round++) {
      for (int phase = 0; phase < 4 && _isExercising; phase++) {
        if (phases[phase] == 0) continue;
        
        setState(() => _currentPhase = phase);
        
        // Animate the breathing circle
        if (phase == 0) {
          // Inhale - expand
          _breathingController.duration = Duration(seconds: phases[phase]);
          _breathingController.forward(from: 0);
        } else if (phase == 2) {
          // Exhale - contract
          _breathingController.duration = Duration(seconds: phases[phase]);
          _breathingController.reverse(from: 1);
        }
        
        // Count down
        for (int i = phases[phase]; i > 0 && _isExercising; i--) {
          setState(() => _secondsRemaining = i);
          await Future.delayed(const Duration(seconds: 1));
        }
      }
    }
    
    if (_isExercising) {
      _stopExercise();
      _showCompletionDialog();
    }
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.cardDark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.accent.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle_outline,
                size: 48,
                color: AppColors.accent,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Great Job! 🎉',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'You completed the ${_exercises[_selectedExercise].name} exercise.',
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Done'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getPhaseText() {
    switch (_currentPhase) {
      case 0:
        return 'Breathe In';
      case 1:
        return 'Hold';
      case 2:
        return 'Breathe Out';
      case 3:
        return 'Hold';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppGradients.backgroundGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              
              // Header
              _buildHeader(),
              
              const Spacer(),
              
              // Breathing circle
              _buildBreathingCircle(),
              
              const Spacer(),
              
              // Exercise selector or controls
              _isExercising
                  ? _buildExerciseControls()
                  : _buildExerciseSelector(),
              
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            'Breathing Exercises',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Take a moment to breathe and relax',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 500.ms);
  }

  Widget _buildBreathingCircle() {
    final exercise = _exercises[_selectedExercise];
    
    return AnimatedBuilder(
      animation: _isExercising ? _breathingAnimation : _pulseController,
      builder: (context, child) {
        final scale = _isExercising 
            ? _breathingAnimation.value 
            : 0.8 + (_pulseController.value * 0.1);
        
        return Column(
          children: [
            if (_isExercising) ...[
              Text(
                _getPhaseText(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: exercise.color,
                ),
              ).animate().fadeIn(),
              const SizedBox(height: 8),
              Text(
                '$_secondsRemaining',
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
            ],
            
            Transform.scale(
              scale: scale,
              child: Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      exercise.color.withValues(alpha: 0.6),
                      exercise.color.withValues(alpha: 0.2),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: exercise.color.withValues(alpha: 0.4),
                      blurRadius: 40,
                      spreadRadius: 10,
                    ),
                  ],
                ),
                child: Container(
                  margin: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: exercise.color.withValues(alpha: 0.3),
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: exercise.color.withValues(alpha: 0.5),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.self_improvement,
                        size: 50,
                        color: Colors.white.withValues(alpha: 0.9),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildExerciseSelector() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // Exercise cards
          SizedBox(
            height: 140,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _exercises.length,
              itemBuilder: (context, index) {
                final exercise = _exercises[index];
                final isSelected = _selectedExercise == index;
                
                return GestureDetector(
                  onTap: () {
                    setState(() => _selectedExercise = index);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 160,
                    margin: EdgeInsets.only(
                      left: index == 0 ? 0 : 12,
                      right: index == _exercises.length - 1 ? 0 : 0,
                    ),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isSelected 
                          ? exercise.color.withValues(alpha: 0.2) 
                          : AppColors.cardDark,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isSelected ? exercise.color : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: exercise.color.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.air,
                            color: exercise.color,
                            size: 20,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          exercise.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${exercise.rounds} rounds',
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Start button
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: _startExercise,
              style: ElevatedButton.styleFrom(
                backgroundColor: _exercises[_selectedExercise].color,
              ),
              child: const Text(
                'Start Exercise',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 200.ms, duration: 500.ms);
  }

  Widget _buildExerciseControls() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: OutlinedButton(
          onPressed: _stopExercise,
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: AppColors.error, width: 2),
            foregroundColor: AppColors.error,
          ),
          child: const Text(
            'Stop',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

class BreathingExercise {
  final String name;
  final String description;
  final int inhale;
  final int holdIn;
  final int exhale;
  final int holdOut;
  final int rounds;
  final Color color;

  BreathingExercise({
    required this.name,
    required this.description,
    required this.inhale,
    required this.holdIn,
    required this.exhale,
    required this.holdOut,
    required this.rounds,
    required this.color,
  });
}
