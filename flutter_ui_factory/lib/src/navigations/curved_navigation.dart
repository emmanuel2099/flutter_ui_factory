import 'dart:ui';

import 'package:flutter/material.dart';

import '../../flutter_ui_factory.dart';

/// A factory curved bottom navigation bar with various styles.
class FactoryCurvedNavigation extends StatefulWidget {
  final String style;
  final List<FactoryNavItem> items;
  final int currentIndex;
  final Function(int)? onTap;
  final Color? backgroundColor;
  final Color? selectedColor;
  final Color? unselectedColor;
  final double height;
  final bool showLabels;
  final bool animated;

  const FactoryCurvedNavigation({
    Key? key,
    required this.style,
    required this.items,
    this.currentIndex = 0,
    this.onTap,
    this.backgroundColor,
    this.selectedColor,
    this.unselectedColor,
    this.height = 70,
    this.showLabels = true,
    this.animated = true,
  }) : super(key: key);

  @override
  _FactoryCurvedNavigationState createState() =>
      _FactoryCurvedNavigationState();
}

class _FactoryCurvedNavigationState extends State<FactoryCurvedNavigation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        widget.backgroundColor ?? UIFactoryTheme.backgroundColor;
    final selectedColor = widget.selectedColor ?? UIFactoryTheme.primaryColor;
    final unselectedColor = widget.unselectedColor ?? Colors.grey;

    switch (widget.style.toLowerCase()) {
      case 'floating':
        return _buildFloatingNavigation(
          backgroundColor,
          selectedColor,
          unselectedColor,
        );
      case 'curved':
        return _buildCurvedNavigation(
          backgroundColor,
          selectedColor,
          unselectedColor,
        );
      case 'bubble':
        return _buildBubbleNavigation(
          backgroundColor,
          selectedColor,
          unselectedColor,
        );
      case 'glass':
        return _buildGlassNavigation(
          backgroundColor,
          selectedColor,
          unselectedColor,
        );
      default:
        return _buildDefaultNavigation(
          backgroundColor,
          selectedColor,
          unselectedColor,
        );
    }
  }

  Widget _buildFloatingNavigation(
    Color backgroundColor,
    Color selectedColor,
    Color unselectedColor,
  ) {
    return Container(
      margin: const EdgeInsets.all(16),
      height: widget.height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: widget.items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          final isSelected = index == widget.currentIndex;

          return GestureDetector(
            onTap: () => widget.onTap?.call(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: isSelected
                    ? selectedColor.withOpacity(0.2)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    item.icon,
                    color: isSelected ? selectedColor : unselectedColor,
                    size: 24,
                  ),
                  if (isSelected && widget.showLabels) ...[
                    const SizedBox(width: 8),
                    Text(
                      item.label,
                      style: TextStyle(
                        color: selectedColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCurvedNavigation(
    Color backgroundColor,
    Color selectedColor,
    Color unselectedColor,
  ) {
    return Container(
      height: widget.height + 20,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width, widget.height + 20),
            painter: _CurvedNavigationPainter(
              backgroundColor: backgroundColor,
              selectedIndex: widget.currentIndex,
              itemCount: widget.items.length,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: widget.height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: widget.items.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry.value;
                  final isSelected = index == widget.currentIndex;

                  return GestureDetector(
                    onTap: () => widget.onTap?.call(index),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? selectedColor
                                  : Colors.transparent,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              item.icon,
                              color:
                                  isSelected ? Colors.white : unselectedColor,
                              size: isSelected ? 28 : 24,
                            ),
                          ),
                          if (widget.showLabels) ...[
                            const SizedBox(height: 4),
                            Text(
                              item.label,
                              style: TextStyle(
                                color: isSelected
                                    ? selectedColor
                                    : unselectedColor,
                                fontSize: 12,
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBubbleNavigation(
    Color backgroundColor,
    Color selectedColor,
    Color unselectedColor,
  ) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: widget.items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          final isSelected = index == widget.currentIndex;

          return GestureDetector(
            onTap: () => widget.onTap?.call(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: isSelected ? selectedColor : Colors.transparent,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    item.icon,
                    color: isSelected ? Colors.white : unselectedColor,
                    size: 24,
                  ),
                  if (widget.showLabels) ...[
                    const SizedBox(height: 4),
                    Text(
                      item.label,
                      style: TextStyle(
                        color: isSelected ? Colors.white : unselectedColor,
                        fontSize: 12,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildGlassNavigation(
    Color backgroundColor,
    Color selectedColor,
    Color unselectedColor,
  ) {
    return Container(
      margin: const EdgeInsets.all(16),
      height: widget.height,
      decoration: BoxDecoration(
        color: backgroundColor.withOpacity(0.8),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: widget.items.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              final isSelected = index == widget.currentIndex;

              return GestureDetector(
                onTap: () => widget.onTap?.call(index),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        item.icon,
                        color: isSelected ? selectedColor : unselectedColor,
                        size: 24,
                      ),
                      if (widget.showLabels) ...[
                        const SizedBox(height: 4),
                        Text(
                          item.label,
                          style: TextStyle(
                            color: isSelected ? selectedColor : unselectedColor,
                            fontSize: 12,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildDefaultNavigation(
    Color backgroundColor,
    Color selectedColor,
    Color unselectedColor,
  ) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
      backgroundColor: backgroundColor,
      selectedItemColor: selectedColor,
      unselectedItemColor: unselectedColor,
      showSelectedLabels: widget.showLabels,
      showUnselectedLabels: widget.showLabels,
      type: BottomNavigationBarType.fixed,
      items: widget.items
          .map(
            (item) => BottomNavigationBarItem(
              icon: Icon(item.icon),
              label: item.label,
            ),
          )
          .toList(),
    );
  }
}

class FactoryNavItem {
  final IconData icon;
  final String label;
  final Widget? badge;

  const FactoryNavItem({required this.icon, required this.label, this.badge});
}

class _CurvedNavigationPainter extends CustomPainter {
  final Color backgroundColor;
  final int selectedIndex;
  final int itemCount;

  _CurvedNavigationPainter({
    required this.backgroundColor,
    required this.selectedIndex,
    required this.itemCount,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    final path = Path();
    final itemWidth = size.width / itemCount;
    final selectedItemCenter = (selectedIndex + 0.5) * itemWidth;
    final curveRadius = 30.0;

    path.moveTo(0, 20);

    // Draw curve for selected item
    path.lineTo(selectedItemCenter - curveRadius, 20);
    path.quadraticBezierTo(
      selectedItemCenter - curveRadius / 2,
      0,
      selectedItemCenter,
      0,
    );
    path.quadraticBezierTo(
      selectedItemCenter + curveRadius / 2,
      0,
      selectedItemCenter + curveRadius,
      20,
    );

    path.lineTo(size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
