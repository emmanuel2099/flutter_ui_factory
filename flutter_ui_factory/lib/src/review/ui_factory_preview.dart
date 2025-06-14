import 'package:flutter/material.dart';

import '../../flutter_ui_factory.dart';

class UIFactory {
  static Widget getButton({
    required String style,
    required String text,
    required IconData icon,
    required VoidCallback onPressed,
    Color? color,
    Color? textColor,
  }) {
    // Implement your button styles here
    return ElevatedButton.icon(
      icon: Icon(icon),
      label: Text(text),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor ?? Colors.white,
        backgroundColor: color ?? UIFactoryTheme.primaryColor,
      ),
    );
  }

  static Widget getCard({
    required String style,
    required Widget child,
    double? width,
    double? height,
    bool animated = false,
    Color? color,
  }) {
    // Implement your card styles here
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }

  static PreferredSizeWidget getAppBar({
    required String theme,
    required String title,
    List<Widget> actions = const [],
    Color? primaryColor,
    Color? backgroundColor,
  }) {
    // Implement your app bar styles here
    return AppBar(
      title: Text(title),
      backgroundColor: primaryColor ?? UIFactoryTheme.primaryColor,
      actions: actions,
    );
  }

  static Widget getLoginScreen({
    required String theme,
    required Function(String, String) onLogin,
    required Function() onForgotPassword,
    required Function() onSignUp,
    Color? primaryColor,
    Color? backgroundColor,
  }) {
    // Implement your login screen here
    return Container(
      color: backgroundColor ?? UIFactoryTheme.backgroundColor,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Login Screen ($theme theme)',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          const SizedBox(height: 10),
          TextField(
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => onLogin('email', 'password'),
            child: const Text('Login'),
          ),
          TextButton(
            onPressed: onForgotPassword,
            child: const Text('Forgot Password?'),
          ),
          TextButton(
            onPressed: onSignUp,
            child: const Text('Create Account'),
          ),
        ],
      ),
    );
  }

  static Widget getSignupScreen({
    required String theme,
    required Function(String, String, String) onSignup,
    required Function() onLogin,
    Color? primaryColor,
    Color? backgroundColor,
  }) {
    // Implement your signup screen here
    return Container(
      color: backgroundColor ?? UIFactoryTheme.backgroundColor,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Signup Screen ($theme theme)',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          const SizedBox(height: 10),
          TextField(
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          const SizedBox(height: 10),
          TextField(
            decoration: const InputDecoration(labelText: 'Confirm Password'),
            obscureText: true,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => onSignup('email', 'password', 'confirmPassword'),
            child: const Text('Sign Up'),
          ),
          TextButton(
            onPressed: onLogin,
            child: const Text('Already have an account? Login'),
          ),
        ],
      ),
    );
  }

  static Widget getDashboard({
    required String type,
    required String userName,
    required Map<String, dynamic> data,
    List<Widget> widgets = const [],
    Color? primaryColor,
    Color? backgroundColor,
  }) {
    // Implement your dashboard here
    return Container(
      color: backgroundColor ?? UIFactoryTheme.backgroundColor,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            '$type Dashboard',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text('Welcome, $userName'),
          const SizedBox(height: 20),
          Text('Data: ${data.toString()}'),
          ...widgets,
        ],
      ),
    );
  }
}
