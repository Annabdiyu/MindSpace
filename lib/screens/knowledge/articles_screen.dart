import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mind_space/config/theme.dart';
import 'package:mind_space/models/article.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({super.key});

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  String _selectedCategory = 'All';
  
  // Sample articles (in production, these would come from Firestore)
  final List<Article> _articles = [
    Article(
      id: '1',
      title: 'Understanding Anxiety: Signs and Coping Strategies',
      summary: 'Learn to recognize anxiety symptoms and discover effective techniques to manage them.',
      content: '''
Anxiety is a natural response to stress, but when it becomes overwhelming, it can interfere with daily life. Understanding the signs and learning coping strategies is crucial for maintaining mental wellness.

## Common Signs of Anxiety
- Persistent worry or fear
- Racing thoughts
- Physical symptoms like rapid heartbeat
- Difficulty concentrating
- Sleep problems

## Coping Strategies
1. **Deep Breathing**: Practice slow, deep breaths to activate your relaxation response
2. **Grounding Techniques**: Focus on your five senses to stay present
3. **Regular Exercise**: Physical activity releases endorphins and reduces stress hormones
4. **Limit Caffeine**: Caffeine can amplify anxiety symptoms
5. **Talk to Someone**: Share your feelings with a trusted friend or professional

Remember, seeking help is a sign of strength, not weakness.
      ''',
      category: ArticleCategory.anxiety,
      readTimeMinutes: 5,
      publishedAt: DateTime.now().subtract(const Duration(days: 1)),
      tags: ['anxiety', 'mental health', 'coping'],
    ),
    Article(
      id: '2',
      title: 'The Power of Mindfulness Meditation',
      summary: 'Discover how mindfulness can transform your mental health and well-being.',
      content: '''
Mindfulness meditation is a powerful practice that can help reduce stress, improve focus, and enhance emotional well-being.

## What is Mindfulness?
Mindfulness is the practice of being fully present in the moment, aware of where we are and what we're doing, without being overly reactive.

## Benefits of Mindfulness
- Reduced stress and anxiety
- Improved emotional regulation
- Better sleep quality
- Enhanced focus and concentration
- Increased self-awareness

## Simple Mindfulness Exercise
1. Find a quiet place to sit
2. Close your eyes and take a deep breath
3. Focus on your breathing
4. When your mind wanders, gently bring it back
5. Start with 5 minutes and gradually increase
      ''',
      category: ArticleCategory.mindfulness,
      readTimeMinutes: 4,
      publishedAt: DateTime.now().subtract(const Duration(days: 2)),
      tags: ['mindfulness', 'meditation', 'wellness'],
    ),
    Article(
      id: '3',
      title: 'Building Self-Esteem: A Practical Guide',
      summary: 'Steps to develop a healthier self-image and boost your confidence.',
      content: '''
Self-esteem is the foundation of mental well-being. Building a healthy self-image takes time and practice, but it's achievable.

## Understanding Self-Esteem
Self-esteem is how we value and perceive ourselves. Healthy self-esteem means having a balanced, accurate view of yourself.

## Practical Steps
1. **Practice Self-Compassion**: Treat yourself as you would a good friend
2. **Set Realistic Goals**: Achieve small wins to build confidence
3. **Challenge Negative Thoughts**: Question your inner critic
4. **Celebrate Your Strengths**: Acknowledge what you're good at
5. **Surround Yourself with Support**: Choose positive relationships
      ''',
      category: ArticleCategory.selfEsteem,
      readTimeMinutes: 6,
      publishedAt: DateTime.now().subtract(const Duration(days: 3)),
      tags: ['self-esteem', 'confidence', 'growth'],
    ),
    Article(
      id: '4',
      title: 'Recognizing and Preventing Burnout',
      summary: 'Learn the warning signs of burnout and how to protect yourself.',
      content: '''
Burnout is a state of emotional, physical, and mental exhaustion caused by prolonged stress. Recognizing the signs early is crucial for prevention.

## Warning Signs
- Chronic fatigue and exhaustion
- Decreased satisfaction and detachment
- Reduced productivity
- Physical symptoms (headaches, insomnia)
- Feeling cynical or negative

## Prevention Strategies
1. Set clear boundaries between work and personal life
2. Take regular breaks during the day
3. Prioritize self-care activities
4. Learn to say no to excessive demands
5. Seek support when needed
      ''',
      category: ArticleCategory.burnout,
      readTimeMinutes: 5,
      publishedAt: DateTime.now().subtract(const Duration(days: 4)),
      tags: ['burnout', 'stress', 'work-life balance'],
    ),
    Article(
      id: '5',
      title: 'Better Sleep for Better Mental Health',
      summary: 'The connection between sleep and mental wellness, plus tips for improvement.',
      content: '''
Quality sleep is essential for mental health. Poor sleep can worsen anxiety, depression, and stress levels.

## The Sleep-Mental Health Connection
- Sleep affects mood regulation
- Lack of sleep increases anxiety
- Dreams help process emotions
- Sleep deprivation impairs judgment

## Sleep Hygiene Tips
1. **Consistent Schedule**: Go to bed and wake up at the same time
2. **Limit Screen Time**: Avoid devices 1 hour before bed
3. **Create a Relaxing Environment**: Dark, cool, and quiet room
4. **Avoid Caffeine Late**: No caffeine after 2 PM
5. **Wind Down Routine**: Read, stretch, or meditate before bed
      ''',
      category: ArticleCategory.sleep,
      readTimeMinutes: 4,
      publishedAt: DateTime.now().subtract(const Duration(days: 5)),
      tags: ['sleep', 'wellness', 'health'],
    ),
  ];

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              
              _buildHeader(),
              
              const SizedBox(height: 20),
              
              _buildCategories(),
              
              const SizedBox(height: 20),
              
              Expanded(child: _buildArticlesList()),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Knowledge Library',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 4),
          Text(
            'Learn about mental health and self-care',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 500.ms);
  }

  Widget _buildCategories() {
    final categories = ['All', ...ArticleCategory.all];
    
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = _selectedCategory == category;
          
          return GestureDetector(
            onTap: () => setState(() => _selectedCategory = category),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: EdgeInsets.only(right: index < categories.length - 1 ? 8 : 0),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.accent : AppColors.cardDark,
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Text(
                category,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  color: isSelected ? Colors.white : AppColors.textSecondary,
                ),
              ),
            ),
          );
        },
      ),
    ).animate().fadeIn(delay: 100.ms, duration: 500.ms);
  }

  Widget _buildArticlesList() {
    final filteredArticles = _selectedCategory == 'All'
        ? _articles
        : _articles.where((a) => a.category == _selectedCategory).toList();

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: filteredArticles.length,
      itemBuilder: (context, index) {
        final article = filteredArticles[index];
        return _buildArticleCard(article)
            .animate()
            .fadeIn(delay: Duration(milliseconds: 50 * index));
      },
    );
  }

  Widget _buildArticleCard(Article article) {
    return GestureDetector(
      onTap: () => _showArticleDetail(article),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.cardDark,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getCategoryColor(article.category).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    article.category,
                    style: TextStyle(
                      fontSize: 12,
                      color: _getCategoryColor(article.category),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.schedule,
                  size: 14,
                  color: AppColors.textMuted,
                ),
                const SizedBox(width: 4),
                Text(
                  '${article.readTimeMinutes} min read',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              article.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              article.summary,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
                height: 1.5,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Text(
                  'Read more',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.accent,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.arrow_forward,
                  size: 16,
                  color: AppColors.accent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Anxiety':
        return const Color(0xFFFF7043);
      case 'Mindfulness':
        return const Color(0xFF00BCD4);
      case 'Self-Esteem':
        return const Color(0xFF7C4DFF);
      case 'Burnout':
        return const Color(0xFFFFEB3B);
      case 'Sleep':
        return const Color(0xFF66BB6A);
      default:
        return AppColors.accent;
    }
  }

  void _showArticleDetail(Article article) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ArticleDetailScreen(article: article),
      ),
    );
  }
}

class ArticleDetailScreen extends StatelessWidget {
  final Article article;

  const ArticleDetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppGradients.backgroundGradient,
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200,
              floating: false,
              pinned: true,
              backgroundColor: AppColors.primaryDark,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  article.title,
                  style: const TextStyle(fontSize: 14),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.accent.withValues(alpha: 0.3),
                        AppColors.primaryDark,
                      ],
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.menu_book,
                      size: 80,
                      color: Colors.white24,
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColors.accent.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            article.category,
                            style: const TextStyle(
                              color: AppColors.accent,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Icon(Icons.schedule, size: 16, color: AppColors.textMuted),
                        const SizedBox(width: 4),
                        Text(
                          '${article.readTimeMinutes} min read',
                          style: const TextStyle(color: AppColors.textMuted),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      article.content,
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.textSecondary,
                        height: 1.8,
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
