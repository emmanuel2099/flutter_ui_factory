import 'package:flutter/material.dart';

import '../../flutter_ui_factory.dart';

/// A factory login screen widget with various themes.
class FactoryLoginScreen extends StatefulWidget {
  final String theme;
  final String? logoPath;
  final List<String> socialProviders;
  final Function(String, String)? onLogin;
  final Function()? onForgotPassword;
  final Function()? onSignUp;
  final Color? primaryColor;
  final Color? backgroundColor;

  const FactoryLoginScreen({
    Key? key,
    required this.theme,
    this.logoPath,
    required this.socialProviders,
    this.onLogin,
    this.onForgotPassword,
    this.onSignUp,
    this.primaryColor,
    this.backgroundColor,
  }) : super(key: key);

  @override
  _FactoryLoginScreenState createState() => _FactoryLoginScreenState();
}

class _FactoryLoginScreenState extends State<FactoryLoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _handleLogin() {
    if (widget.onLogin != null) {
      widget.onLogin!(_emailController.text, _passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = widget.primaryColor ?? UIFactoryTheme.primaryColor;
    final backgroundColor =
        widget.backgroundColor ?? UIFactoryTheme.backgroundColor;

    switch (widget.theme.toLowerCase()) {
      case 'social':
        return _buildSocialLoginScreen(primaryColor, backgroundColor);
      case 'image':
        return _buildImageLoginScreen(primaryColor, backgroundColor);
      case 'dark':
        return _buildDarkLoginScreen(primaryColor);
      default:
        return _buildStandardLoginScreen(primaryColor, backgroundColor);
    }
  }

  Widget _buildStandardLoginScreen(Color primaryColor, Color backgroundColor) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (widget.logoPath != null) ...[
                  Image.asset(widget.logoPath!, height: 100),
                  const SizedBox(height: 32),
                ] else ...[
                  Icon(Icons.lock_outline, size: 80, color: primaryColor),
                  const SizedBox(height: 24),
                  Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: UIFactoryTheme.textColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Sign in to continue',
                    style: TextStyle(
                      fontSize: 16,
                      color: UIFactoryTheme.textColor.withOpacity(0.7),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                ],
                _buildEmailField(),
                const SizedBox(height: 16),
                _buildPasswordField(),
                const SizedBox(height: 8),
                _buildForgotPassword(),
                const SizedBox(height: 24),
                _buildLoginButton(primaryColor),
                const SizedBox(height: 24),
                _buildSignUpOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialLoginScreen(Color primaryColor, Color backgroundColor) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (widget.logoPath != null) ...[
                  Image.asset(widget.logoPath!, height: 100),
                  const SizedBox(height: 32),
                ] else ...[
                  Icon(Icons.person_outline, size: 80, color: primaryColor),
                  const SizedBox(height: 24),
                  Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: UIFactoryTheme.textColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
                const SizedBox(height: 32),
                _buildSocialButtons(),
                const SizedBox(height: 24),
                _buildDivider(),
                const SizedBox(height: 24),
                _buildEmailField(),
                const SizedBox(height: 16),
                _buildPasswordField(),
                const SizedBox(height: 8),
                _buildForgotPassword(),
                const SizedBox(height: 24),
                _buildLoginButton(primaryColor),
                const SizedBox(height: 24),
                _buildSignUpOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageLoginScreen(Color primaryColor, Color backgroundColor) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://source.unsplash.com/random/?nature',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.8),
                ],
              ),
            ),
          ),
          // Content
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (widget.logoPath != null) ...[
                      Image.asset(widget.logoPath!, height: 100),
                      const SizedBox(height: 32),
                    ] else ...[
                      const Icon(
                        Icons.lock_outline,
                        size: 80,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Welcome Back',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Sign in to continue',
                        style: TextStyle(fontSize: 16, color: Colors.white70),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                    ],
                    _buildEmailField(isImageTheme: true),
                    const SizedBox(height: 16),
                    _buildPasswordField(isImageTheme: true),
                    const SizedBox(height: 8),
                    _buildForgotPassword(isImageTheme: true),
                    const SizedBox(height: 24),
                    _buildLoginButton(primaryColor),
                    const SizedBox(height: 24),
                    _buildSignUpOption(isImageTheme: true),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDarkLoginScreen(Color primaryColor) {
    final darkBackground = Colors.grey[900]!;
    final cardBackground = Colors.grey[850]!;

    return Scaffold(
      backgroundColor: darkBackground,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (widget.logoPath != null) ...[
                  Image.asset(widget.logoPath!, height: 100),
                  const SizedBox(height: 32),
                ] else ...[
                  Icon(Icons.lock_outline, size: 80, color: primaryColor),
                  const SizedBox(height: 24),
                  const Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Sign in to continue',
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                ],
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: cardBackground,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      _buildEmailField(isDarkTheme: true),
                      const SizedBox(height: 16),
                      _buildPasswordField(isDarkTheme: true),
                      const SizedBox(height: 8),
                      _buildForgotPassword(isDarkTheme: true),
                      const SizedBox(height: 24),
                      _buildLoginButton(primaryColor),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                _buildSignUpOption(isDarkTheme: true),
                const SizedBox(height: 24),
                _buildSocialButtons(isDarkTheme: true),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField({
    bool isDarkTheme = false,
    bool isImageTheme = false,
  }) {
    final textColor =
        isDarkTheme || isImageTheme ? Colors.white : UIFactoryTheme.textColor;
    final fillColor = isDarkTheme
        ? Colors.grey[800]!
        : isImageTheme
            ? Colors.white.withOpacity(0.2)
            : Colors.grey[200]!;

    return TextField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: textColor),
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyle(color: textColor.withOpacity(0.7)),
        prefixIcon: Icon(
          Icons.email_outlined,
          color: textColor.withOpacity(0.7),
        ),
        filled: true,
        fillColor: fillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: UIFactoryTheme.primaryColor, width: 2),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    bool isDarkTheme = false,
    bool isImageTheme = false,
  }) {
    final textColor =
        isDarkTheme || isImageTheme ? Colors.white : UIFactoryTheme.textColor;
    final fillColor = isDarkTheme
        ? Colors.grey[800]!
        : isImageTheme
            ? Colors.white.withOpacity(0.2)
            : Colors.grey[200]!;

    return TextField(
      controller: _passwordController,
      obscureText: _obscurePassword,
      style: TextStyle(color: textColor),
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(color: textColor.withOpacity(0.7)),
        prefixIcon: Icon(Icons.lock_outline, color: textColor.withOpacity(0.7)),
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: textColor.withOpacity(0.7),
          ),
          onPressed: _togglePasswordVisibility,
        ),
        filled: true,
        fillColor: fillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: UIFactoryTheme.primaryColor, width: 2),
        ),
      ),
    );
  }

  Widget _buildForgotPassword({
    bool isDarkTheme = false,
    bool isImageTheme = false,
  }) {
    final textColor = isDarkTheme || isImageTheme
        ? Colors.white70
        : UIFactoryTheme.textColor.withOpacity(0.7);

    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: widget.onForgotPassword,
        child: Text(
          'Forgot Password?',
          style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _buildLoginButton(Color primaryColor) {
    return ElevatedButton(
      onPressed: _handleLogin,
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: const Text(
        'Sign In',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSignUpOption({
    bool isDarkTheme = false,
    bool isImageTheme = false,
  }) {
    final textColor = isDarkTheme || isImageTheme
        ? Colors.white70
        : UIFactoryTheme.textColor.withOpacity(0.7);
    final accentColor = isDarkTheme || isImageTheme
        ? Colors.white
        : UIFactoryTheme.primaryColor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don\'t have an account?', style: TextStyle(color: textColor)),
        TextButton(
          onPressed: widget.onSignUp,
          child: Text(
            'Sign Up',
            style: TextStyle(color: accentColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButtons({bool isDarkTheme = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: widget.socialProviders.map((provider) {
        IconData icon;
        String text;
        Color color;

        switch (provider.toLowerCase()) {
          case 'google':
            icon = Icons.g_mobiledata;
            text = 'Continue with Google';
            color = Colors.red;
            break;
          case 'facebook':
            icon = Icons.facebook;
            text = 'Continue with Facebook';
            color = Colors.blue;
            break;
          case 'apple':
            icon = Icons.apple;
            text = 'Continue with Apple';
            color = isDarkTheme ? Colors.white : Colors.black;
            break;
          case 'twitter':
            icon = Icons.flutter_dash;
            text = 'Continue with Twitter';
            color = Colors.lightBlue;
            break;
          default:
            icon = Icons.account_circle_outlined;
            text = 'Continue with $provider';
            color = Colors.grey;
        }

        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(icon, color: isDarkTheme ? Colors.white : color),
            label: Text(text),
            style: ElevatedButton.styleFrom(
              backgroundColor: isDarkTheme ? Colors.grey[800] : Colors.white,
              foregroundColor: isDarkTheme ? Colors.white : Colors.black87,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: isDarkTheme ? Colors.transparent : Colors.grey[300]!,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: UIFactoryTheme.textColor.withOpacity(0.3),
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'OR',
            style: TextStyle(
              color: UIFactoryTheme.textColor.withOpacity(0.5),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: UIFactoryTheme.textColor.withOpacity(0.3),
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
