import 'package:flutter/material.dart';

/// Animation utilities for UI Factory components.
class UIFactoryAnimations {
  /// Creates a slide-in animation from the left.
  static Animation<Offset> slideInFromLeft(AnimationController controller) {
    return Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
  }

  /// Creates a slide-in animation from the right.
  static Animation<Offset> slideInFromRight(AnimationController controller) {
    return Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
  }

  /// Creates a slide-in animation from the top.
  static Animation<Offset> slideInFromTop(AnimationController controller) {
    return Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
  }

  /// Creates a slide-in animation from the bottom.
  static Animation<Offset> slideInFromBottom(AnimationController controller) {
    return Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
  }

  /// Creates a fade-in animation.
  static Animation<double> fadeIn(AnimationController controller) {
    return Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
  }

  /// Creates a scale animation.
  static Animation<double> scale(
    AnimationController controller, {
    double begin = 0.0,
    double end = 1.0,
  }) {
    return Tween<double>(
      begin: begin,
      end: end,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.elasticOut));
  }

  /// Creates a rotation animation.
  static Animation<double> rotate(AnimationController controller) {
    return Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.linear));
  }

  /// Creates a bounce animation.
  static Animation<double> bounce(AnimationController controller) {
    return Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));
  }

  /// Creates a staggered animation for multiple widgets.
  static List<Animation<double>> staggered(
    AnimationController controller,
    int itemCount, {
    Duration delay = const Duration(milliseconds: 100),
  }) {
    final animations = <Animation<double>>[];
    final interval = 1.0 / itemCount;

    for (int i = 0; i < itemCount; i++) {
      final start = i * interval;
      final end = start + interval;

      animations.add(
        Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(start, end, curve: Curves.easeOut),
          ),
        ),
      );
    }

    return animations;
  }
}

/// A widget that provides common animation effects.
class AnimatedUIWidget extends StatefulWidget {
  final Widget child;
  final String animationType;
  final Duration duration;
  final Duration delay;
  final bool autoStart;

  const AnimatedUIWidget({
    Key? key,
    required this.child,
    this.animationType = 'fadeIn',
    this.duration = const Duration(milliseconds: 500),
    this.delay = Duration.zero,
    this.autoStart = true,
  }) : super(key: key);

  @override
  _AnimatedUIWidgetState createState() => _AnimatedUIWidgetState();
}

class _AnimatedUIWidgetState extends State<AnimatedUIWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);

    switch (widget.animationType) {
      case 'fadeIn':
        _animation = UIFactoryAnimations.fadeIn(_controller);
        break;
      case 'scale':
        _animation = UIFactoryAnimations.scale(_controller);
        break;
      case 'bounce':
        _animation = UIFactoryAnimations.bounce(_controller);
        break;
      case 'slideInFromLeft':
        _slideAnimation = UIFactoryAnimations.slideInFromLeft(_controller);
        break;
      case 'slideInFromRight':
        _slideAnimation = UIFactoryAnimations.slideInFromRight(_controller);
        break;
      case 'slideInFromTop':
        _slideAnimation = UIFactoryAnimations.slideInFromTop(_controller);
        break;
      case 'slideInFromBottom':
        _slideAnimation = UIFactoryAnimations.slideInFromBottom(_controller);
        break;
      default:
        _animation = UIFactoryAnimations.fadeIn(_controller);
    }

    if (widget.autoStart) {
      Future.delayed(widget.delay, () {
        if (mounted) {
          _controller.forward();
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.animationType.contains('slide')) {
      return SlideTransition(position: _slideAnimation, child: widget.child);
    }

    switch (widget.animationType) {
      case 'fadeIn':
        return FadeTransition(opacity: _animation, child: widget.child);
      case 'scale':
      case 'bounce':
        return ScaleTransition(scale: _animation, child: widget.child);
      default:
        return FadeTransition(opacity: _animation, child: widget.child);
    }
  }
}
