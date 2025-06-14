import 'package:flutter/material.dart';

import '../../flutter_ui_factory.dart';

/// A factory text widget with various styles and effects.
class FactoryText extends StatefulWidget {
  final String text;
  final String style;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final bool animated;
  final Duration animationDuration;
  final List<Color>? gradientColors;
  final bool responsive;

  const FactoryText({
    Key? key,
    required this.text,
    this.style = 'default',
    this.fontSize,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.maxLines,
    this.animated = false,
    this.animationDuration = const Duration(milliseconds: 500),
    this.gradientColors,
    this.responsive = true,
  }) : super(key: key);

  @override
  _FactoryTextState createState() => _FactoryTextState();
}

class _FactoryTextState extends State<FactoryText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    if (widget.animated) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? UIFactoryTheme.textColor;
    final fontSize = widget.responsive
        ? UIFactoryResponsive.getFontSize(
            context,
            mobile: widget.fontSize ?? 16,
          )
        : widget.fontSize ?? 16;

    Widget textWidget;

    switch (widget.style.toLowerCase()) {
      case 'gradient':
        textWidget = _buildGradientText(fontSize);
        break;
      case 'shadow':
        textWidget = _buildShadowText(color, fontSize);
        break;
      case 'outline':
        textWidget = _buildOutlineText(color, fontSize);
        break;
      case 'neon':
        textWidget = _buildNeonText(color, fontSize);
        break;
      case 'typewriter':
        textWidget = _buildTypewriterText(color, fontSize);
        break;
      case '3d':
        textWidget = _build3DText(color, fontSize);
        break;
      default:
        textWidget = _buildDefaultText(color, fontSize);
    }

    if (widget.animated && widget.style != 'typewriter') {
      return SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(opacity: _fadeAnimation, child: textWidget),
      );
    }

    return textWidget;
  }

  Widget _buildDefaultText(Color color, double fontSize) {
    return Text(
      widget.text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: widget.fontWeight,
        fontFamily: UIFactoryTheme.fontFamily,
      ),
      textAlign: widget.textAlign,
      maxLines: widget.maxLines,
      overflow: widget.maxLines != null ? TextOverflow.ellipsis : null,
    );
  }

  Widget _buildGradientText(double fontSize) {
    final gradientColors = widget.gradientColors ??
        [UIFactoryTheme.primaryColor, UIFactoryTheme.secondaryColor];

    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: gradientColors,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(bounds),
      child: Text(
        widget.text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: widget.fontWeight ?? FontWeight.bold,
          color: Colors.white,
          fontFamily: UIFactoryTheme.fontFamily,
        ),
        textAlign: widget.textAlign,
        maxLines: widget.maxLines,
        overflow: widget.maxLines != null ? TextOverflow.ellipsis : null,
      ),
    );
  }

  Widget _buildShadowText(Color color, double fontSize) {
    return Text(
      widget.text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: widget.fontWeight,
        fontFamily: UIFactoryTheme.fontFamily,
        shadows: [
          Shadow(
            offset: const Offset(2, 2),
            blurRadius: 4,
            color: Colors.black.withOpacity(0.3),
          ),
        ],
      ),
      textAlign: widget.textAlign,
      maxLines: widget.maxLines,
      overflow: widget.maxLines != null ? TextOverflow.ellipsis : null,
    );
  }

  Widget _buildOutlineText(Color color, double fontSize) {
    return Stack(
      children: [
        // Outline
        Text(
          widget.text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: widget.fontWeight ?? FontWeight.bold,
            fontFamily: UIFactoryTheme.fontFamily,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 2
              ..color = color,
          ),
          textAlign: widget.textAlign,
          maxLines: widget.maxLines,
          overflow: widget.maxLines != null ? TextOverflow.ellipsis : null,
        ),
        // Fill
        Text(
          widget.text,
          style: TextStyle(
            fontSize: fontSize,
            color: UIFactoryTheme.backgroundColor,
            fontWeight: widget.fontWeight ?? FontWeight.bold,
            fontFamily: UIFactoryTheme.fontFamily,
          ),
          textAlign: widget.textAlign,
          maxLines: widget.maxLines,
          overflow: widget.maxLines != null ? TextOverflow.ellipsis : null,
        ),
      ],
    );
  }

  Widget _buildNeonText(Color color, double fontSize) {
    return Container(
      child: Text(
        widget.text,
        style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: widget.fontWeight ?? FontWeight.bold,
          fontFamily: UIFactoryTheme.fontFamily,
          shadows: [
            Shadow(blurRadius: 10, color: color),
            Shadow(blurRadius: 20, color: color),
            Shadow(blurRadius: 30, color: color),
          ],
        ),
        textAlign: widget.textAlign,
        maxLines: widget.maxLines,
        overflow: widget.maxLines != null ? TextOverflow.ellipsis : null,
      ),
    );
  }

  Widget _buildTypewriterText(Color color, double fontSize) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final displayText = widget.text.substring(
          0,
          (_controller.value * widget.text.length).round(),
        );

        return Text(
          displayText + (_controller.value < 1.0 ? '|' : ''),
          style: TextStyle(
            fontSize: fontSize,
            color: color,
            fontWeight: widget.fontWeight,
            fontFamily: 'monospace',
          ),
          textAlign: widget.textAlign,
          maxLines: widget.maxLines,
          overflow: widget.maxLines != null ? TextOverflow.ellipsis : null,
        );
      },
    );
  }

  Widget _build3DText(Color color, double fontSize) {
    return Stack(
      children: [
        // Shadow layers for 3D effect
        for (int i = 5; i > 0; i--)
          Transform.translate(
            offset: Offset(i.toDouble(), i.toDouble()),
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: fontSize,
                color: color.withOpacity(0.1),
                fontWeight: widget.fontWeight ?? FontWeight.bold,
                fontFamily: UIFactoryTheme.fontFamily,
              ),
              textAlign: widget.textAlign,
              maxLines: widget.maxLines,
              overflow: widget.maxLines != null ? TextOverflow.ellipsis : null,
            ),
          ),
        // Main text
        Text(
          widget.text,
          style: TextStyle(
            fontSize: fontSize,
            color: color,
            fontWeight: widget.fontWeight ?? FontWeight.bold,
            fontFamily: UIFactoryTheme.fontFamily,
          ),
          textAlign: widget.textAlign,
          maxLines: widget.maxLines,
          overflow: widget.maxLines != null ? TextOverflow.ellipsis : null,
        ),
      ],
    );
  }
}
