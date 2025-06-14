import 'package:flutter/material.dart';

import '../../flutter_ui_factory.dart';

/// A factory signup screen widget with various themes.
class FactorySignupScreen extends StatefulWidget {
  final String theme;
  final String? logoPath;
  final List<String> socialProviders;
  final Function(String, String, String)?
      onSignup; // email, password, confirmPassword
  final Function()? onLogin;
  final Function()? onTermsPressed;
  final Function()? onPrivacyPressed;
  final Color? primaryColor;
  final Color? backgroundColor;
  final bool requireTermsAcceptance;
  final List<String> requiredFields;

  const FactorySignupScreen({
    Key? key,
    required this.theme,
    this.logoPath,
    required this.socialProviders,
    this.onSignup,
    this.onLogin,
    this.onTermsPressed,
    this.onPrivacyPressed,
    this.primaryColor,
    this.backgroundColor,
    this.requireTermsAcceptance = true,
    this.requiredFields = const ['email', 'password', 'confirmPassword'],
  }) : super(key: key);

  @override
  _FactorySignupScreenState createState() => _FactorySignupScreenState();
}

class _FactorySignupScreenState extends State<FactorySignupScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _acceptTerms = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

  void _toggleTermsAcceptance() {
    setState(() {
      _acceptTerms = !_acceptTerms;
    });
  }

  bool _validateForm() {
    if (widget.requiredFields.contains('email') &&
        _emailController.text.isEmpty) {
      _showSnackBar('Please enter your email');
      return false;
    }

    if (widget.requiredFields.contains('password') &&
        _passwordController.text.isEmpty) {
      _showSnackBar('Please enter a password');
      return false;
    }

    if (widget.requiredFields.contains('confirmPassword') &&
        _confirmPasswordController.text != _passwordController.text) {
      _showSnackBar('Passwords do not match');
      return false;
    }

    if (widget.requireTermsAcceptance && !_acceptTerms) {
      _showSnackBar('Please accept the terms and conditions');
      return false;
    }

    return true;
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  void _handleSignup() async {
    if (!_validateForm()) return;

    setState(() {
      _isLoading = true;
    });

    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    if (widget.onSignup != null) {
      widget.onSignup!(
        _emailController.text,
        _passwordController.text,
        _confirmPasswordController.text,
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = widget.primaryColor ?? UIFactoryTheme.primaryColor;
    final backgroundColor =
        widget.backgroundColor ?? UIFactoryTheme.backgroundColor;

    switch (widget.theme.toLowerCase()) {
      case 'social':
        return _buildSocialSignupScreen(primaryColor, backgroundColor);
      case 'image':
        return _buildImageSignupScreen(primaryColor, backgroundColor);
      case 'dark':
        return _buildDarkSignupScreen(primaryColor);
      case 'minimal':
        return _buildMinimalSignupScreen(primaryColor, backgroundColor);
      case 'professional':
        return _buildProfessionalSignupScreen(primaryColor, backgroundColor);
      default:
        return _buildStandardSignupScreen(primaryColor, backgroundColor);
    }
  }

  Widget _buildStandardSignupScreen(Color primaryColor, Color backgroundColor) {
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
                  Image.asset(widget.logoPath!, height: 80),
                  const SizedBox(height: 24),
                ] else ...[
                  Icon(
                    Icons.person_add_outlined,
                    size: 80,
                    color: primaryColor,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: UIFactoryTheme.textColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Join us today',
                    style: TextStyle(
                      fontSize: 16,
                      color: UIFactoryTheme.textColor.withOpacity(0.7),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                ],
                Row(
                  children: [
                    Expanded(child: _buildFirstNameField()),
                    const SizedBox(width: 16),
                    Expanded(child: _buildLastNameField()),
                  ],
                ),
                const SizedBox(height: 16),
                _buildEmailField(),
                const SizedBox(height: 16),
                _buildPhoneField(),
                const SizedBox(height: 16),
                _buildPasswordField(),
                const SizedBox(height: 16),
                _buildConfirmPasswordField(),
                const SizedBox(height: 16),
                if (widget.requireTermsAcceptance) ...[
                  _buildTermsCheckbox(),
                  const SizedBox(height: 24),
                ],
                _buildSignupButton(primaryColor),
                const SizedBox(height: 24),
                _buildLoginOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialSignupScreen(Color primaryColor, Color backgroundColor) {
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
                  Image.asset(widget.logoPath!, height: 80),
                  const SizedBox(height: 24),
                ] else ...[
                  Icon(
                    Icons.person_add_outlined,
                    size: 80,
                    color: primaryColor,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Sign Up',
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
                const SizedBox(height: 16),
                _buildConfirmPasswordField(),
                const SizedBox(height: 16),
                if (widget.requireTermsAcceptance) ...[
                  _buildTermsCheckbox(),
                  const SizedBox(height: 24),
                ],
                _buildSignupButton(primaryColor),
                const SizedBox(height: 24),
                _buildLoginOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageSignupScreen(Color primaryColor, Color backgroundColor) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://source.unsplash.com/random/?technology',
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
                      Image.asset(widget.logoPath!, height: 80),
                      const SizedBox(height: 24),
                    ] else ...[
                      const Icon(
                        Icons.person_add_outlined,
                        size: 80,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Join Us',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Create your account',
                        style: TextStyle(fontSize: 16, color: Colors.white70),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                    ],
                    _buildEmailField(isImageTheme: true),
                    const SizedBox(height: 16),
                    _buildPasswordField(isImageTheme: true),
                    const SizedBox(height: 16),
                    _buildConfirmPasswordField(isImageTheme: true),
                    const SizedBox(height: 16),
                    if (widget.requireTermsAcceptance) ...[
                      _buildTermsCheckbox(isImageTheme: true),
                      const SizedBox(height: 24),
                    ],
                    _buildSignupButton(primaryColor),
                    const SizedBox(height: 24),
                    _buildLoginOption(isImageTheme: true),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDarkSignupScreen(Color primaryColor) {
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
                  Image.asset(widget.logoPath!, height: 80),
                  const SizedBox(height: 24),
                ] else ...[
                  Icon(
                    Icons.person_add_outlined,
                    size: 80,
                    color: primaryColor,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Join our community',
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
                      Row(
                        children: [
                          Expanded(
                            child: _buildFirstNameField(isDarkTheme: true),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildLastNameField(isDarkTheme: true),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _buildEmailField(isDarkTheme: true),
                      const SizedBox(height: 16),
                      _buildPasswordField(isDarkTheme: true),
                      const SizedBox(height: 16),
                      _buildConfirmPasswordField(isDarkTheme: true),
                      const SizedBox(height: 16),
                      if (widget.requireTermsAcceptance) ...[
                        _buildTermsCheckbox(isDarkTheme: true),
                        const SizedBox(height: 24),
                      ],
                      _buildSignupButton(primaryColor),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                _buildLoginOption(isDarkTheme: true),
                const SizedBox(height: 24),
                _buildSocialButtons(isDarkTheme: true),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMinimalSignupScreen(Color primaryColor, Color backgroundColor) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w300,
                  color: UIFactoryTheme.textColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              _buildEmailField(isMinimal: true),
              const SizedBox(height: 24),
              _buildPasswordField(isMinimal: true),
              const SizedBox(height: 24),
              _buildConfirmPasswordField(isMinimal: true),
              const SizedBox(height: 32),
              _buildSignupButton(primaryColor, isMinimal: true),
              const Spacer(),
              _buildLoginOption(isMinimal: true),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfessionalSignupScreen(
    Color primaryColor,
    Color backgroundColor,
  ) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: UIFactoryTheme.textColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create your account',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: UIFactoryTheme.textColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Please fill in the information below',
                style: TextStyle(
                  fontSize: 16,
                  color: UIFactoryTheme.textColor.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: _buildFirstNameField(isProfessional: true),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildLastNameField(isProfessional: true),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      _buildEmailField(isProfessional: true),
                      const SizedBox(height: 20),
                      _buildPhoneField(isProfessional: true),
                      const SizedBox(height: 20),
                      _buildPasswordField(isProfessional: true),
                      const SizedBox(height: 20),
                      _buildConfirmPasswordField(isProfessional: true),
                      const SizedBox(height: 20),
                      if (widget.requireTermsAcceptance) ...[
                        _buildTermsCheckbox(isProfessional: true),
                        const SizedBox(height: 32),
                      ],
                      _buildSignupButton(primaryColor, isProfessional: true),
                      const SizedBox(height: 24),
                      _buildLoginOption(isProfessional: true),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFirstNameField({
    bool isDarkTheme = false,
    bool isImageTheme = false,
    bool isMinimal = false,
    bool isProfessional = false,
  }) {
    final textColor =
        isDarkTheme || isImageTheme ? Colors.white : UIFactoryTheme.textColor;
    final fillColor = isDarkTheme
        ? Colors.grey[800]!
        : isImageTheme
            ? Colors.white.withOpacity(0.2)
            : isMinimal
                ? Colors.transparent
                : Colors.grey[200]!;

    return TextField(
      controller: _firstNameController,
      style: TextStyle(color: textColor),
      decoration: InputDecoration(
        labelText: 'First Name',
        labelStyle: TextStyle(color: textColor.withOpacity(0.7)),
        prefixIcon: isProfessional
            ? Icon(Icons.person_outline, color: textColor.withOpacity(0.7))
            : null,
        filled: !isMinimal,
        fillColor: fillColor,
        border: isMinimal
            ? UnderlineInputBorder(
                borderSide: BorderSide(color: textColor.withOpacity(0.3)),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(isProfessional ? 8 : 12),
                borderSide: isProfessional
                    ? BorderSide(color: Colors.grey[300]!)
                    : BorderSide.none,
              ),
        enabledBorder: isMinimal
            ? UnderlineInputBorder(
                borderSide: BorderSide(color: textColor.withOpacity(0.3)),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(isProfessional ? 8 : 12),
                borderSide: isProfessional
                    ? BorderSide(color: Colors.grey[300]!)
                    : BorderSide.none,
              ),
        focusedBorder: isMinimal
            ? UnderlineInputBorder(
                borderSide: BorderSide(
                  color: UIFactoryTheme.primaryColor,
                  width: 2,
                ),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(isProfessional ? 8 : 12),
                borderSide: BorderSide(
                  color: UIFactoryTheme.primaryColor,
                  width: 2,
                ),
              ),
      ),
    );
  }

  Widget _buildLastNameField({
    bool isDarkTheme = false,
    bool isImageTheme = false,
    bool isMinimal = false,
    bool isProfessional = false,
  }) {
    final textColor =
        isDarkTheme || isImageTheme ? Colors.white : UIFactoryTheme.textColor;
    final fillColor = isDarkTheme
        ? Colors.grey[800]!
        : isImageTheme
            ? Colors.white.withOpacity(0.2)
            : isMinimal
                ? Colors.transparent
                : Colors.grey[200]!;

    return TextField(
      controller: _lastNameController,
      style: TextStyle(color: textColor),
      decoration: InputDecoration(
        labelText: 'Last Name',
        labelStyle: TextStyle(color: textColor.withOpacity(0.7)),
        prefixIcon: isProfessional
            ? Icon(Icons.person_outline, color: textColor.withOpacity(0.7))
            : null,
        filled: !isMinimal,
        fillColor: fillColor,
        border: isMinimal
            ? UnderlineInputBorder(
                borderSide: BorderSide(color: textColor.withOpacity(0.3)),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(isProfessional ? 8 : 12),
                borderSide: isProfessional
                    ? BorderSide(color: Colors.grey[300]!)
                    : BorderSide.none,
              ),
        enabledBorder: isMinimal
            ? UnderlineInputBorder(
                borderSide: BorderSide(color: textColor.withOpacity(0.3)),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(isProfessional ? 8 : 12),
                borderSide: isProfessional
                    ? BorderSide(color: Colors.grey[300]!)
                    : BorderSide.none,
              ),
        focusedBorder: isMinimal
            ? UnderlineInputBorder(
                borderSide: BorderSide(
                  color: UIFactoryTheme.primaryColor,
                  width: 2,
                ),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(isProfessional ? 8 : 12),
                borderSide: BorderSide(
                  color: UIFactoryTheme.primaryColor,
                  width: 2,
                ),
              ),
      ),
    );
  }

  Widget _buildEmailField({
    bool isDarkTheme = false,
    bool isImageTheme = false,
    bool isMinimal = false,
    bool isProfessional = false,
  }) {
    final textColor =
        isDarkTheme || isImageTheme ? Colors.white : UIFactoryTheme.textColor;
    final fillColor = isDarkTheme
        ? Colors.grey[800]!
        : isImageTheme
            ? Colors.white.withOpacity(0.2)
            : isMinimal
                ? Colors.transparent
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
        filled: !isMinimal,
        fillColor: fillColor,
        border: isMinimal
            ? UnderlineInputBorder(
                borderSide: BorderSide(color: textColor.withOpacity(0.3)),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(isProfessional ? 8 : 12),
                borderSide: isProfessional
                    ? BorderSide(color: Colors.grey[300]!)
                    : BorderSide.none,
              ),
        enabledBorder: isMinimal
            ? UnderlineInputBorder(
                borderSide: BorderSide(color: textColor.withOpacity(0.3)),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(isProfessional ? 8 : 12),
                borderSide: isProfessional
                    ? BorderSide(color: Colors.grey[300]!)
                    : BorderSide.none,
              ),
        focusedBorder: isMinimal
            ? UnderlineInputBorder(
                borderSide: BorderSide(
                  color: UIFactoryTheme.primaryColor,
                  width: 2,
                ),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(isProfessional ? 8 : 12),
                borderSide: BorderSide(
                  color: UIFactoryTheme.primaryColor,
                  width: 2,
                ),
              ),
      ),
    );
  }

  Widget _buildPhoneField({
    bool isDarkTheme = false,
    bool isImageTheme = false,
    bool isMinimal = false,
    bool isProfessional = false,
  }) {
    final textColor =
        isDarkTheme || isImageTheme ? Colors.white : UIFactoryTheme.textColor;
    final fillColor = isDarkTheme
        ? Colors.grey[800]!
        : isImageTheme
            ? Colors.white.withOpacity(0.2)
            : isMinimal
                ? Colors.transparent
                : Colors.grey[200]!;

    return TextField(
      controller: _phoneController,
      keyboardType: TextInputType.phone,
      style: TextStyle(color: textColor),
      decoration: InputDecoration(
        labelText: 'Phone Number (Optional)',
        labelStyle: TextStyle(color: textColor.withOpacity(0.7)),
        prefixIcon: Icon(
          Icons.phone_outlined,
          color: textColor.withOpacity(0.7),
        ),
        filled: !isMinimal,
        fillColor: fillColor,
        border: isMinimal
            ? UnderlineInputBorder(
                borderSide: BorderSide(color: textColor.withOpacity(0.3)),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(isProfessional ? 8 : 12),
                borderSide: isProfessional
                    ? BorderSide(color: Colors.grey[300]!)
                    : BorderSide.none,
              ),
        enabledBorder: isMinimal
            ? UnderlineInputBorder(
                borderSide: BorderSide(color: textColor.withOpacity(0.3)),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(isProfessional ? 8 : 12),
                borderSide: isProfessional
                    ? BorderSide(color: Colors.grey[300]!)
                    : BorderSide.none,
              ),
        focusedBorder: isMinimal
            ? UnderlineInputBorder(
                borderSide: BorderSide(
                  color: UIFactoryTheme.primaryColor,
                  width: 2,
                ),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(isProfessional ? 8 : 12),
                borderSide: BorderSide(
                  color: UIFactoryTheme.primaryColor,
                  width: 2,
                ),
              ),
      ),
    );
  }

  Widget _buildPasswordField({
    bool isDarkTheme = false,
    bool isImageTheme = false,
    bool isMinimal = false,
    bool isProfessional = false,
  }) {
    final textColor =
        isDarkTheme || isImageTheme ? Colors.white : UIFactoryTheme.textColor;
    final fillColor = isDarkTheme
        ? Colors.grey[800]!
        : isImageTheme
            ? Colors.white.withOpacity(0.2)
            : isMinimal
                ? Colors.transparent
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
        filled: !isMinimal,
        fillColor: fillColor,
        border: isMinimal
            ? UnderlineInputBorder(
                borderSide: BorderSide(color: textColor.withOpacity(0.3)),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(isProfessional ? 8 : 12),
                borderSide: isProfessional
                    ? BorderSide(color: Colors.grey[300]!)
                    : BorderSide.none,
              ),
        enabledBorder: isMinimal
            ? UnderlineInputBorder(
                borderSide: BorderSide(color: textColor.withOpacity(0.3)),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(isProfessional ? 8 : 12),
                borderSide: isProfessional
                    ? BorderSide(color: Colors.grey[300]!)
                    : BorderSide.none,
              ),
        focusedBorder: isMinimal
            ? UnderlineInputBorder(
                borderSide: BorderSide(
                  color: UIFactoryTheme.primaryColor,
                  width: 2,
                ),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(isProfessional ? 8 : 12),
                borderSide: BorderSide(
                  color: UIFactoryTheme.primaryColor,
                  width: 2,
                ),
              ),
      ),
    );
  }

  Widget _buildConfirmPasswordField({
    bool isDarkTheme = false,
    bool isImageTheme = false,
    bool isMinimal = false,
    bool isProfessional = false,
  }) {
    final textColor =
        isDarkTheme || isImageTheme ? Colors.white : UIFactoryTheme.textColor;
    final fillColor = isDarkTheme
        ? Colors.grey[800]!
        : isImageTheme
            ? Colors.white.withOpacity(0.2)
            : isMinimal
                ? Colors.transparent
                : Colors.grey[200]!;

    return TextField(
      controller: _confirmPasswordController,
      obscureText: _obscureConfirmPassword,
      style: TextStyle(color: textColor),
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        labelStyle: TextStyle(color: textColor.withOpacity(0.7)),
        prefixIcon: Icon(Icons.lock_outline, color: textColor.withOpacity(0.7)),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureConfirmPassword
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: textColor.withOpacity(0.7),
          ),
          onPressed: _toggleConfirmPasswordVisibility,
        ),
        filled: !isMinimal,
        fillColor: fillColor,
        border: isMinimal
            ? UnderlineInputBorder(
                borderSide: BorderSide(color: textColor.withOpacity(0.3)),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(isProfessional ? 8 : 12),
                borderSide: isProfessional
                    ? BorderSide(color: Colors.grey[300]!)
                    : BorderSide.none,
              ),
        enabledBorder: isMinimal
            ? UnderlineInputBorder(
                borderSide: BorderSide(color: textColor.withOpacity(0.3)),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(isProfessional ? 8 : 12),
                borderSide: isProfessional
                    ? BorderSide(color: Colors.grey[300]!)
                    : BorderSide.none,
              ),
        focusedBorder: isMinimal
            ? UnderlineInputBorder(
                borderSide: BorderSide(
                  color: UIFactoryTheme.primaryColor,
                  width: 2,
                ),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(isProfessional ? 8 : 12),
                borderSide: BorderSide(
                  color: UIFactoryTheme.primaryColor,
                  width: 2,
                ),
              ),
      ),
    );
  }

  Widget _buildTermsCheckbox({
    bool isDarkTheme = false,
    bool isImageTheme = false,
    bool isProfessional = false,
  }) {
    final textColor = isDarkTheme || isImageTheme
        ? Colors.white70
        : UIFactoryTheme.textColor.withOpacity(0.7);
    final accentColor = isDarkTheme || isImageTheme
        ? Colors.white
        : UIFactoryTheme.primaryColor;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: _acceptTerms,
          onChanged: (value) => _toggleTermsAcceptance(),
          activeColor: UIFactoryTheme.primaryColor,
        ),
        Expanded(
          child: GestureDetector(
            onTap: _toggleTermsAcceptance,
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(color: textColor, fontSize: 14),
                  children: [
                    const TextSpan(text: 'I agree to the '),
                    TextSpan(
                      text: 'Terms of Service',
                      style: TextStyle(
                        color: accentColor,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                        color: accentColor,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignupButton(
    Color primaryColor, {
    bool isMinimal = false,
    bool isProfessional = false,
  }) {
    return SizedBox(
      width: double.infinity,
      height: isProfessional ? 50 : 56,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _handleSignup,
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              isMinimal
                  ? 4
                  : isProfessional
                      ? 8
                      : 12,
            ),
          ),
          elevation: isMinimal ? 0 : 2,
        ),
        child: _isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                'Create Account',
                style: TextStyle(
                  fontSize: isProfessional ? 16 : 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }

  Widget _buildLoginOption({
    bool isDarkTheme = false,
    bool isImageTheme = false,
    bool isMinimal = false,
    bool isProfessional = false,
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
        Text(
          'Already have an account?',
          style: TextStyle(
            color: textColor,
            fontSize: isProfessional ? 14 : 16,
          ),
        ),
        TextButton(
          onPressed: widget.onLogin,
          child: Text(
            'Sign In',
            style: TextStyle(
              color: accentColor,
              fontWeight: FontWeight.bold,
              fontSize: isProfessional ? 14 : 16,
            ),
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
            text = 'Sign up with Google';
            color = Colors.red;
            break;
          case 'facebook':
            icon = Icons.facebook;
            text = 'Sign up with Facebook';
            color = Colors.blue;
            break;
          case 'apple':
            icon = Icons.apple;
            text = 'Sign up with Apple';
            color = isDarkTheme ? Colors.white : Colors.black;
            break;
          case 'twitter':
            icon = Icons.flutter_dash;
            text = 'Sign up with Twitter';
            color = Colors.lightBlue;
            break;
          default:
            icon = Icons.account_circle_outlined;
            text = 'Sign up with $provider';
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
