# 🛒 A Store – Flutter E-Commerce App

### A full-featured multilingual e‑commerce application built with Flutter, GetX, Firebase Auth & Supabase

---

### 🚀 Demo & Repository

**GitHub:** [amrnabih113/A‑Store](https://github.com/amrnabih113/A-Store.git)

---

## 🔥 Core Features

* 🌍 **Multi‑Language Support**: Fully localized in **English, Arabic (RTL), and German**
* 🔐 **User Authentication**: Sign-in via **Google** or **email/password**, with secure password reset
* 🧑‍💻 **Dynamic User Profile**: Edit username, display name, profile photo, and phone number
* 🔍 **Advanced Search**: Filter products by name, category, or brand
* 🗂 **Categories & Brands**: Structured navigation for smooth browsing
* 🎨 **Product Variants**: Support for multiple sizes/colors, with rich images
* 📩 **Wishlist & Cart**: Save favorite items, manage cart easily, and checkout
* 🚚 **Multi-Address Support**: Save multiple shipping addresses per user
* 💳 **Secure Payment Gateway Integration**
* 📦 **Order History & Tracking**: View past and current orders seamlessly
* 🌗 **Theming Options**: Switch between dark, light, or system theme
* 🎥 **Onboarding Animations**: Smooth onboarding experience for first-time users

---

## 🛠️ Tech Stack

| Layer         | Tools & Technologies                         |
| ------------- | -------------------------------------------- |
| UI & Frontend | Flutter, GetX State Management               |
| Auth          | Firebase Authentication (Google, Email)      |
| Backend       | Supabase (Database + Storage)                |
| Localization  | Arabic (RTL), English, German                |
| UI/UX         | Animations, Light & Dark Mode                |
| Architecture  | Modular Flutter architecture powered by GetX |

---


## 🧑‍💻 Getting Started

```bash
git clone https://github.com/amrnabih113/A-Store.git
cd A-Store
flutter pub get
flutter run
```

### Environment Setup

* Create a `.env` file with Supabase credentials and Firebase config
* Enable Firebase Authentication (Google + Email/Password)
* Set up Supabase project for product & user data and storage buckets

---

## 📅 Project Structure

```
lib/
├── controllers/           # GetX controllers for logic & state
├── models/                # Data models (Product, User, Address, Order)
├── services/              # Firebase + Supabase wrappers
├── views/                 # Screens & pages (Home, Checkout, Profile, etc.)
├── widgets/               # Reusable components (cards, search bar, theming toggle)
├── localization/          # JSON translation files (en.json, ar.json, de.json)
└── main.dart
```

---

## 🌐 Localization

* Right-to-left layout support for **Arabic**
* Seamless switching between **English**, **Arabic**, and **German**
* All UI text stored in localization JSONs

---

## 📊 Highlights at a Glance

| Feature            | Highlights                                              |
| ------------------ | ------------------------------------------------------- |
| Multi-language     | English, Arabic (RTL), German                           |
| User Profiles      | Editable profile details & secure login                 |
| Product Experience | Variants, search, categories, wishlist, and detailed UI |
| Checkout & Orders  | Multi-address, payment integration, and tracking        |
| User Experience    | Onboarding flow, dark/light themes, animations          |

---

## 🤝 Contributions & Credits

Thanks to **Flutter**, **GetX**, **Firebase**, and **Supabase** communities.
Big shout-out to translators and UI/UX testers.

---

## 📞 Contact

**Amr Mohamed Nabih**

* Gmail: `amrnabih113@gmail.com` or `amrnabih112@gmail.com`
* LinkedIn: [amr-nabih112](https://www.linkedin.com/in/amr-nabih112/)
* Discord: `amrnabih.`

---

## ⭐ Support

If you enjoyed **A Store**, please **star ⭐ the repo** and share it with others.
Your feedback and contributions are welcome and appreciated.

> Building global shopping experiences with Flutter, one store at a time.
