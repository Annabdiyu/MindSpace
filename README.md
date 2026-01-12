# 🧠 MindSpace

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-3.10+-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

**A comprehensive mental health and self-care mobile application**

*Start your mental wellness journey today*

</div>

---

## ✨ Features

### 🎭 Mood Tracking
- Daily mood check-ins with 5-level scale (Great → Awful)
- Track mood triggers and add personal notes
- Visual mood history and insights
- Identify patterns in your emotional well-being

### 📓 Journaling
- Private, secure journal entries
- Automatic date/time stamping
- Search and filter past entries
- Express yourself freely in a safe space

### 🌬️ Breathing Exercises
- Guided breathing sessions
- Multiple breathing patterns (Box breathing, 4-7-8, etc.)
- Visual breathing animations
- Calming audio guidance

### 👥 Community Support
- Anonymous peer support forum
- Share experiences and stories
- React and comment on posts
- Report inappropriate content

### 👨‍⚕️ Professional Help
- Browse verified mental health professionals
- View doctor profiles with ratings & reviews
- Book online or in-person appointments
- Manage upcoming and past appointments

---

## 🛠️ Tech Stack

| Layer | Technology |
|-------|------------|
| **Framework** | Flutter 3.10+ |
| **Language** | Dart |
| **Backend** | Firebase (Auth, Firestore, Storage) |
| **Authentication** | Email/Password, Google Sign-In |
| **State Management** | Provider |
| **Animations** | flutter_animate |
| **Charts** | fl_chart |
| **Typography** | Google Fonts (Poppins) |

---

## 📱 Screenshots

<div align="center">
<i>App features a premium dark theme with teal accent colors for a calming user experience</i>
</div>

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.10+
- Dart SDK 3.0+
- Android Studio / VS Code
- Firebase project

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/mind_space.git
   cd mind_space
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**
   - Create a new project in [Firebase Console](https://console.firebase.google.com)
   - Enable Email/Password and Google authentication
   - Set up Firestore Database
   - Download and add config files:
     - `android/app/google-services.json`
     - `ios/Runner/GoogleService-Info.plist`

4. **Run the app**
   ```bash
   flutter run
   ```

---

## 📂 Project Structure

```
lib/
├── config/
│   ├── routes.dart          # App navigation routes
│   └── theme.dart            # Dark theme & color system
├── models/
│   ├── user_model.dart       # User data model
│   ├── mood_entry.dart       # Mood tracking model
│   ├── journal_entry.dart    # Journal entry model
│   ├── appointment.dart      # Appointment model
│   ├── psychiatrist.dart     # Doctor profile model
│   ├── community_post.dart   # Forum post model
│   └── article.dart          # Knowledge article model
├── screens/
│   ├── auth/                 # Login, Signup, Welcome
│   ├── home/                 # Main home screen
│   ├── mood/                 # Mood check-in & insights
│   ├── journal/              # Journal list & entry
│   ├── breathing/            # Breathing exercises
│   ├── community/            # Peer support forum
│   ├── professional/         # Doctor search & booking
│   └── knowledge/            # Articles & resources
├── services/
│   ├── auth_service.dart     # Authentication logic
│   ├── mood_service.dart     # Mood data operations
│   ├── journal_service.dart  # Journal CRUD
│   ├── appointment_service.dart # Booking management
│   └── community_service.dart # Forum operations
└── main.dart                 # App entry point
```

---

## 🎨 Design System

| Element | Color |
|---------|-------|
| Primary Background | `#0D1B2A` |
| Secondary Background | `#1B2838` |
| Card Background | `#1E3A4C` |
| Accent (Teal) | `#00BFA6` |
| Success | `#4CAF50` |
| Warning | `#FF9800` |
| Error | `#F44336` |

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 📞 Contact

For questions or support, please open an issue or contact the development team.

---

<div align="center">

**Made with 💚 for mental wellness**

</div>
