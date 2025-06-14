import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../flutter_ui_factory.dart';

/// A factory button widget with various styles.
class FactoryButton extends StatefulWidget {
  final String style;
  final String text;
  final IconData? icon;
  final VoidCallback? onPressed;
  final Color? color;
  final double? width;
  final double? height;
  final bool rounded;
  final bool elevated;
  final bool animated;

  const FactoryButton({
    Key? key,
    required this.style,
    required this.text,
    this.icon,
    this.onPressed,
    this.color,
    this.width,
    this.height,
    this.rounded = true,
    this.elevated = true,
    this.animated = true,
  }) : super(key: key);

  @override
  _FactoryButtonState createState() => _FactoryButtonState();
}

class _FactoryButtonState extends State<FactoryButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onHover(bool isHovered) {
    if (widget.animated && UIFactoryTheme.useAnimations) {
      setState(() {
        _isHovered = isHovered;
      });
      if (isHovered) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? UIFactoryTheme.primaryColor;
    final height = widget.height ?? 50.0;
    final width = widget.width;
    final borderRadius = widget.rounded ? UIFactoryTheme.borderRadius : 0.0;

    Widget buttonContent = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.icon != null) ...[
          Icon(widget.icon, color: Colors.white),
          const SizedBox(width: 8),
        ],
        Text(
          widget.text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );

    Widget button;

    switch (widget.style.toLowerCase()) {
      case 'neumorphic':
        button = _buildNeumorphicButton(
          buttonContent,
          color,
          height,
          width,
          borderRadius,
        );
        break;
      case 'gradient':
        button = _buildGradientButton(
          buttonContent,
          color,
          height,
          width,
          borderRadius,
        );
        break;
      case 'glass':
        button = _buildGlassButton(
          buttonContent,
          color,
          height,
          width,
          borderRadius,
        );
        break;
      case '3d':
        button = _build3DButton(
          buttonContent,
          color,
          height,
          width,
          borderRadius,
        );
        break;
      default:
        button = _buildDefaultButton(
          buttonContent,
          color,
          height,
          width,
          borderRadius,
        );
    }

    if (widget.animated && UIFactoryTheme.useAnimations) {
      return MouseRegion(
        onEnter: (_) => _onHover(true),
        onExit: (_) => _onHover(false),
        child: ScaleTransition(scale: _scaleAnimation, child: button),
      );
    }

    return button;
  }

  Widget _buildDefaultButton(
    Widget content,
    Color color,
    double height,
    double? width,
    double borderRadius,
  ) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: widget.elevated ? UIFactoryTheme.elevation : 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: content,
      ),
    );
  }

  Widget _buildNeumorphicButton(
    Widget content,
    Color color,
    double height,
    double? width,
    double borderRadius,
  ) {
    final isDark = UIFactoryTheme.isDarkMode;
    final backgroundColor = isDark ? Colors.grey[800]! : Colors.grey[200]!;
    final shadowColor1 = isDark ? Colors.black : Colors.white;
    final shadowColor2 = isDark ? Colors.grey[700]! : Colors.grey[400]!;

    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color: shadowColor1,
              offset: const Offset(-4, -4),
              blurRadius: 10,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: shadowColor2,
              offset: const Offset(4, 4),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Center(child: content),
      ),
    );
  }

  Widget _buildGradientButton(
    Widget content,
    Color color,
    double height,
    double? width,
    double borderRadius,
  ) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color, color.withOpacity(0.7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: widget.elevated
              ? [
                  BoxShadow(
                    color: color.withOpacity(0.4),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Center(child: content),
      ),
    );
  }

  Widget _buildGlassButton(
    Widget content,
    Color color,
    double height,
    double? width,
    double borderRadius,
  ) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(
            sigmaX: _isHovered ? 10.0 : 5.0,
            sigmaY: _isHovered ? 10.0 : 5.0,
          ),
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: color.withOpacity(0.3),
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(color: color.withOpacity(0.2), width: 1.5),
            ),
            child: Center(child: content),
          ),
        ),
      ),
    );
  }

  Widget _build3DButton(
    Widget content,
    Color color,
    double height,
    double? width,
    double borderRadius,
  ) {
    return GestureDetector(
      onTap: () {
        if (widget.onPressed != null) {
          if (widget.animated) {
            _controller.forward().then((_) {
              _controller.reverse().then((_) {
                widget.onPressed!();
              });
            });
          } else {
            widget.onPressed!();
          }
        }
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.8),
              offset: const Offset(0, 6),
              blurRadius: 0,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Transform.translate(
          offset: _isHovered ? const Offset(0, 3) : const Offset(0, 0),
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Center(child: content),
          ),
        ),
      ),
    );
  }
}
