# Grower Tracker App

A full-stack Serverpod application featuring two front-ends: a Flutter mobile app and a Telegram Messenger app integration via Telegram bot.

*Designed for setting up houseplant watering reminders in an effortless and convenient way.*

2 mins demo video here: [![YouTube demo](https://shields.io)](https://youtu.be/BL1i25G5mjI)

---

## Overview & Problem Statement

Delivering critical reminders to users in the most convenient way possible with minimal friction. For quick onboarding and evaluation, users can access core app features directly inside their already-installed Telegram client.

---

## Technical Architecture & Setup

* **Serverpod (v3.4.13 / v3.4.14)**: Backend framework providing out-of-the-box infrastructure, APIs, and data modeling.
* **Flutter (v3.38.10)**: Cross-platform UI toolkit and frontend layer.
* **Televerse (v3.1.2)**: Dart library for Telegram Bot API integration and Webhook handling.

> **Note on Compatibility:** Serverpod v3.4.14 / Flutter 3.38.10 is used to maintain full compatibility with legacy development environments (e.g., macOS versions prior to macOS 14).

### Deployment & Configuration Notes
* **Bot Modes**: Supports both `Long Polling` and `Webhook` (recommended for production). 
* **Local Development**: Supports `webhookDev` for testing without Long Polling (requires tunneling services like `ngrok`).
* **Environment Variables**: Add your `telegramToken` (obtained via [@BotFather](https://t.me/BotFather)) to your environment config files.

---

## Application Flow

Full functionality relies on both platforms: the mobile app and Telegram. Users link their Telegram account to their app profile through the Telegram bot. Watering notifications are enabled only after explicit confirmation and account association.

### User Journey & Setup Steps

1. **Telegram Initialization**:
   - Find the Telegram bot and click **Start**.
   - The bot retrieves the user's `chat_id`, grants sending permissions, and persists user record details into the database.

2. **Mobile Application**:
   Logged-in users navigate through 3 core screens:
   - **Telegram Users List**: Manage connected messenger accounts.
   - **Garden**: Create, edit, and maintain your plant collection.
   - **Settings**: Schedule automated tasks and customize notification delivery via Telegram.

> **Important**: Notifications will remain disabled until a Telegram account is successfully bound.
