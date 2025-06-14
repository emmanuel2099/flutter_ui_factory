import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../flutter_ui_factory.dart';

/// A factory card widget with various styles.
class FactoryCard extends StatefulWidget {
  final String style;
  final Widget child;
  final Color? color;
  final double? width;
  final double? height;
  final bool rounded;
  final bool elevated;
  final bool animated;
  final EdgeInsetsGeometry? padding;

  const FactoryCard({
    Key? key,
    required this.style,
    required this.child,
    this.color,
    this.width,
    this.height,
    this.rounded = true,
    this.elevated = true,
    this.animated = false,
    this.padding,
  }) : super(key: key);

  @override
  _FactoryCardState createState() => _FactoryCardState();
}

class _FactoryCardState extends State<FactoryCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
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

  void _toggleExpanded() {
    if (widget.style.toLowerCase() == 'expandable') {
      setState(() {
        _isExpanded = !_isExpanded;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? UIFactoryTheme.backgroundColor;
    final borderRadius = widget.rounded ? UIFactoryTheme.borderRadius : 0.0;
    final padding = widget.padding ?? UIFactoryTheme.defaultPadding;

    Widget card;

    switch (widget.style.toLowerCase()) {
      case 'modern':
        card = _buildModernCard(color, borderRadius, padding);
        break;
      case 'glass':
        card = _buildGlassCard(color, borderRadius, padding);
        break;
      case 'animated':
        card = _buildAnimatedCard(color, borderRadius, padding);
        break;
      case 'expandable':
        card = _buildExpandableCard(color, borderRadius, padding);
        break;
      case 'draggable':
        card = _buildDraggableCard(color, borderRadius, padding);
        break;
      default:
        card = _buildDefaultCard(color, borderRadius, padding);
    }

    if (widget.animated &&
        UIFactoryTheme.useAnimations &&
        widget.style.toLowerCase() != 'expandable') {
      return MouseRegion(
        onEnter: (_) => _onHover(true),
        onExit: (_) => _onHover(false),
        child: ScaleTransition(scale: _scaleAnimation, child: card),
      );
    }

    return card;
  }

  Widget _buildDefaultCard(
    Color color,
    double borderRadius,
    EdgeInsetsGeometry padding,
  ) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: widget.elevated
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: Padding(padding: padding, child: widget.child),
    );
  }

  Widget _buildModernCard(
    Color color,
    double borderRadius,
    EdgeInsetsGeometry padding,
  ) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: widget.elevated
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ]
            : null,
        border: Border.all(
          color:
              UIFactoryTheme.isDarkMode ? Colors.grey[800]! : Colors.grey[200]!,
          width: 1,
        ),
      ),
      child: Padding(padding: padding, child: widget.child),
    );
  }

  Widget _buildGlassCard(
    Color color,
    double borderRadius,
    EdgeInsetsGeometry padding,
  ) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(
          sigmaX: _isHovered ? 15.0 : 10.0,
          sigmaY: _isHovered ? 15.0 : 10.0,
        ),
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: color.withOpacity(0.2), width: 1.5),
          ),
          child: Padding(padding: padding, child: widget.child),
        ),
      ),
    );
  }

  Widget _buildAnimatedCard(
    Color color,
    double borderRadius,
    EdgeInsetsGeometry padding,
  ) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: _isHovered ? color.withOpacity(0.9) : color,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: widget.elevated
            ? [
                BoxShadow(
                  color: _isHovered
                      ? UIFactoryTheme.primaryColor.withOpacity(0.3)
                      : Colors.black.withOpacity(0.1),
                  blurRadius: _isHovered ? 15 : 10,
                  offset: _isHovered ? const Offset(0, 8) : const Offset(0, 4),
                ),
              ]
            : null,
        border: Border.all(
          color: _isHovered
              ? UIFactoryTheme.primaryColor.withOpacity(0.5)
              : Colors.transparent,
          width: 2,
        ),
      ),
      child: Padding(padding: padding, child: widget.child),
    );
  }

  Widget _buildExpandableCard(
    Color color,
    double borderRadius,
    EdgeInsetsGeometry padding,
  ) {
    return GestureDetector(
      onTap: _toggleExpanded,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: widget.width,
        height: _isExpanded
            ? (widget.height != null ? widget.height! * 1.5 : null)
            : widget.height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: widget.elevated
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Padding(
          padding: padding,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Expandable Card',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Icon(
                    _isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: UIFactoryTheme.primaryColor,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Expanded(child: SingleChildScrollView(child: widget.child)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDraggableCard(
    Color color,
    double borderRadius,
    EdgeInsetsGeometry padding,
  ) {
    return Draggable<String>(
      data: 'draggable-card',
      feedback: Material(
        color: Colors.transparent,
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: color.withOpacity(0.8),
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Padding(padding: padding, child: widget.child),
        ),
      ),
      childWhenDragging: Opacity(
        opacity: 0.5,
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: UIFactoryTheme.primaryColor.withOpacity(0.5),
              width: 2,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: widget.elevated
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Stack(
          children: [
            Padding(padding: padding, child: widget.child),
            Positioned(
              top: 8,
              right: 8,
              child: Icon(
                Icons.drag_indicator,
                color:
                    UIFactoryTheme.isDarkMode ? Colors.white54 : Colors.black45,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
