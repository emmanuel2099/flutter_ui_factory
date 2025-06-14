import 'package:flutter/material.dart';
import 'package:flutter_ui_factory/src/screens/complete_screen.dart';
import 'package:flutter_ui_factory/src/texts/text.dart';

import 'buttons/button.dart';
import 'card/card.dart';
import 'navigations/curved_navigation.dart';

/// The Ultimate UI Factory - Create ANY screen without Figma!
///
/// This class generates complete, production-ready screens instantly.
class UIFactory {
  // ==================== COMPLETE SCREENS ====================

  /// Creates a complete app screen with everything included
  /// NO FIGMA NEEDED - Just specify the type and get a full screen!
  static Widget createCompleteScreen({
    required String screenType,
    Map<String, dynamic>? data,
    Map<String, Function>? callbacks,
    String? theme,
    Color? primaryColor,
    Color? backgroundColor,
    bool includeAppBar = true,
    bool includeBottomNav = true,
    bool includeFloatingButton = false,
    List<String>? features,
  }) {
    return CompleteScreenFactory.buildScreen(
      screenType: screenType,
      data: data ?? {},
      callbacks: callbacks ?? {},
      theme: theme ?? 'modern',
      primaryColor: primaryColor,
      backgroundColor: backgroundColor,
      includeAppBar: includeAppBar,
      includeBottomNav: includeBottomNav,
      includeFloatingButton: includeFloatingButton,
      features: features ?? [],
    );
  }

  /// Creates a complete app with multiple screens and navigation
  static Widget createCompleteApp({
    required List<AppScreen> screens,
    String? theme,
    Color? primaryColor,
    String? navigationStyle,
    Map<String, dynamic>? globalData,
  }) {
    return CompleteAppFactory.buildApp(
      theme: theme ?? 'modern',
      primaryColor: primaryColor,
      navigationStyle: navigationStyle ?? 'curved',
      globalData: globalData ?? {},
      screens: [],
    );
  }

  // ==================== BUSINESS SCREENS ====================

  /// E-commerce screens - Complete online store
  static Widget createEcommerceScreen({
    String type = 'home', // home, product, cart, checkout, orders
    Map<String, dynamic>? data,
    String? theme,
  }) {
    return createCompleteScreen(
      screenType: 'ecommerce_$type',
      data: data,
      theme: theme,
      features: ['search', 'cart', 'wishlist', 'filters', 'reviews'],
    );
  }

  /// Social media screens - Complete social app
  static Widget createSocialScreen({
    String type = 'feed', // feed, profile, chat, stories, explore
    Map<String, dynamic>? data,
    String? theme,
  }) {
    return createCompleteScreen(
      screenType: 'social_$type',
      data: data,
      theme: theme,
      features: ['like', 'comment', 'share', 'follow', 'notifications'],
    );
  }

  /// Banking/Finance screens - Complete fintech app
  static Widget createFinanceScreen({
    String type = 'dashboard', // dashboard, transfer, cards, analytics, loans
    Map<String, dynamic>? data,
    String? theme,
  }) {
    return createCompleteScreen(
      screenType: 'finance_$type',
      data: data,
      theme: theme,
      features: ['transactions', 'charts', 'security', 'notifications'],
    );
  }

  /// Healthcare screens - Complete medical app
  static Widget createHealthcareScreen({
    String type =
        'dashboard', // dashboard, appointments, records, doctors, pharmacy
    Map<String, dynamic>? data,
    String? theme,
  }) {
    return createCompleteScreen(
      screenType: 'healthcare_$type',
      data: data,
      theme: theme,
      features: ['appointments', 'prescriptions', 'reports', 'emergency'],
    );
  }

  /// Education screens - Complete learning app
  static Widget createEducationScreen({
    String type =
        'courses', // courses, lessons, progress, certificates, library
    Map<String, dynamic>? data,
    String? theme,
  }) {
    return createCompleteScreen(
      screenType: 'education_$type',
      data: data,
      theme: theme,
      features: ['video_player', 'quiz', 'progress_tracking', 'certificates'],
    );
  }

  /// Food delivery screens - Complete food app
  static Widget createFoodScreen({
    String type = 'restaurants', // restaurants, menu, cart, orders, tracking
    Map<String, dynamic>? data,
    String? theme,
  }) {
    return createCompleteScreen(
      screenType: 'food_$type',
      data: data,
      theme: theme,
      features: ['search', 'filters', 'cart', 'tracking', 'reviews'],
    );
  }

  /// Travel screens - Complete travel app
  static Widget createTravelScreen({
    String type = 'explore', // explore, bookings, trips, hotels, flights
    Map<String, dynamic>? data,
    String? theme,
  }) {
    return createCompleteScreen(
      screenType: 'travel_$type',
      data: data,
      theme: theme,
      features: ['maps', 'booking', 'calendar', 'weather', 'reviews'],
    );
  }

  /// Real Estate screens - Complete property app
  static Widget createRealEstateScreen({
    String type = 'listings', // listings, property, search, favorites, agents
    Map<String, dynamic>? data,
    String? theme,
  }) {
    return createCompleteScreen(
      screenType: 'realestate_$type',
      data: data,
      theme: theme,
      features: ['maps', 'filters', 'gallery', 'calculator', 'contact'],
    );
  }

  /// Fitness screens - Complete workout app
  static Widget createFitnessScreen({
    String type =
        'workouts', // workouts, progress, nutrition, challenges, social
    Map<String, dynamic>? data,
    String? theme,
  }) {
    return createCompleteScreen(
      screenType: 'fitness_$type',
      data: data,
      theme: theme,
      features: ['timer', 'tracking', 'charts', 'challenges', 'social'],
    );
  }

  /// Music/Entertainment screens - Complete media app
  static Widget createMusicScreen({
    String type = 'player', // player, library, playlists, discover, radio
    Map<String, dynamic>? data,
    String? theme,
  }) {
    return createCompleteScreen(
      screenType: 'music_$type',
      data: data,
      theme: theme,
      features: ['player', 'playlists', 'search', 'recommendations', 'offline'],
    );
  }

  // ==================== UTILITY SCREENS ====================

  /// Authentication flow - Complete auth system
  static Widget createAuthScreen({
    String type = 'login', // login, signup, forgot, otp, onboarding
    Map<String, dynamic>? data,
    String? theme,
  }) {
    return createCompleteScreen(
      screenType: 'auth_$type',
      data: data,
      theme: theme,
      features: ['social_login', 'biometric', 'validation', 'security'],
    );
  }

  /// Profile screens - Complete user management
  static Widget createProfileScreen({
    String type = 'view', // view, edit, settings, security, preferences
    Map<String, dynamic>? data,
    String? theme,
  }) {
    return createCompleteScreen(
      screenType: 'profile_$type',
      data: data,
      theme: theme,
      features: ['avatar', 'edit', 'security', 'preferences', 'logout'],
    );
  }

  /// Chat/Messaging screens - Complete communication
  static Widget createChatScreen({
    String type = 'list', // list, conversation, group, calls, status
    Map<String, dynamic>? data,
    String? theme,
  }) {
    return createCompleteScreen(
      screenType: 'chat_$type',
      data: data,
      theme: theme,
      features: ['typing', 'media', 'emoji', 'voice', 'video_call'],
    );
  }

  /// Settings screens - Complete app configuration
  static Widget createSettingsScreen({
    String type = 'main', // main, account, privacy, notifications, about
    Map<String, dynamic>? data,
    String? theme,
  }) {
    return createCompleteScreen(
      screenType: 'settings_$type',
      data: data,
      theme: theme,
      features: ['toggle', 'slider', 'picker', 'navigation', 'search'],
    );
  }

  // ==================== SPECIALIZED SCREENS ====================

  /// News/Blog screens - Complete content app
  static Widget createNewsScreen({
    String type = 'feed', // feed, article, categories, search, bookmarks
    Map<String, dynamic>? data,
    String? theme,
  }) {
    return createCompleteScreen(
      screenType: 'news_$type',
      data: data,
      theme: theme,
      features: ['categories', 'search', 'bookmarks', 'share', 'offline'],
    );
  }

  /// Weather screens - Complete weather app
  static Widget createWeatherScreen({
    String type = 'current', // current, forecast, maps, alerts, locations
    Map<String, dynamic>? data,
    String? theme,
  }) {
    return createCompleteScreen(
      screenType: 'weather_$type',
      data: data,
      theme: theme,
      features: ['forecast', 'maps', 'alerts', 'locations', 'widgets'],
    );
  }

  /// Calendar/Events screens - Complete scheduling app
  static Widget createCalendarScreen({
    String type = 'month', // month, week, day, events, reminders
    Map<String, dynamic>? data,
    String? theme,
  }) {
    return createCompleteScreen(
      screenType: 'calendar_$type',
      data: data,
      theme: theme,
      features: ['events', 'reminders', 'sync', 'sharing', 'notifications'],
    );
  }

  /// Photo/Gallery screens - Complete media management
  static Widget createGalleryScreen({
    String type = 'grid', // grid, album, editor, camera, sharing
    Map<String, dynamic>? data,
    String? theme,
  }) {
    return createCompleteScreen(
      screenType: 'gallery_$type',
      data: data,
      theme: theme,
      features: ['editor', 'filters', 'sharing', 'albums', 'cloud_sync'],
    );
  }

  /// Task/Productivity screens - Complete productivity suite
  static Widget createProductivityScreen({
    String type = 'tasks', // tasks, projects, calendar, notes, team
    Map<String, dynamic>? data,
    String? theme,
  }) {
    return createCompleteScreen(
      screenType: 'productivity_$type',
      data: data,
      theme: theme,
      features: [
        'tasks',
        'projects',
        'collaboration',
        'time_tracking',
        'reports',
      ],
    );
  }

  // ==================== COMPONENT GENERATORS ====================

  /// Creates a customizable button
  static Widget getButton({
    required String style,
    String? text,
    IconData? icon,
    VoidCallback? onPressed,
    Color? color,
    double? width,
    double? height,
    bool rounded = true,
    bool elevated = true,
    bool animated = true,
  }) {
    return FactoryButton(
      style: style,
      text: text ?? 'Button',
      icon: icon,
      onPressed: onPressed,
      color: color,
      width: width,
      height: height,
      rounded: rounded,
      elevated: elevated,
      animated: animated,
    );
  }

  /// Creates a card with multiple style options
  static Widget getCard({
    required String style,
    Widget? child,
    Color? color,
    double? width,
    double? height,
    bool rounded = true,
    bool elevated = true,
    bool animated = false,
    EdgeInsetsGeometry? padding,
  }) {
    return FactoryCard(
      style: style,
      child: child ?? const SizedBox(),
      color: color,
      width: width,
      height: height,
      rounded: rounded,
      elevated: elevated,
      animated: animated,
      padding: padding,
    );
  }

  /// Creates a curved navigation bar
  static Widget getCurvedNavigation({
    required String style,
    required List<FactoryNavItem> items,
    int currentIndex = 0,
    Function(int)? onTap,
    Color? backgroundColor,
    Color? selectedColor,
    Color? unselectedColor,
    double height = 70,
    bool showLabels = true,
    bool animated = true,
  }) {
    return FactoryCurvedNavigation(
      style: style,
      items: items,
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: backgroundColor,
      selectedColor: selectedColor,
      unselectedColor: unselectedColor,
      height: height,
      showLabels: showLabels,
      animated: animated,
    );
  }

  /// Creates text with various styling options
  static Widget getText({
    required String text,
    String style = 'default',
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    int? maxLines,
    bool animated = false,
    Duration animationDuration = const Duration(milliseconds: 500),
    List<Color>? gradientColors,
    bool responsive = true,
  }) {
    return FactoryText(
      text: text,
      style: style,
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      textAlign: textAlign,
      maxLines: maxLines,
      animated: animated,
      animationDuration: animationDuration,
      gradientColors: gradientColors,
      responsive: responsive,
    );
  }
}

/// App Screen Configuration
class AppScreen {
  final String type;
  final String title;
  final IconData icon;
  final Map<String, dynamic> data;
  final Map<String, Function> callbacks;

  AppScreen({
    required this.type,
    required this.title,
    required this.icon,
    this.data = const {},
    this.callbacks = const {},
  });
}
