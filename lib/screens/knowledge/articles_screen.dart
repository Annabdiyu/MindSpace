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
  
  // Comprehensive Knowledge Library articles
  final List<Article> _articles = [
    // ANXIETY SECTION
    Article(
      id: '1',
      title: 'Understanding Anxiety: Signs and Coping Strategies',
      summary: 'A comprehensive guide to recognizing anxiety symptoms and discovering effective techniques to manage them in daily life.',
      content: '''
Anxiety is one of the most common mental health challenges, affecting millions of people worldwide. While some anxiety is a normal part of life, understanding when it becomes problematic and learning effective coping strategies is essential for mental wellness.

## What is Anxiety?
Anxiety is your body's natural response to stress. It's a feeling of fear or apprehension about what's to come. However, when these feelings become excessive, persistent, and interfere with daily activities, it may indicate an anxiety disorder.

## Types of Anxiety Disorders
• **Generalized Anxiety Disorder (GAD)**: Excessive worry about everyday matters
• **Social Anxiety Disorder**: Intense fear of social situations
• **Panic Disorder**: Recurring unexpected panic attacks
• **Specific Phobias**: Intense fear of specific objects or situations
• **Separation Anxiety**: Fear of being away from home or loved ones

## Common Signs and Symptoms

### Physical Symptoms
- Rapid heartbeat or palpitations
- Shortness of breath or hyperventilation
- Sweating, trembling, or shaking
- Muscle tension and headaches
- Digestive issues (nausea, stomach pain)
- Fatigue and sleep disturbances
- Dizziness or lightheadedness

### Emotional and Cognitive Symptoms
- Persistent worry or fear
- Racing thoughts and difficulty concentrating
- Irritability and restlessness
- Feeling on edge or overwhelmed
- Difficulty controlling worry
- Expecting the worst outcomes

## Evidence-Based Coping Strategies

### 1. Deep Breathing Techniques
Practice the 4-7-8 breathing method:
- Inhale quietly through the nose for 4 seconds
- Hold your breath for 7 seconds
- Exhale completely through the mouth for 8 seconds
- Repeat 3-4 times

### 2. Grounding Techniques (5-4-3-2-1 Method)
When feeling anxious, identify:
- 5 things you can SEE
- 4 things you can TOUCH
- 3 things you can HEAR
- 2 things you can SMELL
- 1 thing you can TASTE

### 3. Progressive Muscle Relaxation
Systematically tense and release muscle groups throughout your body, starting from your toes and moving up to your head.

### 4. Cognitive Restructuring
- Identify negative thought patterns
- Challenge irrational beliefs
- Replace with balanced, realistic thoughts
- Keep an anxiety journal to track triggers

### 5. Lifestyle Modifications
- Regular exercise (30 minutes, 5 times a week)
- Limit caffeine and alcohol intake
- Maintain a consistent sleep schedule
- Practice time management
- Build a strong support network

## When to Seek Professional Help
Consider reaching out to a mental health professional if:
- Anxiety significantly impacts your daily life
- You experience frequent panic attacks
- Physical symptoms are severe or persistent
- Self-help strategies aren't providing relief
- You're using substances to cope

Remember: Seeking help is a sign of strength, not weakness. You don't have to face anxiety alone.
      ''',
      category: ArticleCategory.anxiety,
      readTimeMinutes: 8,
      publishedAt: DateTime.now().subtract(const Duration(days: 1)),
      tags: ['anxiety', 'mental health', 'coping', 'stress management'],
    ),
    Article(
      id: '2',
      title: 'Panic Attacks: Recognition and Management',
      summary: 'Learn to identify panic attack symptoms and discover techniques to manage and prevent them effectively.',
      content: '''
Panic attacks can be frightening experiences, but understanding them is the first step toward managing them effectively. This guide provides comprehensive information about recognition and coping strategies.

## What is a Panic Attack?
A panic attack is a sudden episode of intense fear that triggers severe physical reactions when there is no real danger or apparent cause. They can occur unexpectedly or be triggered by specific situations.

## Recognizing Panic Attack Symptoms

### Physical Symptoms
- Racing or pounding heartbeat
- Chest pain or discomfort
- Shortness of breath or feeling of choking
- Trembling or shaking
- Sweating
- Nausea or abdominal distress
- Dizziness or lightheadedness
- Chills or hot flashes
- Numbness or tingling sensations

### Psychological Symptoms
- Fear of losing control or "going crazy"
- Fear of dying
- Feeling detached from reality (derealization)
- Feeling detached from yourself (depersonalization)

## Managing During a Panic Attack

### Step 1: Acknowledge What's Happening
Remind yourself: "This is a panic attack. It is temporary and will pass. I am not in danger."

### Step 2: Control Your Breathing
- Breathe slowly and deeply
- Inhale through your nose for 4 counts
- Hold for 2 counts
- Exhale through your mouth for 6 counts

### Step 3: Ground Yourself
- Focus on physical sensations
- Plant your feet firmly on the ground
- Hold a cold object or splash cold water on your face
- Describe your surroundings out loud

### Step 4: Use Positive Self-Talk
- "This feeling will pass"
- "I have survived this before"
- "My body is safe"
- "I am in control"

## Prevention Strategies
- Practice relaxation techniques daily
- Regular physical exercise
- Avoid caffeine, alcohol, and smoking
- Get adequate sleep (7-9 hours)
- Identify and avoid triggers when possible
- Consider cognitive-behavioral therapy (CBT)

## Building a Support System
- Inform trusted friends and family
- Create an emergency contact list
- Consider joining a support group
- Work with a mental health professional

Remember: Panic attacks, while frightening, are not dangerous. With proper understanding and techniques, you can learn to manage and reduce their frequency and intensity.
      ''',
      category: ArticleCategory.anxiety,
      readTimeMinutes: 7,
      publishedAt: DateTime.now().subtract(const Duration(days: 2)),
      tags: ['panic attacks', 'anxiety', 'coping', 'mental health'],
    ),

    // MINDFULNESS SECTION
    Article(
      id: '3',
      title: 'The Power of Mindfulness Meditation',
      summary: 'A complete guide to mindfulness practice and how it can transform your mental health and overall well-being.',
      content: '''
Mindfulness meditation has been practiced for thousands of years and is now backed by extensive scientific research showing its benefits for mental health, emotional well-being, and even physical health.

## What is Mindfulness?
Mindfulness is the practice of purposely focusing your attention on the present moment—and accepting it without judgment. It involves being fully aware of where we are and what we're doing, without being overly reactive or overwhelmed.

## The Science Behind Mindfulness
Research has shown that regular mindfulness practice can:
- Reduce activity in the amygdala (brain's stress center)
- Increase gray matter in areas associated with learning and memory
- Strengthen neural connections related to attention and sensory processing
- Lower cortisol levels (stress hormone)
- Improve immune function

## Benefits of Regular Practice

### Mental Health Benefits
- Significant reduction in anxiety and depression symptoms
- Better emotional regulation and resilience
- Decreased rumination and negative thought patterns
- Improved ability to cope with stress
- Greater sense of calm and peace

### Cognitive Benefits
- Enhanced focus and concentration
- Improved memory and learning ability
- Better decision-making skills
- Increased creativity
- Greater mental clarity

### Physical Benefits
- Lower blood pressure
- Reduced chronic pain
- Better sleep quality
- Improved immune response
- Reduced inflammation

## Types of Mindfulness Practices

### 1. Breath Awareness Meditation
Focus solely on your breath, observing each inhale and exhale without trying to change it.

### 2. Body Scan Meditation
Systematically focus on different parts of your body, noticing sensations without judgment.

### 3. Loving-Kindness Meditation
Direct feelings of love and compassion first to yourself, then to others.

### 4. Walking Meditation
Practice mindful awareness while walking slowly and deliberately.

### 5. Mindful Eating
Pay full attention to the experience of eating—the colors, smells, textures, and tastes.

## Getting Started: A Simple Practice

### 5-Minute Beginner Meditation
1. Find a comfortable seated position
2. Close your eyes or soften your gaze
3. Take three deep breaths to settle in
4. Let your breath return to its natural rhythm
5. Focus attention on the sensation of breathing
6. When your mind wanders (it will!), gently return focus to breath
7. Continue for 5 minutes
8. Slowly open your eyes and return to your day

## Tips for Building a Consistent Practice
- Start small (just 5 minutes daily)
- Practice at the same time each day
- Create a dedicated meditation space
- Use guided meditations when starting out
- Be patient and compassionate with yourself
- Track your practice to stay motivated

## Common Challenges and Solutions

**"My mind won't stop wandering"**
This is completely normal! The practice is in noticing when your mind wanders and gently returning focus.

**"I don't have time"**
Even 5 minutes makes a difference. Try meditating during lunch breaks or before bed.

**"I can't sit still"**
Try walking meditation or gentle yoga as an alternative.

**"I'm not seeing results"**
Benefits often come gradually. Keep practicing and trust the process.

Mindfulness is not about achieving a blank mind—it's about cultivating awareness and accepting the present moment as it is.
      ''',
      category: ArticleCategory.mindfulness,
      readTimeMinutes: 9,
      publishedAt: DateTime.now().subtract(const Duration(days: 3)),
      tags: ['mindfulness', 'meditation', 'wellness', 'mental health'],
    ),
    Article(
      id: '4',
      title: 'Mindful Breathing Exercises for Daily Life',
      summary: 'Practical breathing techniques you can use anywhere to reduce stress and increase calm.',
      content: '''
Your breath is always with you, making it the perfect tool for instant stress relief and mindfulness practice. These techniques can be used anywhere, anytime.

## Why Breathing Matters
When we're stressed, our breathing becomes shallow and rapid. Conscious breathing activates the parasympathetic nervous system, signaling your body to relax and reducing the stress response.

## Essential Breathing Techniques

### 1. Box Breathing (Square Breathing)
Used by Navy SEALs for stress management:
- Inhale for 4 counts
- Hold for 4 counts
- Exhale for 4 counts
- Hold for 4 counts
- Repeat 4 times

**Best for:** Acute stress, before important meetings, when feeling overwhelmed

### 2. 4-7-8 Breathing (Relaxing Breath)
Developed by Dr. Andrew Weil:
- Inhale through nose for 4 counts
- Hold breath for 7 counts
- Exhale through mouth for 8 counts
- Repeat 3-4 times

**Best for:** Falling asleep, calming anxiety, managing anger

### 3. Diaphragmatic Breathing (Belly Breathing)
- Place one hand on chest, one on belly
- Breathe so that only your belly rises
- Chest should remain relatively still
- Inhale for 3 counts, exhale for 6 counts

**Best for:** Daily stress management, improving lung capacity, relaxation

### 4. Alternate Nostril Breathing (Nadi Shodhana)
- Close right nostril with thumb
- Inhale through left nostril
- Close left nostril, release right
- Exhale through right nostril
- Inhale through right nostril
- Switch and exhale through left

**Best for:** Balancing energy, before meditation, calming the mind

### 5. Energizing Breath (Bellows Breath)
- Rapid, rhythmic breaths through the nose
- Both inhale and exhale are short and equal
- Keep shoulders relaxed
- Start with 15 seconds, build to 30 seconds

**Best for:** Increasing alertness, combating fatigue, energizing before exercise

## Integrating Breathing into Daily Life

### Morning Routine
Start your day with 5 minutes of deep breathing before getting out of bed.

### Commute
Practice box breathing while in traffic or on public transport.

### Work Hours
Take breathing breaks every 90 minutes to reset your focus.

### Before Meals
Three deep breaths before eating aids digestion and prevents overeating.

### Evening Wind-Down
Use 4-7-8 breathing as part of your bedtime routine.

## Creating a Breathing Practice
- Set reminders on your phone
- Link breathing to existing habits (coffee break, bathroom visit)
- Use apps to guide your practice
- Track how you feel before and after

Remember: The breath is always available to you as a tool for calm and presence. The more you practice, the more automatic these techniques become.
      ''',
      category: ArticleCategory.mindfulness,
      readTimeMinutes: 6,
      publishedAt: DateTime.now().subtract(const Duration(days: 4)),
      tags: ['breathing', 'mindfulness', 'stress relief', 'relaxation'],
    ),

    // SELF-ESTEEM SECTION
    Article(
      id: '5',
      title: 'Building Self-Esteem: A Practical Guide',
      summary: 'Comprehensive steps to develop a healthier self-image, overcome self-doubt, and build lasting confidence.',
      content: '''
Self-esteem is the foundation of mental well-being and affects every aspect of our lives—from relationships to career success. Building healthy self-esteem is a journey that requires patience, practice, and self-compassion.

## Understanding Self-Esteem

### What is Self-Esteem?
Self-esteem is your overall opinion of yourself—how you feel about your abilities, limitations, and worth as a person. It's not about being arrogant or thinking you're better than others; it's about having a realistic, positive view of yourself.

### Signs of Healthy Self-Esteem
- Confidence in your abilities
- Ability to say no and set boundaries
- Positive outlook on life
- Resilience in facing challenges
- Acceptance of mistakes as learning opportunities
- Authentic self-expression

### Signs of Low Self-Esteem
- Constant self-criticism
- Difficulty accepting compliments
- Fear of failure or rejection
- People-pleasing behavior
- Negative self-talk
- Comparing yourself unfavorably to others

## Root Causes of Low Self-Esteem
- Childhood experiences and upbringing
- Traumatic events
- Ongoing stressful situations
- Negative relationships
- Unrealistic expectations (from self or others)
- Social media comparison
- Mental health conditions

## Building Blocks of Self-Esteem

### 1. Practice Self-Compassion
Treat yourself with the same kindness you would offer a good friend.
- Acknowledge your suffering without judgment
- Remember that imperfection is part of being human
- Speak to yourself gently, especially during difficult times
- Practice self-forgiveness

### 2. Challenge Negative Thoughts
Learn to identify and dispute your inner critic.
- Notice when you're being self-critical
- Ask: "Would I say this to a friend?"
- Look for evidence that contradicts negative thoughts
- Replace harsh thoughts with balanced ones

### 3. Set and Achieve Goals
Build confidence through accomplishment.
- Start with small, achievable goals
- Break larger goals into manageable steps
- Celebrate your successes, no matter how small
- Learn from setbacks without self-blame

### 4. Develop Your Strengths
Focus on what you do well.
- Identify your natural talents and abilities
- Invest time in developing your strengths
- Use your strengths to help others
- Recognize that everyone has unique gifts

### 5. Build Positive Relationships
Surround yourself with supportive people.
- Spend time with those who lift you up
- Set boundaries with negative influences
- Practice assertive communication
- Cultivate meaningful connections

### 6. Take Care of Your Body
Physical health impacts mental well-being.
- Exercise regularly (releases mood-boosting endorphins)
- Eat nutritious foods
- Get adequate sleep
- Practice good hygiene and self-care

### 7. Practice Positive Self-Talk
Change your internal dialogue.
- Notice your self-talk patterns
- Challenge negative statements
- Use affirmations that feel authentic
- Focus on progress, not perfection

## Daily Self-Esteem Exercises

### Morning Affirmations
Start each day by stating three things you appreciate about yourself.

### Gratitude Journaling
Write down three things you're grateful for each evening.

### Success Log
Keep a record of your daily accomplishments, no matter how small.

### Mirror Exercise
Look at yourself in the mirror and say something kind.

### Boundary Practice
Say "no" to one thing that doesn't serve your well-being.

## The Journey Ahead
Building self-esteem is not a destination but an ongoing practice. Be patient with yourself, celebrate progress, and remember that you are worthy of love and respect—including from yourself.
      ''',
      category: ArticleCategory.selfEsteem,
      readTimeMinutes: 10,
      publishedAt: DateTime.now().subtract(const Duration(days: 5)),
      tags: ['self-esteem', 'confidence', 'personal growth', 'mental health'],
    ),
    Article(
      id: '6',
      title: 'Overcoming Imposter Syndrome',
      summary: 'Understand imposter syndrome and learn strategies to overcome feelings of self-doubt and fraudulence.',
      content: '''
Imposter syndrome affects an estimated 70% of people at some point in their lives. Understanding this phenomenon and learning to overcome it is essential for personal and professional growth.

## What is Imposter Syndrome?
Imposter syndrome is the persistent inability to believe that your success is deserved or has been legitimately achieved through your own efforts or skills. Despite evidence of competence, those with imposter syndrome feel like frauds.

## Types of Imposter Syndrome

### The Perfectionist
Sets excessively high goals and feels like a failure when they don't meet every one perfectly.

### The Superwoman/Superman
Pushes themselves to work harder to measure up, often sacrificing health and relationships.

### The Natural Genius
Believes they need to get everything right on the first try or they're not good enough.

### The Soloist
Feels they need to accomplish everything alone and asking for help is a sign of failure.

### The Expert
Feels they need to know everything and fears being exposed as inexperienced or unknowledgeable.

## Signs You May Have Imposter Syndrome
- Attributing success to luck or external factors
- Downplaying accomplishments
- Fear of being "found out"
- Overworking to prove yourself
- Difficulty accepting praise
- Setting unrealistically high standards
- Procrastinating due to fear of failure

## Strategies for Overcoming Imposter Syndrome

### 1. Acknowledge Your Feelings
- Recognize when imposter feelings arise
- Name the feeling without judgment
- Understand that these thoughts are not facts

### 2. Collect Evidence
- Keep a record of achievements and positive feedback
- Review this when self-doubt strikes
- Ask mentors for objective assessments

### 3. Reframe Your Thinking
- Replace "I'm a fraud" with "I'm learning and growing"
- Recognize that everyone makes mistakes
- View challenges as opportunities

### 4. Share Your Experience
- Talk to trusted colleagues or friends
- You'll likely find many others feel the same
- Normalize the experience

### 5. Embrace Being a Beginner
- Accept that not knowing everything is okay
- View each experience as a learning opportunity
- Celebrate progress over perfection

### 6. Develop a Growth Mindset
- Believe that abilities can be developed
- Focus on effort and learning
- Embrace challenges as growth opportunities

## Self-Compassion Exercises
- Write a letter of encouragement to yourself
- Practice the "What would I tell a friend?" exercise
- Create a self-compassion mantra

Remember: Feeling like an imposter doesn't mean you are one. Your accomplishments are real, and you deserve to be where you are.
      ''',
      category: ArticleCategory.selfEsteem,
      readTimeMinutes: 7,
      publishedAt: DateTime.now().subtract(const Duration(days: 6)),
      tags: ['imposter syndrome', 'self-doubt', 'confidence', 'career'],
    ),

    // STRESS SECTION
    Article(
      id: '7',
      title: 'Managing Daily Stress: A Complete Guide',
      summary: 'Learn effective strategies to identify, manage, and reduce stress in your everyday life.',
      content: '''
Stress is an inevitable part of modern life, but chronic stress can have serious effects on your physical and mental health. Learning to manage stress effectively is one of the most important skills you can develop.

## Understanding Stress

### What is Stress?
Stress is your body's response to any demand or threat. When you sense danger—real or imagined—your body's defenses kick into high gear in a rapid, automatic process known as the "fight-or-flight" response.

### Types of Stress
- **Acute Stress**: Short-term stress from immediate pressures
- **Episodic Acute Stress**: Frequent episodes of acute stress
- **Chronic Stress**: Long-term, ongoing stress

### How Stress Affects the Body
- Elevated heart rate and blood pressure
- Muscle tension
- Weakened immune system
- Digestive problems
- Sleep disturbances
- Hormonal imbalances

### How Stress Affects the Mind
- Anxiety and worry
- Difficulty concentrating
- Irritability and mood swings
- Feeling overwhelmed
- Depression

## Identifying Your Stress Triggers

### Common Stress Triggers
- Work pressures and deadlines
- Financial concerns
- Relationship issues
- Health problems
- Major life changes
- Daily hassles

### Creating a Stress Inventory
1. Keep a stress journal for one week
2. Note when you feel stressed
3. Identify the trigger
4. Rate the intensity (1-10)
5. Record how you responded

## Stress Management Strategies

### Physical Strategies
**Exercise Regularly**
- Aim for 30 minutes of moderate exercise daily
- Choose activities you enjoy
- Even a 10-minute walk helps

**Sleep Hygiene**
- Maintain a consistent sleep schedule
- Create a relaxing bedtime routine
- Limit screen time before bed

**Nutrition**
- Eat a balanced diet
- Limit caffeine and alcohol
- Stay hydrated
- Avoid stress eating

### Mental Strategies
**Mindfulness and Meditation**
- Practice present-moment awareness
- Use guided meditation apps
- Start with just 5 minutes daily

**Cognitive Reframing**
- Challenge negative thoughts
- Look for alternative perspectives
- Focus on what you can control

**Time Management**
- Prioritize tasks using the Eisenhower Matrix
- Break large tasks into smaller steps
- Learn to delegate

### Emotional Strategies
**Build a Support Network**
- Connect with friends and family
- Join support groups
- Consider therapy

**Express Your Feelings**
- Journal your thoughts
- Talk to someone you trust
- Use creative outlets

**Set Boundaries**
- Learn to say no
- Limit time with negative people
- Protect your personal time

### Quick Stress Relief Techniques
- Take 5 deep breaths
- Step outside for fresh air
- Listen to calming music
- Practice progressive muscle relaxation
- Use visualization
- Engage your senses (aromatherapy, stress balls)

## Building Resilience
- Develop a positive outlook
- Accept that change is part of life
- Maintain perspective
- Take decisive action on problems
- Look for opportunities for self-discovery
- Nurture a positive view of yourself

## When to Seek Help
Consider professional support if:
- Stress significantly impacts daily life
- You're using substances to cope
- Physical symptoms are severe
- You feel hopeless or helpless

Remember: Managing stress is a skill that improves with practice. Be patient with yourself and celebrate small victories.
      ''',
      category: ArticleCategory.stress,
      readTimeMinutes: 10,
      publishedAt: DateTime.now().subtract(const Duration(days: 7)),
      tags: ['stress', 'stress management', 'coping', 'wellness'],
    ),

    // BURNOUT SECTION
    Article(
      id: '8',
      title: 'Recognizing and Preventing Burnout',
      summary: 'Understand the warning signs of burnout and learn evidence-based strategies to protect yourself and recover.',
      content: '''
Burnout has become increasingly common in our fast-paced, always-connected world. The World Health Organization officially recognized burnout as an occupational phenomenon, highlighting its significance as a mental health concern.

## What is Burnout?
Burnout is a state of chronic stress that leads to physical and emotional exhaustion, cynicism and detachment, and feelings of ineffectiveness and lack of accomplishment. It's more than just being tired—it's a state of complete depletion.

## The Three Dimensions of Burnout

### 1. Exhaustion
- Feeling drained and depleted
- Lacking energy to complete basic tasks
- Physical fatigue that doesn't improve with rest
- Emotional numbness

### 2. Cynicism and Detachment
- Feeling disconnected from work and colleagues
- Negativity about job and responsibilities
- Loss of enjoyment in once-pleasurable activities
- Emotional distancing from others

### 3. Inefficacy
- Feeling incompetent or unproductive
- Declining performance
- Difficulty concentrating
- Questioning the value of your work

## Warning Signs of Approaching Burnout

### Early Warning Signs
- Chronic fatigue
- Insomnia
- Forgetfulness and difficulty concentrating
- Physical symptoms (headaches, stomach issues)
- Increased illness
- Loss of appetite or overeating
- Anxiety

### Escalating Signs
- Pessimism and cynicism
- Irritability and anger
- Decreased productivity
- Lack of motivation
- Detachment from relationships
- Neglecting personal needs

### Severe Signs
- Chronic feelings of hopelessness
- Complete exhaustion
- Depression
- Physical and mental breakdown
- Inability to function

## Causes of Burnout

### Work-Related Causes
- Excessive workload
- Lack of control over work
- Unclear expectations
- Poor work-life balance
- Dysfunctional workplace dynamics
- Mismatch in values

### Lifestyle Causes
- Overworking without breaks
- Lack of supportive relationships
- Taking on too many responsibilities
- Not enough sleep
- No time for relaxation

### Personality Traits at Risk
- Perfectionist tendencies
- Pessimistic worldview
- Need for control
- High-achieving personality

## Recovery Strategies

### Immediate Actions
- Acknowledge the problem
- Take time off if possible
- Reassess priorities
- Set clear boundaries
- Seek support

### Long-Term Strategies
**Rediscover Purpose**
- Reflect on what gives you meaning
- Align work with values
- Set meaningful goals

**Establish Boundaries**
- Learn to say no
- Disconnect from work after hours
- Protect personal time

**Prioritize Self-Care**
- Regular exercise
- Adequate sleep
- Healthy nutrition
- Relaxation practices

**Build Support**
- Connect with friends and family
- Find a mentor or coach
- Consider therapy

**Make Work Changes**
- Discuss workload with supervisor
- Seek new opportunities if needed
- Find aspects of work you enjoy

## Prevention Strategies

### Daily Practices
- Take regular breaks throughout the day
- Practice stress management techniques
- Maintain work-life boundaries
- Connect with colleagues

### Weekly Practices
- Schedule time for hobbies
- Exercise regularly
- Rest and recover on weekends
- Spend quality time with loved ones

### Ongoing Practices
- Regular self-assessment
- Professional development
- Career reflection
- Building resilience

## When to Seek Professional Help
- Symptoms persist despite self-care efforts
- Depression or anxiety symptoms
- Physical health is declining
- Relationships are suffering severely
- You feel hopeless

Remember: Burnout is not a personal failure—it's a signal that something needs to change. Recovery is possible with the right support and strategies.
      ''',
      category: ArticleCategory.burnout,
      readTimeMinutes: 11,
      publishedAt: DateTime.now().subtract(const Duration(days: 8)),
      tags: ['burnout', 'stress', 'work-life balance', 'recovery'],
    ),

    // SLEEP SECTION
    Article(
      id: '9',
      title: 'Better Sleep for Better Mental Health',
      summary: 'Discover the powerful connection between sleep and mental wellness, plus practical tips for improving your sleep quality.',
      content: '''
Sleep is not a luxury—it's a fundamental pillar of mental health. Understanding the sleep-mental health connection and implementing good sleep practices can dramatically improve your overall well-being.

## The Sleep-Mental Health Connection

### Why Sleep Matters for Mental Health
- During sleep, your brain processes emotions and consolidates memories
- Sleep deprivation affects mood regulation
- Lack of sleep increases stress hormones
- Poor sleep is linked to anxiety and depression
- Quality sleep enhances resilience and coping ability

### The Sleep Cycle
A complete sleep cycle takes about 90-110 minutes and includes:
- **Stage 1 (N1)**: Light sleep, transition phase
- **Stage 2 (N2)**: Body temperature drops, heart rate slows
- **Stage 3 (N3)**: Deep sleep, physical restoration
- **REM Sleep**: Brain activity increases, dreaming occurs, emotional processing

### How Much Sleep Do You Need?
- Adults (18-64): 7-9 hours
- Older adults (65+): 7-8 hours
- Quality matters as much as quantity

## Signs of Poor Sleep Quality
- Difficulty falling asleep
- Waking frequently during the night
- Waking too early
- Not feeling refreshed after sleep
- Daytime fatigue
- Difficulty concentrating
- Irritability and mood changes

## Sleep Hygiene: Building Better Habits

### Create an Optimal Sleep Environment
**Temperature**
- Keep room cool (60-67°F / 15-19°C)
- Use breathable bedding

**Darkness**
- Use blackout curtains
- Cover electronic lights
- Consider an eye mask

**Quiet**
- Use white noise if needed
- Consider earplugs for noise sensitivity
- Remove or silence electronics

**Comfort**
- Invest in a quality mattress and pillows
- Keep bedding clean and fresh
- Reserve bed for sleep and intimacy only

### Establish a Consistent Schedule
- Wake up at the same time daily (even weekends)
- Go to bed when sleepy but at a consistent time
- Avoid long naps (limit to 20-30 minutes before 3 PM)

### Create a Wind-Down Routine
**1-2 Hours Before Bed**
- Dim the lights in your home
- Stop work and stressful activities
- Avoid difficult conversations

**30-60 Minutes Before Bed**
- Put away electronic devices
- Take a warm bath or shower
- Practice relaxation techniques
- Read a calming book
- Do gentle stretching or yoga

**At Bedtime**
- Practice deep breathing
- Use progressive muscle relaxation
- Try visualization or meditation

### Watch Your Diet
**Avoid Before Bed**
- Caffeine (stop 6 hours before bed)
- Alcohol (disrupts sleep quality)
- Heavy meals (finish eating 2-3 hours before bed)
- Excessive fluids

**Sleep-Promoting Foods**
- Chamomile tea
- Warm milk
- Almonds
- Kiwi
- Tart cherry juice

### Exercise for Better Sleep
- Regular exercise improves sleep quality
- Aim for 30 minutes of moderate exercise daily
- Finish vigorous exercise 3-4 hours before bed
- Gentle yoga or stretching is okay before bed

## Common Sleep Problems and Solutions

### Trouble Falling Asleep
- Don't go to bed until sleepy
- If not asleep in 20 minutes, get up
- Try relaxation techniques
- Reduce evening stimulation

### Waking During the Night
- Keep the room dark
- Avoid looking at the clock
- Practice relaxation if awake
- Evaluate stress levels

### Racing Mind at Bedtime
- Write down worries earlier in the evening
- Practice worry time earlier in the day
- Use guided meditation
- Try the "thought parade" technique

## Technology and Sleep
- Blue light suppresses melatonin
- Set devices to night mode
- Stop screen use 1 hour before bed
- Keep phones out of the bedroom

## When to Seek Help
Consider consulting a professional if you:
- Have trouble sleeping most nights
- Snore loudly or stop breathing during sleep
- Have persistent fatigue despite adequate sleep
- Experience severe insomnia or hypersomnia
- Have symptoms of a sleep disorder

Remember: Improving sleep takes time and consistency. Be patient with yourself and make changes gradually.
      ''',
      category: ArticleCategory.sleep,
      readTimeMinutes: 10,
      publishedAt: DateTime.now().subtract(const Duration(days: 9)),
      tags: ['sleep', 'wellness', 'mental health', 'self-care'],
    ),

    // DEPRESSION SECTION
    Article(
      id: '10',
      title: 'Understanding Depression: Symptoms and Support',
      summary: 'A compassionate guide to understanding depression, recognizing symptoms, and finding paths toward healing and support.',
      content: '''
Depression is one of the most common mental health conditions, affecting millions of people worldwide. Understanding depression is the first step toward healing—for yourself or someone you care about.

## What is Depression?
Depression is more than just feeling sad or going through a difficult time. It's a serious mental health condition that affects how you feel, think, and handle daily activities. Depression is not a weakness or a character flaw—it's a medical condition that responds to treatment.

## Types of Depression

### Major Depressive Disorder
Persistent symptoms for at least two weeks that significantly impact daily life.

### Persistent Depressive Disorder (Dysthymia)
Less severe but long-lasting depression lasting two years or more.

### Seasonal Affective Disorder (SAD)
Depression that occurs during specific seasons, typically winter.

### Postpartum Depression
Depression occurring after childbirth, affecting both mothers and fathers.

### Situational Depression
Triggered by specific life events (grief, job loss, relationship problems).

## Recognizing the Symptoms

### Emotional Symptoms
- Persistent sad, anxious, or empty feelings
- Hopelessness or pessimism
- Irritability and frustration
- Feelings of worthlessness or guilt
- Loss of interest in activities once enjoyed
- Thoughts of death or suicide

### Physical Symptoms
- Fatigue and decreased energy
- Sleep disturbances (insomnia or oversleeping)
- Appetite changes (eating too much or too little)
- Body aches and pains without clear cause
- Slow movement or speech

### Cognitive Symptoms
- Difficulty concentrating and making decisions
- Memory problems
- Negative thinking patterns
- Rumination on past events

### Behavioral Symptoms
- Social withdrawal
- Neglecting responsibilities
- Loss of motivation
- Decreased productivity

## Causes and Risk Factors

### Biological Factors
- Brain chemistry imbalances
- Hormonal changes
- Genetic predisposition
- Medical conditions

### Psychological Factors
- Negative thinking patterns
- Low self-esteem
- History of trauma
- Perfectionism

### Environmental Factors
- Stressful life events
- Lack of social support
- Chronic stress
- Substance use

## Paths to Healing

### Professional Treatment
**Therapy**
- Cognitive-Behavioral Therapy (CBT)
- Interpersonal Therapy
- Psychodynamic Therapy
- Mindfulness-Based Therapy

**Medication**
- Antidepressants (work with a psychiatrist)
- May take 4-6 weeks to feel full effects
- Important to follow treatment plan

**Combination Treatment**
Research shows therapy plus medication is often most effective.

### Self-Help Strategies

**Stay Connected**
- Reach out to trusted friends and family
- Join a support group
- Avoid isolation

**Maintain Routine**
- Set small daily goals
- Stick to regular sleep schedule
- Keep up with basic self-care

**Physical Activity**
- Start with small amounts
- Walking, swimming, yoga
- Even 10 minutes helps

**Nutrition**
- Eat regular, balanced meals
- Limit alcohol and caffeine
- Consider omega-3 fatty acids

**Challenge Negative Thoughts**
- Notice negative thinking patterns
- Question their accuracy
- Replace with balanced thoughts

**Practice Self-Compassion**
- Treat yourself kindly
- Accept that recovery takes time
- Celebrate small victories

## Supporting Someone with Depression

### Do
- Listen without judgment
- Express concern and care
- Offer practical help
- Learn about depression
- Be patient
- Encourage professional help
- Include them in activities (without pressure)

### Don't
- Minimize their experience
- Tell them to "snap out of it"
- Compare to others' problems
- Take their behavior personally
- Give up on them

## Crisis Resources
If you or someone you know is in crisis:
- Call the mental health crisis line: 8335
- Go to your nearest emergency room
- Stay with the person until help arrives

## Hope for Recovery
Depression is highly treatable. With proper support, most people can recover and live fulfilling lives. Recovery is not linear—there may be setbacks, but each step forward matters. You are not alone, and help is available.
      ''',
      category: ArticleCategory.depression,
      readTimeMinutes: 11,
      publishedAt: DateTime.now().subtract(const Duration(days: 10)),
      tags: ['depression', 'mental health', 'support', 'treatment'],
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
