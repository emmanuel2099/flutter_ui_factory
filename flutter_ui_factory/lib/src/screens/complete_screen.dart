import 'package:flutter/material.dart';

import '../../flutter_ui_factory.dart';
import '../navigations/curved_navigation.dart';

/// Factory for creating complete, production-ready screens
///
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

class CompleteScreenFactory {
  static Widget buildScreen({
    required String screenType,
    required Map<String, dynamic> data,
    required Map<String, Function> callbacks,
    required String theme,
    final Color? primaryColor,
    Color? backgroundColor,
    bool includeAppBar = true,
    bool includeBottomNav = true,
    bool includeFloatingButton = false,
    required List<String> features,
  }) {
    switch (screenType.toLowerCase()) {
      // E-COMMERCE SCREENS
      case 'ecommerce_home':
        return _buildEcommerceHome(
          data,
          callbacks,
          theme,
          primaryColor,
          backgroundColor,
        );
      case 'ecommerce_product':
        return _buildEcommerceProduct(
          data,
          callbacks,
          theme,
          primaryColor,
          backgroundColor,
        );
      case 'ecommerce_cart':
        return _buildEcommerceCart(
          data,
          callbacks,
          theme,
          primaryColor,
          backgroundColor,
        );
      case 'ecommerce_checkout':
        return _buildEcommerceCheckout(
          data,
          callbacks,
          theme,
          primaryColor,
          backgroundColor,
        );

      // SOCIAL MEDIA SCREENS
      case 'social_feed':
        return _buildSocialFeed(
          data,
          callbacks,
          theme,
          primaryColor,
          backgroundColor,
        );
      case 'social_profile':
        return _buildSocialProfile(
          data,
          callbacks,
          theme,
          primaryColor,
          backgroundColor,
        );
      case 'social_chat':
        return _buildSocialChat(
          data,
          callbacks,
          theme,
          primaryColor,
          backgroundColor,
        );

      // FINANCE SCREENS
      case 'finance_dashboard':
        return _buildFinanceDashboard(
          data,
          callbacks,
          theme,
          primaryColor,
          backgroundColor,
        );
      case 'finance_transfer':
        return _buildFinanceTransfer(
          data,
          callbacks,
          theme,
          primaryColor,
          backgroundColor,
        );
      case 'finance_cards':
        return _buildFinanceCards(
          data,
          callbacks,
          theme,
          primaryColor,
          backgroundColor,
        );

      // HEALTHCARE SCREENS
      case 'healthcare_dashboard':
        return _buildHealthcareDashboard(
          data,
          callbacks,
          theme,
          primaryColor,
          backgroundColor,
        );
      case 'healthcare_appointments':
        return _buildHealthcareAppointments(
          data,
          callbacks,
          theme,
          primaryColor,
          backgroundColor,
        );

      // EDUCATION SCREENS
      case 'education_courses':
        return _buildEducationCourses(
          data,
          callbacks,
          theme,
          primaryColor,
          backgroundColor,
        );
      case 'education_lessons':
        return _buildEducationLessons(
          data,
          callbacks,
          theme,
          primaryColor,
          backgroundColor,
        );

      // FOOD DELIVERY SCREENS
      case 'food_restaurants':
        return _buildFoodRestaurants(
          data,
          callbacks,
          theme,
          primaryColor,
          backgroundColor,
        );
      case 'food_menu':
        return _buildFoodMenu(
          data,
          callbacks,
          theme,
          primaryColor,
          backgroundColor,
        );

      // TRAVEL SCREENS
      case 'travel_explore':
        return _buildTravelExplore(
          data,
          callbacks,
          theme,
          primaryColor,
          backgroundColor,
        );
      case 'travel_bookings':
        return _buildTravelBookings(
          data,
          callbacks,
          theme,
          primaryColor,
          backgroundColor,
        );

      // REAL ESTATE SCREENS
      case 'realestate_listings':
        return _buildRealEstateListings(
          data,
          callbacks,
          theme,
          primaryColor,
          backgroundColor,
        );
      case 'realestate_property':
        return _buildRealEstateProperty(
          data,
          callbacks,
          theme,
          primaryColor,
          backgroundColor,
        );

      // FITNESS SCREENS
      case 'fitness_workouts':
        return _buildFitnessWorkouts(
          data,
          callbacks,
          theme,
          primaryColor,
          backgroundColor,
        );
      case 'fitness_progress':
        return _buildFitnessProgress(
          data,
          callbacks,
          theme,
          primaryColor,
          backgroundColor,
        );

      // MUSIC SCREENS
      case 'music_player':
        return _buildMusicPlayer(
          data,
          callbacks,
          theme,
          primaryColor,
          backgroundColor,
        );
      case 'music_library':
        return _buildMusicLibrary(
          data,
          callbacks,
          theme,
          primaryColor,
          backgroundColor,
        );

      default:
        return _buildDefaultScreen(
          screenType,
          data,
          callbacks,
          theme,
          primaryColor,
          backgroundColor,
        );
    }
  }

  // ==================== E-COMMERCE SCREENS ====================

  static Widget _buildEcommerceHome(
    Map<String, dynamic> data,
    Map<String, Function> callbacks,
    String theme,
    Color? primaryColor,
    Color? backgroundColor,
  ) {
    final products =
        data['products'] as List<Map<String, dynamic>>? ?? _getDummyProducts();
    final categories = data['categories'] as List<String>? ??
        ['Electronics', 'Fashion', 'Home', 'Sports', 'Books'];

    return Scaffold(
      backgroundColor: backgroundColor ?? UIFactoryTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor ?? UIFactoryTheme.primaryColor,
        title: const Text('Shop'),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Banner
            Container(
              height: 200,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    primaryColor ?? UIFactoryTheme.primaryColor,
                    (primaryColor ?? UIFactoryTheme.primaryColor)
                        .withOpacity(0.7),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Summer Sale',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Up to 50% OFF',
                      style: TextStyle(fontSize: 18, color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),

            // Categories
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 80,
                          margin: const EdgeInsets.only(right: 12),
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: (primaryColor ??
                                          UIFactoryTheme.primaryColor)
                                      .withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Icon(
                                  _getCategoryIcon(categories[index]),
                                  color: primaryColor ??
                                      UIFactoryTheme.primaryColor,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                categories[index],
                                style: const TextStyle(fontSize: 12),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Featured Products
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Featured Products',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('See All'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return _buildProductCard(product, primaryColor);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildEcommerceProduct(
    Map<String, dynamic> data,
    Map<String, Function> callbacks,
    String theme,
    Color? primaryColor,
    Color? backgroundColor,
  ) {
    final product =
        data['product'] as Map<String, dynamic>? ?? _getDummyProducts().first;

    return Scaffold(
      backgroundColor: backgroundColor ?? UIFactoryTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(icon: const Icon(Icons.favorite_border), onPressed: () {}),
          IconButton(icon: const Icon(Icons.share), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Images
                  Container(
                    height: 300,
                    child: PageView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.image,
                              size: 100,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // Product Info
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product['name'] ?? 'Product Name',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              '\$${product['price'] ?? '99.99'}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color:
                                    primaryColor ?? UIFactoryTheme.primaryColor,
                              ),
                            ),
                            const SizedBox(width: 8),
                            if (product['originalPrice'] != null)
                              Text(
                                '\$${product['originalPrice']}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey,
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Row(
                              children: List.generate(5, (index) {
                                return Icon(
                                  index < (product['rating'] ?? 4)
                                      ? Icons.star
                                      : Icons.star_border,
                                  color: Colors.amber,
                                  size: 20,
                                );
                              }),
                            ),
                            const SizedBox(width: 8),
                            Text('(${product['reviews'] ?? 128} reviews)'),
                          ],
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          product['description'] ??
                              'This is a great product with amazing features and excellent quality.',
                          style: const TextStyle(fontSize: 16, height: 1.5),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom Actions
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          (primaryColor ?? UIFactoryTheme.primaryColor)
                              .withOpacity(0.1),
                      foregroundColor:
                          primaryColor ?? UIFactoryTheme.primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Add to Cart'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          primaryColor ?? UIFactoryTheme.primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Buy Now'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildEcommerceCart(
    Map<String, dynamic> data,
    Map<String, Function> callbacks,
    String theme,
    Color? primaryColor,
    Color? backgroundColor,
  ) {
    final cartItems = data['cartItems'] as List<Map<String, dynamic>>? ??
        _getDummyCartItems();
    final total = data['total'] ?? _calculateTotal(cartItems);

    return Scaffold(
      backgroundColor: backgroundColor ?? UIFactoryTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor ?? UIFactoryTheme.primaryColor,
        title: const Text('Your Cart'),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return _buildCartItem(item, primaryColor);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total:', style: TextStyle(fontSize: 18)),
                    Text(
                      '\$$total',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: primaryColor ?? UIFactoryTheme.primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          primaryColor ?? UIFactoryTheme.primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Proceed to Checkout'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildEcommerceCheckout(
    Map<String, dynamic> data,
    Map<String, Function> callbacks,
    String theme,
    Color? primaryColor,
    Color? backgroundColor,
  ) {
    final cartItems = data['cartItems'] as List<Map<String, dynamic>>? ??
        _getDummyCartItems();
    final total = data['total'] ?? _calculateTotal(cartItems);
    final shippingAddress =
        data['shippingAddress'] ?? '123 Main St, City, Country';
    final paymentMethod = data['paymentMethod'] ?? 'Credit Card **** 4242';

    return Scaffold(
      backgroundColor: backgroundColor ?? UIFactoryTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor ?? UIFactoryTheme.primaryColor,
        title: const Text('Checkout'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Shipping Address
              const Text(
                'Shipping Address',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(Icons.location_on,
                        color: primaryColor ?? UIFactoryTheme.primaryColor),
                    const SizedBox(width: 16),
                    Expanded(child: Text(shippingAddress)),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Change'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Payment Method
              const Text(
                'Payment Method',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(Icons.credit_card,
                        color: primaryColor ?? UIFactoryTheme.primaryColor),
                    const SizedBox(width: 16),
                    Expanded(child: Text(paymentMethod)),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Change'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Order Summary
              const Text(
                'Order Summary',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ...cartItems.map((item) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(Icons.image,
                                    size: 30, color: Colors.grey),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item['name'] ?? 'Product',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text('\$${item['price'] ?? '0.00'}'),
                                  ],
                                ),
                              ),
                              Text('x${item['quantity'] ?? 1}'),
                            ],
                          ),
                        )),
                    const Divider(),
                    _buildCheckoutRow('Subtotal', '\$$total'),
                    _buildCheckoutRow('Shipping', '\$5.99'),
                    _buildCheckoutRow(
                        'Tax', '\$${(total * 0.1).toStringAsFixed(2)}'),
                    const Divider(),
                    _buildCheckoutRow(
                      'Total',
                      '\$${(total + 5.99 + (total * 0.1)).toStringAsFixed(2)}',
                      isTotal: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Place Order Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        primaryColor ?? UIFactoryTheme.primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Place Order'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ==================== SOCIAL MEDIA SCREENS ====================

  static Widget _buildSocialFeed(
    Map<String, dynamic> data,
    Map<String, Function> callbacks,
    String theme,
    Color? primaryColor,
    Color? backgroundColor,
  ) {
    final posts =
        data['posts'] as List<Map<String, dynamic>>? ?? _getDummyPosts();

    return Scaffold(
      backgroundColor: backgroundColor ?? UIFactoryTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor ?? UIFactoryTheme.primaryColor,
        title: const Text('Social Feed'),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return _buildPostCard(post, primaryColor);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primaryColor ?? UIFactoryTheme.primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }

  static Widget _buildSocialProfile(
    Map<String, dynamic> data,
    Map<String, Function> callbacks,
    String theme,
    Color? primaryColor,
    Color? backgroundColor,
  ) {
    final user = data['user'] as Map<String, dynamic>? ??
        {
          'name': 'John Doe',
          'username': '@johndoe',
          'bio': 'Digital creator | Photography enthusiast',
          'followers': 1250,
          'following': 340,
          'posts': 56,
        };

    return Scaffold(
      backgroundColor: backgroundColor ?? UIFactoryTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(user['username']),
        actions: [
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor:
                        primaryColor ?? UIFactoryTheme.primaryColor,
                    child:
                        const Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    user['name'],
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    user['bio'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildProfileStat('Posts', user['posts']),
                      _buildProfileStat('Followers', user['followers']),
                      _buildProfileStat('Following', user['following']),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          child: const Text('Edit Profile'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                primaryColor ?? UIFactoryTheme.primaryColor,
                          ),
                          child: const Text('Follow'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Posts Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemCount: 15,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.grey[200],
                  child: const Icon(Icons.image, color: Colors.grey),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildSocialChat(
    Map<String, dynamic> data,
    Map<String, Function> callbacks,
    String theme,
    Color? primaryColor,
    Color? backgroundColor,
  ) {
    final chats =
        data['chats'] as List<Map<String, dynamic>>? ?? _getDummyChats();

    return Scaffold(
      backgroundColor: backgroundColor ?? UIFactoryTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor ?? UIFactoryTheme.primaryColor,
        title: const Text('Messages'),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return _buildChatItem(chat, primaryColor);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primaryColor ?? UIFactoryTheme.primaryColor,
        child: const Icon(Icons.message),
      ),
    );
  }

  // ==================== FINANCE SCREENS ====================

  static Widget _buildFinanceDashboard(
    Map<String, dynamic> data,
    Map<String, Function> callbacks,
    String theme,
    Color? primaryColor,
    Color? backgroundColor,
  ) {
    final balance = data['balance'] ?? 12345.67;
    final transactions = data['transactions'] as List<Map<String, dynamic>>? ??
        _getDummyTransactions();

    return Scaffold(
      backgroundColor: backgroundColor ?? UIFactoryTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('My Wallet', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Balance Card
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    primaryColor ?? UIFactoryTheme.primaryColor,
                    (primaryColor ?? UIFactoryTheme.primaryColor)
                        .withOpacity(0.7),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total Balance',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${balance.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: _buildQuickAction(
                          'Send',
                          Icons.arrow_upward,
                          Colors.white,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildQuickAction(
                          'Receive',
                          Icons.arrow_downward,
                          Colors.white,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildQuickAction(
                          'More',
                          Icons.more_horiz,
                          Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Quick Stats
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      'Income',
                      '+\$2,500',
                      Icons.trending_up,
                      Colors.green,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildStatCard(
                      'Expenses',
                      '-\$1,200',
                      Icons.trending_down,
                      Colors.red,
                    ),
                  ),
                ],
              ),
            ),

            // Recent Transactions
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Recent Transactions',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('See All'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ...transactions.map(
                    (transaction) => _buildTransactionItem(transaction),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildFinanceTransfer(
    Map<String, dynamic> data,
    Map<String, Function> callbacks,
    String theme,
    Color? primaryColor,
    Color? backgroundColor,
  ) {
    final contacts =
        data['contacts'] as List<Map<String, dynamic>>? ?? _getDummyContacts();

    return Scaffold(
      backgroundColor: backgroundColor ?? UIFactoryTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor ?? UIFactoryTheme.primaryColor,
        title: const Text('Transfer Money'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Transfer Form
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Amount',
                        prefixText: '\$',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Recipient',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Note (Optional)',
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              primaryColor ?? UIFactoryTheme.primaryColor,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text('Transfer Now'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Recent Contacts
              const Text(
                'Recent Contacts',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {
                    final contact = contacts[index];
                    return _buildContactItem(contact, primaryColor);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildFinanceCards(
    Map<String, dynamic> data,
    Map<String, Function> callbacks,
    String theme,
    Color? primaryColor,
    Color? backgroundColor,
  ) {
    final cards =
        data['cards'] as List<Map<String, dynamic>>? ?? _getDummyCards();

    return Scaffold(
      backgroundColor: backgroundColor ?? UIFactoryTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor ?? UIFactoryTheme.primaryColor,
        title: const Text('My Cards'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Cards List
              ...cards.map((card) => Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          _getCardColor(card['type']).withOpacity(0.8),
                          _getCardColor(card['type']),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              card['type'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              card['bank'],
                              style: const TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Text(
                          card['number'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: 2,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Card Holder',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  card['holder'],
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Expires',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  card['expiry'],
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: primaryColor ?? UIFactoryTheme.primaryColor,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    'Add New Card',
                    style: TextStyle(
                      color: primaryColor ?? UIFactoryTheme.primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ==================== HEALTHCARE SCREENS ====================

  static Widget _buildHealthcareDashboard(
    Map<String, dynamic> data,
    Map<String, Function> callbacks,
    String theme,
    Color? primaryColor,
    Color? backgroundColor,
  ) {
    final upcomingAppointment =
        data['upcomingAppointment'] as Map<String, dynamic>? ??
            {
              'doctor': 'Dr. Sarah Johnson',
              'specialty': 'Cardiologist',
              'date': 'Today, 2:30 PM',
              'location': 'City Medical Center',
            };
    final healthStats = data['healthStats'] as Map<String, dynamic>? ??
        {
          'heartRate': 72,
          'bloodPressure': '120/80',
          'steps': 8432,
        };

    return Scaffold(
      backgroundColor: backgroundColor ?? UIFactoryTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor ?? UIFactoryTheme.primaryColor,
        title: const Text('Health Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Upcoming Appointment
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Upcoming Appointment',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: (primaryColor ?? UIFactoryTheme.primaryColor)
                                .withOpacity(0.1),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Icon(
                            Icons.medical_services,
                            color: primaryColor ?? UIFactoryTheme.primaryColor,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                upcomingAppointment['doctor'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(upcomingAppointment['specialty']),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildHealthcareInfoRow(
                      Icons.calendar_today,
                      upcomingAppointment['date'],
                    ),
                    const SizedBox(height: 8),
                    _buildHealthcareInfoRow(
                      Icons.location_on,
                      upcomingAppointment['location'],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            child: const Text('Cancel'),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  primaryColor ?? UIFactoryTheme.primaryColor,
                            ),
                            child: const Text('Reschedule'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Health Stats
              const Text(
                'Health Stats',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.5,
                children: [
                  _buildHealthStatCard(
                    'Heart Rate',
                    '${healthStats['heartRate']} bpm',
                    Icons.favorite,
                    Colors.red,
                  ),
                  _buildHealthStatCard(
                    'Blood Pressure',
                    healthStats['bloodPressure'],
                    Icons.monitor_heart,
                    Colors.blue,
                  ),
                  _buildHealthStatCard(
                    'Steps',
                    '${healthStats['steps']}',
                    Icons.directions_walk,
                    Colors.green,
                  ),
                  _buildHealthStatCard(
                    'Sleep',
                    '7h 42m',
                    Icons.bedtime,
                    Colors.purple,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildHealthcareAppointments(
    Map<String, dynamic> data,
    Map<String, Function> callbacks,
    String theme,
    Color? primaryColor,
    Color? backgroundColor,
  ) {
    final appointments = data['appointments'] as List<Map<String, dynamic>>? ??
        _getDummyAppointments();

    return Scaffold(
      backgroundColor: backgroundColor ?? UIFactoryTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor ?? UIFactoryTheme.primaryColor,
        title: const Text('My Appointments'),
      ),
      body: ListView.builder(
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          final appointment = appointments[index];
          return _buildAppointmentItem(appointment, primaryColor);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primaryColor ?? UIFactoryTheme.primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }

  // ==================== EDUCATION SCREENS ====================

  static Widget _buildEducationCourses(
    Map<String, dynamic> data,
    Map<String, Function> callbacks,
    String theme,
    Color? primaryColor,
    Color? backgroundColor,
  ) {
    final courses =
        data['courses'] as List<Map<String, dynamic>>? ?? _getDummyCourses();

    return Scaffold(
      backgroundColor: backgroundColor ?? UIFactoryTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor ?? UIFactoryTheme.primaryColor,
        title: const Text('My Courses'),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return _buildCourseCard(course, primaryColor);
        },
      ),
    );
  }

  static Widget _buildEducationLessons(
    Map<String, dynamic> data,
    Map<String, Function> callbacks,
    String theme,
    Color? primaryColor,
    Color? backgroundColor,
  ) {
    final course =
        data['course'] as Map<String, dynamic>? ?? _getDummyCourses().first;
    final lessons =
        data['lessons'] as List<Map<String, dynamic>>? ?? _getDummyLessons();

    return Scaffold(
      backgroundColor: backgroundColor ?? UIFactoryTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor ?? UIFactoryTheme.primaryColor,
        title: Text(course['title']),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Course Header
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course['title'],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(course['description']),
                  const SizedBox(height: 16),
                  LinearProgressIndicator(
                    value: course['progress'] ?? 0.3,
                    backgroundColor: Colors.grey[200],
                    color: primaryColor ?? UIFactoryTheme.primaryColor,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${((course['progress'] ?? 0.3) * 100)}% completed',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Lessons List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Lessons',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...lessons
                      .map((lesson) => _buildLessonItem(lesson, primaryColor)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==================== FOOD DELIVERY SCREENS ====================

  static Widget _buildFoodRestaurants(
    Map<String, dynamic> data,
    Map<String, Function> callbacks,
    String theme,
    Color? primaryColor,
    Color? backgroundColor,
  ) {
    final restaurants = data['restaurants'] as List<Map<String, dynamic>>? ??
        _getDummyRestaurants();
    final categories = data['categories'] as List<String>? ??
        ['All', 'Burger', 'Pizza', 'Sushi', 'Mexican'];

    return Scaffold(
      backgroundColor: backgroundColor ?? UIFactoryTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor ?? UIFactoryTheme.primaryColor,
        title: const Text('Restaurants'),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Categories
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                      left: index == 0 ? 16 : 8,
                      right: index == categories.length - 1 ? 16 : 8,
                    ),
                    child: ChoiceChip(
                      label: Text(categories[index]),
                      selected: index == 0,
                      selectedColor:
                          primaryColor ?? UIFactoryTheme.primaryColor,
                      labelStyle: TextStyle(
                        color: index == 0 ? Colors.white : Colors.black,
                      ),
                      onSelected: (selected) {},
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // Restaurants List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: restaurants
                    .map((restaurant) => _buildRestaurantCard(
                          restaurant,
                          primaryColor,
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildFoodMenu(
    Map<String, dynamic> data,
    Map<String, Function> callbacks,
    String theme,
    Color? primaryColor,
    Color? backgroundColor,
  ) {
    final restaurant = data['restaurant'] as Map<String, dynamic>? ??
        _getDummyRestaurants().first;
    final menuItems = data['menuItems'] as List<Map<String, dynamic>>? ??
        _getDummyMenuItems();

    return Scaffold(
      backgroundColor: backgroundColor ?? UIFactoryTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          restaurant['name'],
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          // Restaurant Header
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(16),
              ),
            ),
            child: Stack(
              children: [
                const Center(
                  child: Icon(Icons.restaurant, size: 100, color: Colors.grey),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant['name'],
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          Text(
                            ' ${restaurant['rating']} (${restaurant['reviews']})',
                            style: const TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Menu Items
          Expanded(
            child: ListView.builder(
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                return _buildMenuItem(menuItems[index], primaryColor);
              },
            ),
          ),

          // Cart Summary
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                Badge(
                  backgroundColor: primaryColor ?? UIFactoryTheme.primaryColor,
                  label: const Text('3'),
                  child: const Icon(Icons.shopping_cart),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('3 items'),
                      Text('\$24.50',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        primaryColor ?? UIFactoryTheme.primaryColor,
                  ),
                  child: const Text('View Cart'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ==================== TRAVEL SCREENS ====================

  static Widget _buildTravelExplore(
    Map<String, dynamic> data,
    Map<String, Function> callbacks,
    String theme,
    Color? primaryColor,
    Color? backgroundColor,
  ) {
    final destinations = data['destinations'] as List<Map<String, dynamic>>? ??
        _getDummyDestinations();
    final categories = data['categories'] as List<String>? ??
        ['All', 'Popular', 'Beach', 'Mountain', 'City'];

    return Scaffold(
      backgroundColor: backgroundColor ?? UIFactoryTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor ?? UIFactoryTheme.primaryColor,
        title: const Text('Explore'),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Categories
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                      left: index == 0 ? 16 : 8,
                      right: index == categories.length - 1 ? 16 : 8,
                    ),
                    child: ChoiceChip(
                      label: Text(categories[index]),
                      selected: index == 0,
                      selectedColor:
                          primaryColor ?? UIFactoryTheme.primaryColor,
                      labelStyle: TextStyle(
                        color: index == 0 ? Colors.white : Colors.black,
                      ),
                      onSelected: (selected) {},
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // Popular Destinations
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Popular Destinations',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: destinations.length,
                      itemBuilder: (context, index) {
                        return _buildDestinationCard(
                          destinations[index],
                          primaryColor,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Recommended Hotels
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Recommended Hotels',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...destinations.map((destination) => _buildHotelCard(
                        destination,
                        primaryColor,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildTravelBookings(
    Map<String, dynamic> data,
    Map<String, Function> callbacks,
    String theme,
    Color? primaryColor,
    Color? backgroundColor,
  ) {
    final bookings =
        data['bookings'] as List<Map<String, dynamic>>? ?? _getDummyBookings();

    return Scaffold(
      backgroundColor: backgroundColor ?? UIFactoryTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor ?? UIFactoryTheme.primaryColor,
        title: const Text('My Bookings'),
      ),
      body: ListView.builder(
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          return _buildBookingItem(bookings[index], primaryColor);
        },
      ),
    );
  }

  // ==================== REAL ESTATE SCREENS ====================

  static Widget _buildRealEstateListings(
    Map<String, dynamic> data,
    Map<String, Function> callbacks,
    String theme,
    Color? primaryColor,
    Color? backgroundColor,
  ) {
    final properties = data['properties'] as List<Map<String, dynamic>>? ??
        _getDummyProperties();
    final filters = data['filters'] as List<String>? ??
        ['All', 'House', 'Apartment', 'Villa', 'Land'];

    return Scaffold(
      backgroundColor: backgroundColor ?? UIFactoryTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor ?? UIFactoryTheme.primaryColor,
        title: const Text('Properties'),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.filter_list), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Filters
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                      left: index == 0 ? 16 : 8,
                      right: index == filters.length - 1 ? 16 : 8,
                    ),
                    child: ChoiceChip(
                      label: Text(filters[index]),
                      selected: index == 0,
                      selectedColor:
                          primaryColor ?? UIFactoryTheme.primaryColor,
                      labelStyle: TextStyle(
                        color: index == 0 ? Colors.white : Colors.black,
                      ),
                      onSelected: (selected) {},
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // Properties List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: properties
                    .map((property) => _buildPropertyCard(
                          property,
                          primaryColor,
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildRealEstateProperty(
    Map<String, dynamic> data,
    Map<String, Function> callbacks,
    String theme,
    Color? primaryColor,
    Color? backgroundColor,
  ) {
    final property = data['property'] as Map<String, dynamic>? ??
        _getDummyProperties().first;
    final features = data['features'] as List<Map<String, dynamic>>? ??
        _getDummyPropertyFeatures();

    return Scaffold(
      backgroundColor: backgroundColor ?? UIFactoryTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Property Images
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(16),
                ),
              ),
              child: Stack(
                children: [
                  const Center(
                    child: Icon(Icons.home, size: 100, color: Colors.grey),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.photo_camera_back,
                              size: 16, color: Colors.white),
                          const SizedBox(width: 4),
                          Text(
                            '${property['photos'] ?? 12}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Property Info
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    property['address'] ?? '123 Main St, City',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    property['type'] ?? 'House',
                    style: TextStyle(
                      color: primaryColor ?? UIFactoryTheme.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        '\$${property['price'] ?? '450,000'}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.directions),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.call),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    property['description'] ??
                        'Beautiful property with amazing features and excellent location.',
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Features',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 4,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: features.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Icon(
                            features[index]['icon'],
                            color: primaryColor ?? UIFactoryTheme.primaryColor,
                          ),
                          const SizedBox(width: 8),
                          Text(features[index]['name']),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),

            // Contact Agent
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    'Contact Agent',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor:
                            (primaryColor ?? UIFactoryTheme.primaryColor)
                                .withOpacity(0.1),
                        child: Icon(
                          Icons.person,
                          size: 30,
                          color: primaryColor ?? UIFactoryTheme.primaryColor,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'John Smith',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('Real Estate Agent'),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.message),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.call),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            primaryColor ?? UIFactoryTheme.primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('Schedule a Visit'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==================== FITNESS SCREENS ====================

  static Widget _buildFitnessWorkouts(
    Map<String, dynamic> data,
    Map<String, Function> callbacks,
    String theme,
    Color? primaryColor,
    Color? backgroundColor,
  ) {
    final workouts =
        data['workouts'] as List<Map<String, dynamic>>? ?? _getDummyWorkouts();
    final categories = data['categories'] as List<String>? ??
        ['All', 'Cardio', 'Strength', 'Yoga', 'HIIT'];

    return Scaffold(
      backgroundColor: backgroundColor ?? UIFactoryTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor ?? UIFactoryTheme.primaryColor,
        title: const Text('Workouts'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Categories
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                      left: index == 0 ? 16 : 8,
                      right: index == categories.length - 1 ? 16 : 8,
                    ),
                    child: ChoiceChip(
                      label: Text(categories[index]),
                      selected: index == 0,
                      selectedColor:
                          primaryColor ?? UIFactoryTheme.primaryColor,
                      labelStyle: TextStyle(
                        color: index == 0 ? Colors.white : Colors.black,
                      ),
                      onSelected: (selected) {},
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // Featured Workout
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [
                      (primaryColor ?? UIFactoryTheme.primaryColor)
                          .withOpacity(0.8),
                      (primaryColor ?? UIFactoryTheme.primaryColor),
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: 16,
                      top: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.star, size: 16, color: Colors.amber),
                            SizedBox(width: 4),
                            Text(
                              'Featured',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 16,
                      bottom: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Full Body Workout',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            '45 min • Intermediate',
                            style: TextStyle(color: Colors.white70),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor:
                                  primaryColor ?? UIFactoryTheme.primaryColor,
                            ),
                            child: const Text('Start Now'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Workouts List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Recommended Workouts',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...workouts.map((workout) => _buildWorkoutCard(
                        workout,
                        primaryColor,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildFitnessProgress(
    Map<String, dynamic> data,
    Map<String, Function> callbacks,
    String theme,
    Color? primaryColor,
    Color? backgroundColor,
  ) {
    final stats = data['stats'] as Map<String, dynamic>? ??
        {
          'weight': 72.5,
          'goal': 68.0,
          'workouts': 12,
          'calories': 2450,
        };

    return Scaffold(
      backgroundColor: backgroundColor ?? UIFactoryTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor ?? UIFactoryTheme.primaryColor,
        title: const Text('My Progress'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Progress Summary
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      'Current Weight',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${stats['weight']} kg',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    LinearProgressIndicator(
                      value: (stats['weight'] as double) /
                          (stats['goal'] as double),
                      backgroundColor: Colors.grey[200],
                      color: primaryColor ?? UIFactoryTheme.primaryColor,
                      minHeight: 10,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Goal: ${stats['goal']} kg',
                          style: const TextStyle(color: Colors.grey),
                        ),
                        Text(
                          '${((stats['weight'] as double) / (stats['goal'] as double) * 100).toStringAsFixed(1)}%',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Stats Cards
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.2,
                children: [
                  _buildFitnessStatCard(
                    'Workouts',
                    '${stats['workouts']}',
                    Icons.fitness_center,
                    primaryColor,
                  ),
                  _buildFitnessStatCard(
                    'Calories',
                    '${stats['calories']}',
                    Icons.local_fire_department,
                    Colors.orange,
                  ),
                  _buildFitnessStatCard(
                    'Water',
                    '2.5L',
                    Icons.local_drink,
                    Colors.blue,
                  ),
                  _buildFitnessStatCard(
                    'Sleep',
                    '7h 30m',
                    Icons.bedtime,
                    Colors.purple,
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Weekly Progress
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Weekly Progress',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 200,
                      child: Center(
                        child: Text(
                          'Progress Chart Placeholder',
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ==================== MUSIC SCREENS ====================

  static Widget _buildMusicPlayer(
    Map<String, dynamic> data,
    Map<String, Function> callbacks,
    String theme,
    Color? primaryColor,
    Color? backgroundColor,
  ) {
    final song =
        data['song'] as Map<String, dynamic>? ?? _getDummySongs().first;

    return Scaffold(
      backgroundColor: backgroundColor ?? UIFactoryTheme.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Back Button
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_downward),
                    onPressed: () {},
                  ),
                  const Spacer(),
                  const Text('Now Playing'),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            // Album Art
            Container(
              width: 300,
              height: 300,
              margin: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child:
                  const Icon(Icons.music_note, size: 100, color: Colors.grey),
            ),

            // Song Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  Text(
                    song['title'],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    song['artist'],
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Progress Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  Slider(
                    value: 0.3,
                    onChanged: (value) {},
                    activeColor: primaryColor ?? UIFactoryTheme.primaryColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('1:23'),
                      Text(
                        song['duration'],
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Controls
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.skip_previous),
                    iconSize: 40,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.play_arrow),
                    iconSize: 60,
                    color: primaryColor ?? UIFactoryTheme.primaryColor,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.skip_next),
                    iconSize: 40,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Additional Controls
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.favorite_border),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.shuffle),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.repeat),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.playlist_add),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildMusicLibrary(
    Map<String, dynamic> data,
    Map<String, Function> callbacks,
    String theme,
    Color? primaryColor,
    Color? backgroundColor,
  ) {
    final songs =
        data['songs'] as List<Map<String, dynamic>>? ?? _getDummySongs();
    final playlists = data['playlists'] as List<Map<String, dynamic>>? ??
        _getDummyPlaylists();

    return Scaffold(
      backgroundColor: backgroundColor ?? UIFactoryTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor ?? UIFactoryTheme.primaryColor,
        title: const Text('Library'),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text: 'Songs'),
                Tab(text: 'Playlists'),
                Tab(text: 'Artists'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Songs Tab
                  ListView.builder(
                    itemCount: songs.length,
                    itemBuilder: (context, index) {
                      return _buildSongItem(songs[index], primaryColor);
                    },
                  ),

                  // Playlists Tab
                  GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1,
                    ),
                    itemCount: playlists.length,
                    itemBuilder: (context, index) {
                      return _buildPlaylistCard(playlists[index], primaryColor);
                    },
                  ),

                  // Artists Tab
                  ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              (primaryColor ?? UIFactoryTheme.primaryColor)
                                  .withOpacity(0.1),
                          child: Icon(
                            Icons.person,
                            color: primaryColor ?? UIFactoryTheme.primaryColor,
                          ),
                        ),
                        title: Text('Artist ${index + 1}'),
                        subtitle: const Text('12 songs'),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==================== HELPER METHODS ====================

  static Widget _buildProductCard(
    Map<String, dynamic> product,
    Color? primaryColor,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
              ),
              child: const Center(
                child: Icon(Icons.image, size: 50, color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['name'] ?? 'Product',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${product['price'] ?? '99.99'}',
                  style: TextStyle(
                    color: primaryColor ?? UIFactoryTheme.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildCartItem(Map<String, dynamic> item, Color? primaryColor) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.image, size: 40, color: Colors.grey),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['name'] ?? 'Product',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('\$${item['price'] ?? '0.00'}'),
              ],
            ),
          ),
          Column(
            children: [
              IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: () {},
              ),
              Text('${item['quantity'] ?? 1}'),
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _buildCheckoutRow(String label, String value,
      {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: isTotal ? Colors.black : Colors.grey,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: isTotal ? Colors.black : Colors.grey,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildPostCard(Map<String, dynamic> post, Color? primaryColor) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Post Header
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: primaryColor ?? UIFactoryTheme.primaryColor,
                  child: Text(post['author']?[0] ?? 'U'),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post['author'] ?? 'User',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        post['time'] ?? '2h ago',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
              ],
            ),
          ),

          // Post Content
          if (post['content'] != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(post['content']),
            ),

          // Post Image
          if (post['hasImage'] == true)
            Container(
              height: 200,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Icon(Icons.image, size: 50, color: Colors.grey),
              ),
            ),

          // Post Actions
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                _buildPostAction(
                  Icons.favorite_border,
                  '${post['likes'] ?? 0}',
                ),
                const SizedBox(width: 24),
                _buildPostAction(
                  Icons.comment_outlined,
                  '${post['comments'] ?? 0}',
                ),
                const SizedBox(width: 24),
                _buildPostAction(Icons.share_outlined, 'Share'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildPostAction(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  static Widget _buildProfileStat(String label, dynamic value) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  static Widget _buildChatItem(Map<String, dynamic> chat, Color? primaryColor) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: primaryColor ?? UIFactoryTheme.primaryColor,
        child: Text(chat['name']?[0] ?? 'U'),
      ),
      title: Text(chat['name'] ?? 'User'),
      subtitle: Text(chat['lastMessage'] ?? 'Last message...'),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            chat['time'] ?? '2h',
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          if (chat['unread'] != null && chat['unread'] > 0)
            CircleAvatar(
              radius: 10,
              backgroundColor: primaryColor ?? UIFactoryTheme.primaryColor,
              child: Text(
                chat['unread'].toString(),
                style: const TextStyle(fontSize: 10, color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }

  static Widget _buildQuickAction(String title, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: color),
          const SizedBox(height: 4),
          Text(title, style: TextStyle(color: color, fontSize: 12)),
        ],
      ),
    );
  }

  static Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color),
              const Spacer(),
              Text(title, style: const TextStyle(color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  static Widget _buildTransactionItem(Map<String, dynamic> transaction) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color:
                  (transaction['type'] == 'income' ? Colors.green : Colors.red)
                      .withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              transaction['type'] == 'income'
                  ? Icons.arrow_downward
                  : Icons.arrow_upward,
              color:
                  transaction['type'] == 'income' ? Colors.green : Colors.red,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction['title'] ?? 'Transaction',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  transaction['date'] ?? 'Today',
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          Text(
            '${transaction['type'] == 'income' ? '+' : '-'}\$${transaction['amount'] ?? '0.00'}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color:
                  transaction['type'] == 'income' ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildContactItem(
      Map<String, dynamic> contact, Color? primaryColor) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor:
                (primaryColor ?? UIFactoryTheme.primaryColor).withOpacity(0.1),
            child: Text(
              contact['name']?[0] ?? 'U',
              style: TextStyle(
                color: primaryColor ?? UIFactoryTheme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            contact['name'] ?? 'User',
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  static Widget _buildCardItem(Map<String, dynamic> card, Color? primaryColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            _getCardColor(card['type']).withOpacity(0.8),
            _getCardColor(card['type']),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                card['type'],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                card['bank'],
                style: const TextStyle(color: Colors.white70),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            card['number'],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Card Holder',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    card['holder'],
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Expires',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    card['expiry'],
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Color _getCardColor(String type) {
    switch (type.toLowerCase()) {
      case 'visa':
        return Colors.blue;
      case 'mastercard':
        return Colors.orange;
      case 'amex':
        return Colors.green;
      default:
        return Colors.purple;
    }
  }

  static Widget _buildHealthcareInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey),
        const SizedBox(width: 8),
        Text(text),
      ],
    );
  }

  static Widget _buildHealthStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color),
              ),
              const Spacer(),
              const Icon(Icons.more_vert, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildAppointmentItem(
      Map<String, dynamic> appointment, Color? primaryColor) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: (primaryColor ?? UIFactoryTheme.primaryColor)
                      .withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(
                  Icons.medical_services,
                  color: primaryColor ?? UIFactoryTheme.primaryColor,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appointment['doctor'] ?? 'Dr. Smith',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(appointment['specialty'] ?? 'General Practitioner'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildHealthcareInfoRow(
            Icons.calendar_today,
            appointment['date'] ?? 'Today, 10:00 AM',
          ),
          const SizedBox(height: 8),
          _buildHealthcareInfoRow(
            Icons.location_on,
            appointment['location'] ?? 'City Medical Center',
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text('Cancel'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        primaryColor ?? UIFactoryTheme.primaryColor,
                  ),
                  child: const Text('Reschedule'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _buildCourseCard(
      Map<String, dynamic> course, Color? primaryColor) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.school, size: 40, color: Colors.grey),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course['title'] ?? 'Course Title',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(course['instructor'] ?? 'Instructor Name'),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: course['progress'] ?? 0.3,
                  backgroundColor: Colors.grey[200],
                  color: primaryColor ?? UIFactoryTheme.primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildLessonItem(
      Map<String, dynamic> lesson, Color? primaryColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: (primaryColor ?? UIFactoryTheme.primaryColor)
                  .withOpacity(0.1),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Icon(
              lesson['isCompleted'] == true ? Icons.check : Icons.play_arrow,
              color: primaryColor ?? UIFactoryTheme.primaryColor,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lesson['title'] ?? 'Lesson Title',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '${lesson['duration'] ?? '10'} min',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildRestaurantCard(
      Map<String, dynamic> restaurant, Color? primaryColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            child: const Center(
              child: Icon(Icons.restaurant, size: 50, color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant['name'] ?? 'Restaurant Name',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star, size: 16, color: Colors.amber),
                    Text(' ${restaurant['rating'] ?? '4.5'}'),
                    const SizedBox(width: 8),
                    Text(
                      restaurant['cuisine'] ?? 'Various Cuisine',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.delivery_dining, size: 16),
                    Text(
                      ' ${restaurant['deliveryTime'] ?? '20-30'} min',
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.attach_money, size: 16),
                    Text(
                      ' ${restaurant['priceLevel'] ?? ''}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildMenuItem(Map<String, dynamic> item, Color? primaryColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.fastfood, size: 40, color: Colors.grey),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['name'] ?? 'Menu Item',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  item['description'] ?? 'Delicious food item',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${item['price'] ?? '9.99'}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              IconButton(
                icon: const Icon(Icons.add),
                color: primaryColor ?? UIFactoryTheme.primaryColor,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _buildDestinationCard(
      Map<String, dynamic> destination, Color? primaryColor) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            child: const Center(
              child: Icon(Icons.place, size: 50, color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  destination['name'] ?? 'Destination',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, size: 16, color: Colors.amber),
                    Text(' ${destination['rating'] ?? '4.5'}'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildHotelCard(
      Map<String, dynamic> hotel, Color? primaryColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            child: Stack(
              children: [
                const Center(
                  child: Icon(Icons.hotel, size: 50, color: Colors.grey),
                ),
                Positioned(
                  bottom: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star, size: 16, color: Colors.amber),
                        Text(
                          ' ${hotel['rating'] ?? '4.5'}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotel['name'] ?? 'Hotel Name',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16),
                    Text(
                      ' ${hotel['distance'] ?? '1.2'} km from center',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      '\$${hotel['price'] ?? '120'}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const Text(
                      ' / night',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildBookingItem(
      Map<String, dynamic> booking, Color? primaryColor) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.hotel, size: 40, color: Colors.grey),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      booking['hotel'] ?? 'Hotel Name',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      booking['dates'] ?? 'Jun 10 - Jun 15, 2023',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text('View Details'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        primaryColor ?? UIFactoryTheme.primaryColor,
                  ),
                  child: const Text('Check In'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _buildPropertyCard(
      Map<String, dynamic> property, Color? primaryColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            child: Stack(
              children: [
                const Center(
                  child: Icon(Icons.home, size: 60, color: Colors.grey),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: IconButton(
                    icon: const Icon(Icons.favorite_border),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '\$${property['price'] ?? '450,000'}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  property['address'] ?? '123 Main St, City',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.bed, size: 16),
                    Text(' ${property['bedrooms'] ?? '3'}'),
                    const SizedBox(width: 16),
                    const Icon(Icons.bathtub, size: 16),
                    Text(' ${property['bathrooms'] ?? '2'}'),
                    const SizedBox(width: 16),
                    const Icon(Icons.square_foot, size: 16),
                    Text(' ${property['area'] ?? '1,200'} sqft'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildWorkoutCard(
      Map<String, dynamic> workout, Color? primaryColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: (primaryColor ?? UIFactoryTheme.primaryColor)
                  .withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              _getWorkoutIcon(workout['type']),
              color: primaryColor ?? UIFactoryTheme.primaryColor,
              size: 40,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  workout['name'] ?? 'Workout Name',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${workout['duration'] ?? '30'} min • ${workout['level'] ?? 'Intermediate'}',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.play_circle_fill),
            color: primaryColor ?? UIFactoryTheme.primaryColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  static IconData _getWorkoutIcon(String type) {
    switch (type.toLowerCase()) {
      case 'cardio':
        return Icons.directions_run;
      case 'strength':
        return Icons.fitness_center;
      case 'yoga':
        return Icons.self_improvement;
      case 'hiit':
        return Icons.timer;
      default:
        return Icons.sports;
    }
  }

  static Widget _buildFitnessStatCard(
    String title,
    String value,
    IconData icon,
    Color? color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color?.withOpacity(0.1) ?? Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Icon(
              icon,
              color: color ?? Colors.grey,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildSongItem(Map<String, dynamic> song, Color? primaryColor) {
    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(Icons.music_note, color: Colors.grey),
      ),
      title: Text(song['title'] ?? 'Song Title'),
      subtitle: Text(song['artist'] ?? 'Artist Name'),
      trailing: IconButton(
        icon: const Icon(Icons.more_vert),
        onPressed: () {},
      ),
    );
  }

  static Widget _buildPlaylistCard(
      Map<String, dynamic> playlist, Color? primaryColor) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: (primaryColor ?? UIFactoryTheme.primaryColor)
                  .withOpacity(0.1),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            child: const Center(
              child: Icon(Icons.music_note, size: 50, color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  playlist['name'] ?? 'Playlist',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${playlist['songs'] ?? '12'} songs',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildDefaultScreen(
    String screenType,
    Map<String, dynamic> data,
    Map<String, Function> callbacks,
    String theme,
    Color? primaryColor,
    Color? backgroundColor,
  ) {
    return Scaffold(
      backgroundColor: backgroundColor ?? UIFactoryTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor ?? UIFactoryTheme.primaryColor,
        title: Text(screenType.replaceAll('_', ' ').toUpperCase()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.construction,
              size: 100,
              color: primaryColor ?? UIFactoryTheme.primaryColor,
            ),
            const SizedBox(height: 24),
            Text(
              'Screen: $screenType',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'This screen is under construction.\nComing soon with full functionality!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  // ==================== DUMMY DATA ====================

  static List<Map<String, dynamic>> _getDummyProducts() {
    return [
      {
        'name': 'Wireless Headphones',
        'price': '99.99',
        'originalPrice': '149.99',
        'rating': 4,
        'reviews': 128,
        'description':
            'High-quality wireless headphones with noise cancellation',
      },
      {
        'name': 'Smart Watch',
        'price': '299.99',
        'rating': 5,
        'reviews': 256,
        'description': 'Feature-rich smartwatch with health monitoring',
      },
      {
        'name': 'Bluetooth Speaker',
        'price': '79.99',
        'originalPrice': '99.99',
        'rating': 4,
        'reviews': 87,
        'description': 'Portable speaker with 20-hour battery life',
      },
      {
        'name': 'Phone Case',
        'price': '19.99',
        'rating': 3,
        'reviews': 42,
        'description': 'Durable case with shock absorption',
      },
    ];
  }

  static List<Map<String, dynamic>> _getDummyCartItems() {
    return [
      {
        'name': 'Wireless Headphones',
        'price': '99.99',
        'quantity': 1,
      },
      {
        'name': 'Smart Watch',
        'price': '299.99',
        'quantity': 2,
      },
    ];
  }

  static double _calculateTotal(List<Map<String, dynamic>> cartItems) {
    double total = 0.0;
    for (var item in cartItems) {
      final price = double.tryParse(item['price']?.toString() ?? '0.0') ?? 0.0;
      final quantity = item['quantity'] ?? 1;
      total += price * quantity;
    }
    return total;
  }

  static List<Map<String, dynamic>> _getDummyPosts() {
    return [
      {
        'author': 'John Doe',
        'time': '2h ago',
        'content': 'Just finished an amazing workout! Feeling great 💪',
        'likes': 24,
        'comments': 5,
        'hasImage': true,
      },
      {
        'author': 'Jane Smith',
        'time': '4h ago',
        'content': 'Beautiful sunset today! Nature never fails to amaze me 🌅',
        'likes': 67,
        'comments': 12,
        'hasImage': true,
      },
      {
        'author': 'Mike Johnson',
        'time': '6h ago',
        'content': 'Working on a new project. Excited to share it soon!',
        'likes': 15,
        'comments': 3,
        'hasImage': false,
      },
    ];
  }

  static List<Map<String, dynamic>> _getDummyChats() {
    return [
      {
        'name': 'Sarah Wilson',
        'lastMessage': 'Hey, how are you doing?',
        'time': '2h ago',
        'unread': 3,
      },
      {
        'name': 'Tech Support',
        'lastMessage': 'Your issue has been resolved',
        'time': 'Yesterday',
        'unread': 0,
      },
      {
        'name': 'Family Group',
        'lastMessage': 'Mom: Dinner at 7pm tonight',
        'time': '3d ago',
        'unread': 12,
      },
    ];
  }

  static List<Map<String, dynamic>> _getDummyTransactions() {
    return [
      {
        'title': 'Salary Deposit',
        'date': 'Today',
        'amount': '2500.00',
        'type': 'income',
      },
      {
        'title': 'Grocery Shopping',
        'date': 'Yesterday',
        'amount': '85.50',
        'type': 'expense',
      },
      {
        'title': 'Coffee Shop',
        'date': '2 days ago',
        'amount': '12.99',
        'type': 'expense',
      },
    ];
  }

  static List<Map<String, dynamic>> _getDummyContacts() {
    return [
      {'name': 'Alice'},
      {'name': 'Bob'},
      {'name': 'Charlie'},
      {'name': 'Diana'},
      {'name': 'Eve'},
    ];
  }

  static List<Map<String, dynamic>> _getDummyCards() {
    return [
      {
        'type': 'VISA',
        'bank': 'Chase',
        'number': '•••• 4242',
        'holder': 'John Doe',
        'expiry': '05/25',
      },
      {
        'type': 'MasterCard',
        'bank': 'Bank of America',
        'number': '•••• 5555',
        'holder': 'John Doe',
        'expiry': '12/24',
      },
    ];
  }

  static List<Map<String, dynamic>> _getDummyAppointments() {
    return [
      {
        'doctor': 'Dr. Sarah Johnson',
        'specialty': 'Cardiologist',
        'date': 'Today, 2:30 PM',
        'location': 'City Medical Center',
      },
      {
        'doctor': 'Dr. Michael Brown',
        'specialty': 'Dermatologist',
        'date': 'Tomorrow, 10:00 AM',
        'location': 'Skin Care Clinic',
      },
    ];
  }

  static List<Map<String, dynamic>> _getDummyCourses() {
    return [
      {
        'title': 'Introduction to Flutter',
        'instructor': 'Google Team',
        'progress': 0.3,
      },
      {
        'title': 'Advanced UI Design',
        'instructor': 'Jane Smith',
        'progress': 0.8,
      },
      {
        'title': 'Machine Learning Basics',
        'instructor': 'Andrew Ng',
        'progress': 0.1,
      },
    ];
  }

  static List<Map<String, dynamic>> _getDummyLessons() {
    return [
      {
        'title': 'Getting Started',
        'duration': '10',
        'isCompleted': true,
      },
      {
        'title': 'Widgets Basics',
        'duration': '15',
        'isCompleted': true,
      },
      {
        'title': 'State Management',
        'duration': '20',
        'isCompleted': false,
      },
      {
        'title': 'Networking',
        'duration': '15',
        'isCompleted': false,
      },
    ];
  }

  static List<Map<String, dynamic>> _getDummyRestaurants() {
    return [
      {
        'name': 'Burger Palace',
        'rating': '4.5',
        'cuisine': 'American',
        'deliveryTime': '20-30',
        'priceLevel': '\$',
      },
      {
        'name': 'Sushi World',
        'rating': '4.8',
        'cuisine': 'Japanese',
        'deliveryTime': '30-45',
        'priceLevel': '\$\$',
      },
    ];
  }

  static List<Map<String, dynamic>> _getDummyMenuItems() {
    return [
      {
        'name': 'Cheeseburger',
        'description': 'Classic cheeseburger with fries',
        'price': '9.99',
      },
      {
        'name': 'Chicken Sandwich',
        'description': 'Grilled chicken with avocado',
        'price': '8.99',
      },
    ];
  }

  static List<Map<String, dynamic>> _getDummyDestinations() {
    return [
      {
        'name': 'Paris',
        'rating': '4.7',
      },
      {
        'name': 'Tokyo',
        'rating': '4.9',
      },
      {
        'name': 'New York',
        'rating': '4.5',
      },
    ];
  }

  static List<Map<String, dynamic>> _getDummyBookings() {
    return [
      {
        'hotel': 'Grand Hotel',
        'dates': 'Jun 10 - Jun 15, 2023',
      },
      {
        'hotel': 'Beach Resort',
        'dates': 'Jul 5 - Jul 12, 2023',
      },
    ];
  }

  static List<Map<String, dynamic>> _getDummyProperties() {
    return [
      {
        'price': '450,000',
        'address': '123 Main St, City',
        'bedrooms': '3',
        'bathrooms': '2',
        'area': '1,200',
      },
      {
        'price': '650,000',
        'address': '456 Oak Ave, Town',
        'bedrooms': '4',
        'bathrooms': '3',
        'area': '1,800',
      },
    ];
  }

  static List<Map<String, dynamic>> _getDummyPropertyFeatures() {
    return [
      {
        'name': '3 Bedrooms',
        'icon': Icons.bed,
      },
      {
        'name': '2 Bathrooms',
        'icon': Icons.bathtub,
      },
      {
        'name': 'Garage',
        'icon': Icons.garage,
      },
      {
        'name': 'Garden',
        'icon': Icons.yard,
      },
    ];
  }

  static List<Map<String, dynamic>> _getDummyWorkouts() {
    return [
      {
        'name': 'Morning Yoga',
        'type': 'Yoga',
        'duration': '30',
        'level': 'Beginner',
      },
      {
        'name': 'HIIT Burn',
        'type': 'HIIT',
        'duration': '20',
        'level': 'Advanced',
      },
    ];
  }

  static List<Map<String, dynamic>> _getDummySongs() {
    return [
      {
        'title': 'Blinding Lights',
        'artist': 'The Weeknd',
        'duration': '3:20',
      },
      {
        'title': 'Save Your Tears',
        'artist': 'The Weeknd',
        'duration': '3:35',
      },
    ];
  }

  static List<Map<String, dynamic>> _getDummyPlaylists() {
    return [
      {
        'name': 'Workout Mix',
        'songs': '15',
      },
      {
        'name': 'Chill Vibes',
        'songs': '24',
      },
    ];
  }

  static IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'electronics':
        return Icons.devices;
      case 'fashion':
        return Icons.checkroom;
      case 'home':
        return Icons.home;
      case 'sports':
        return Icons.sports;
      case 'books':
        return Icons.book;
      default:
        return Icons.category;
    }
  }
}

/// Factory for creating complete apps with navigation
class CompleteAppFactory {
  static Widget buildApp({
    required List<AppScreen> screens,
    required String theme,
    Color? primaryColor,
    required String navigationStyle,
    required Map<String, dynamic> globalData,
  }) {
    return _CompleteAppWrapper(
      screens: screens,
      theme: theme,
      primaryColor: primaryColor,
      navigationStyle: navigationStyle,
      globalData: globalData,
    );
  }
}

class _CompleteAppWrapper extends StatefulWidget {
  final List<AppScreen> screens;
  final String theme;
  final Color? primaryColor;
  final String navigationStyle;
  final Map<String, dynamic> globalData;

  const _CompleteAppWrapper({
    required this.screens,
    required this.theme,
    this.primaryColor,
    required this.navigationStyle,
    required this.globalData,
  });

  @override
  _CompleteAppWrapperState createState() => _CompleteAppWrapperState();
}

class _CompleteAppWrapperState extends State<_CompleteAppWrapper> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CompleteScreenFactory.buildScreen(
        screenType: widget.screens[_currentIndex].type,
        data: widget.screens[_currentIndex].data,
        callbacks: widget.screens[_currentIndex].callbacks,
        theme: widget.theme,
        primaryColor: widget.primaryColor,
        features: [],
      ),
      bottomNavigationBar: FactoryCurvedNavigation(
        style: widget.navigationStyle,
        items: widget.screens
            .map(
              (screen) =>
                  FactoryNavItem(icon: screen.icon, label: screen.title),
            )
            .toList(),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedColor: widget.primaryColor,
      ),
    );
  }
}
