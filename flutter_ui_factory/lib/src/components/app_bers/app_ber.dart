import 'package:flutter/material.dart';

import '../../ui_factory_theme.dart';

/// A factory app bar widget with various themes.
class FactoryAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String theme;
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final Color? backgroundColor;
  final bool centerTitle;
  final double elevation;

  const FactoryAppBar({
    Key? key,
    required this.theme,
    required this.title,
    this.actions,
    this.leading,
    this.backgroundColor,
    this.centerTitle = true,
    this.elevation = 0,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  _FactoryAppBarState createState() => _FactoryAppBarState();
}

class _FactoryAppBarState extends State<FactoryAppBar> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) {
        _searchController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.backgroundColor ?? UIFactoryTheme.primaryColor;

    switch (widget.theme.toLowerCase()) {
      case 'transparent':
        return _buildTransparentAppBar(color);
      case 'gradient':
        return _buildGradientAppBar(color);
      case 'curved':
        return _buildCurvedAppBar(color);
      case 'search':
        return _buildSearchAppBar(color);
      default:
        return _buildDefaultAppBar(color);
    }
  }

  AppBar _buildDefaultAppBar(Color color) {
    return AppBar(
      title: Text(widget.title),
      centerTitle: widget.centerTitle,
      backgroundColor: color,
      elevation: widget.elevation,
      leading: widget.leading,
      actions: widget.actions,
    );
  }

  AppBar _buildTransparentAppBar(Color color) {
    return AppBar(
      title: Text(widget.title),
      centerTitle: widget.centerTitle,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: widget.leading,
      actions: widget.actions,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          border: Border(
            bottom: BorderSide(color: color.withOpacity(0.2), width: 1),
          ),
        ),
      ),
    );
  }

  AppBar _buildGradientAppBar(Color color) {
    return AppBar(
      title: Text(widget.title),
      centerTitle: widget.centerTitle,
      backgroundColor: Colors.transparent,
      elevation: widget.elevation,
      leading: widget.leading,
      actions: widget.actions,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color, color.withOpacity(0.7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }

  PreferredSize _buildCurvedAppBar(Color color) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight + 20),
      child: ClipPath(
        clipper: _CurvedAppBarClipper(),
        child: Container(
          color: color,
          child: AppBar(
            title: Text(widget.title),
            centerTitle: widget.centerTitle,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: widget.leading,
            actions: widget.actions,
          ),
        ),
      ),
    );
  }

  AppBar _buildSearchAppBar(Color color) {
    return AppBar(
      title:
          _isSearching
              ? TextField(
                controller: _searchController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(
                    color:
                        UIFactoryTheme.isDarkMode
                            ? Colors.white70
                            : Colors.black54,
                  ),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  color:
                      UIFactoryTheme.isDarkMode ? Colors.white : Colors.black,
                ),
              )
              : Text(widget.title),
      centerTitle: widget.centerTitle,
      backgroundColor: color,
      elevation: widget.elevation,
      leading: widget.leading,
      actions: [
        IconButton(
          icon: Icon(_isSearching ? Icons.close : Icons.search),
          onPressed: _toggleSearch,
        ),
        ...?widget.actions,
      ],
    );
  }
}

class _CurvedAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 20,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
