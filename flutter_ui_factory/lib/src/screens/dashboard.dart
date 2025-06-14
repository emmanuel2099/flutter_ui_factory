import 'package:flutter/material.dart';

import '../../flutter_ui_factory.dart';
import '../card/card.dart';

/// A factory dashboard widget with various types.
class FactoryDashboard extends StatelessWidget {
  final String type;
  final String userName;
  final Map<String, dynamic> data;
  final List<Widget> widgets;
  final Color? primaryColor;
  final Color? backgroundColor;
  final bool animated;

  const FactoryDashboard({
    Key? key,
    required this.type,
    required this.userName,
    required this.data,
    required this.widgets,
    this.primaryColor,
    this.backgroundColor,
    this.animated = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = this.primaryColor ?? UIFactoryTheme.primaryColor;
    final backgroundColor =
        this.backgroundColor ?? UIFactoryTheme.backgroundColor;

    switch (type.toLowerCase()) {
      case 'finance':
        return _buildFinanceDashboard(context, primaryColor, backgroundColor);
      case 'analytics':
        return _buildAnalyticsDashboard(context, primaryColor, backgroundColor);
      case 'ecommerce':
        return _buildEcommerceDashboard(context, primaryColor, backgroundColor);
      case 'health':
        return _buildHealthDashboard(context, primaryColor, backgroundColor);
      default:
        return _buildDefaultDashboard(context, primaryColor, backgroundColor);
    }
  }

  Widget _buildDefaultDashboard(
    BuildContext context,
    Color primaryColor,
    Color backgroundColor,
  ) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome, $userName',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              Column(
                children: widgets.isNotEmpty
                    ? widgets
                    : _buildPlaceholderWidgets(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFinanceDashboard(
    BuildContext context,
    Color primaryColor,
    Color backgroundColor,
  ) {
    final balance = data['balance'] ?? 12345.67;
    final income = data['income'] ?? 2500.00;
    final expenses = data['expenses'] ?? 1800.00;
    final savings = data['savings'] ?? 700.00;
    final transactions = data['transactions'] as List<Map<String, dynamic>>? ??
        [
          {
            'title': 'Grocery Store',
            'amount': -85.40,
            'date': 'Today',
            'icon': Icons.shopping_basket,
          },
          {
            'title': 'Salary Deposit',
            'amount': 2500.00,
            'date': 'Yesterday',
            'icon': Icons.account_balance,
          },
          {
            'title': 'Restaurant',
            'amount': -45.80,
            'date': '2 days ago',
            'icon': Icons.restaurant,
          },
          {
            'title': 'Electricity Bill',
            'amount': -120.00,
            'date': '3 days ago',
            'icon': Icons.bolt,
          },
        ];

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome back,',
                        style: TextStyle(
                          fontSize: 16,
                          color: UIFactoryTheme.textColor.withOpacity(0.7),
                        ),
                      ),
                      Text(
                        userName,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: primaryColor,
                    child: const Icon(Icons.person, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              FactoryCard(
                style: 'glass',
                color: primaryColor,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Total Balance',
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$${balance.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildFinanceInfoItem(
                          'Income',
                          income,
                          Icons.arrow_upward,
                          Colors.green,
                        ),
                        _buildFinanceInfoItem(
                          'Expenses',
                          expenses,
                          Icons.arrow_downward,
                          Colors.red,
                        ),
                        _buildFinanceInfoItem(
                          'Savings',
                          savings,
                          Icons.savings,
                          Colors.amber,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Recent Transactions',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ...transactions.map(
                (transaction) => _buildTransactionItem(transaction),
              ),
              if (widgets.isNotEmpty) ...widgets,
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildFinanceInfoItem(
    String title,
    double amount,
    IconData icon,
    Color iconColor,
  ) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: iconColor, size: 20),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 12, color: Colors.white70),
        ),
        const SizedBox(height: 4),
        Text(
          '\$${amount.toStringAsFixed(0)}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionItem(Map<String, dynamic> transaction) {
    final amount = transaction['amount'] as double;
    final isPositive = amount > 0;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: UIFactoryTheme.isDarkMode ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isPositive
                  ? Colors.green.withOpacity(0.1)
                  : Colors.red.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              transaction['icon'] as IconData,
              color: isPositive ? Colors.green : Colors.red,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction['title'] as String,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  transaction['date'] as String,
                  style: TextStyle(
                    fontSize: 14,
                    color: UIFactoryTheme.textColor.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${isPositive ? '+' : ''}\$${amount.abs().toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isPositive ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnalyticsDashboard(
    BuildContext context,
    Color primaryColor,
    Color backgroundColor,
  ) {
    final visitors = data['visitors'] ?? 12543;
    final pageViews = data['pageViews'] ?? 45678;
    final bounceRate = data['bounceRate'] ?? 32.5;
    final avgSession = data['avgSession'] ?? '2m 45s';

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Analytics Dashboard'),
        backgroundColor: primaryColor,
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, $userName',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Here\'s your website performance',
                style: TextStyle(
                  fontSize: 16,
                  color: UIFactoryTheme.textColor.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 24),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildAnalyticsCard(
                    'Visitors',
                    visitors.toString(),
                    Icons.people,
                    Colors.blue,
                  ),
                  _buildAnalyticsCard(
                    'Page Views',
                    pageViews.toString(),
                    Icons.visibility,
                    Colors.green,
                  ),
                  _buildAnalyticsCard(
                    'Bounce Rate',
                    '${bounceRate.toStringAsFixed(1)}%',
                    Icons.trending_down,
                    Colors.orange,
                  ),
                  _buildAnalyticsCard(
                    'Avg. Session',
                    avgSession,
                    Icons.timer,
                    Colors.purple,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              FactoryCard(
                style: 'modern',
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Traffic Overview',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          'Chart Placeholder\n(Integrate with charts_flutter)',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (widgets.isNotEmpty) ...widgets,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnalyticsCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return FactoryCard(
      style: 'modern',
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: color, size: 24),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(
                  Icons.trending_up,
                  color: Colors.green,
                  size: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            value,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: UIFactoryTheme.textColor.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEcommerceDashboard(
    BuildContext context,
    Color primaryColor,
    Color backgroundColor,
  ) {
    final totalSales = data['totalSales'] ?? 25430.50;
    final orders = data['orders'] ?? 156;
    final products = data['products'] ?? 89;
    final customers = data['customers'] ?? 1234;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('E-commerce Dashboard'),
        backgroundColor: primaryColor,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good morning,',
                        style: TextStyle(
                          fontSize: 16,
                          color: UIFactoryTheme.textColor.withOpacity(0.7),
                        ),
                      ),
                      Text(
                        userName,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.trending_up, color: Colors.green, size: 16),
                        SizedBox(width: 4),
                        Text(
                          '+12.5%',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              FactoryCard(
                style: 'gradient',
                color: primaryColor,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Total Sales',
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$${totalSales.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Row(
                      children: [
                        Icon(
                          Icons.trending_up,
                          color: Colors.white70,
                          size: 16,
                        ),
                        SizedBox(width: 4),
                        Text(
                          '+15.3% from last month',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: _buildEcommerceMetricCard(
                      'Orders',
                      orders.toString(),
                      Icons.shopping_bag,
                      Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildEcommerceMetricCard(
                      'Products',
                      products.toString(),
                      Icons.inventory,
                      Colors.orange,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildEcommerceMetricCard(
                      'Customers',
                      customers.toString(),
                      Icons.people,
                      Colors.green,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildEcommerceMetricCard(
                      'Conversion',
                      '3.2%',
                      Icons.percent,
                      Colors.purple,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Recent Orders',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildOrderItem('#1234', 'John Doe', '\$89.99', 'Pending'),
              _buildOrderItem('#1235', 'Jane Smith', '\$156.50', 'Shipped'),
              _buildOrderItem('#1236', 'Bob Johnson', '\$45.00', 'Delivered'),
              if (widgets.isNotEmpty) ...widgets,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEcommerceMetricCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return FactoryCard(
      style: 'modern',
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: UIFactoryTheme.textColor.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderItem(
    String orderNumber,
    String customer,
    String amount,
    String status,
  ) {
    Color statusColor;
    switch (status.toLowerCase()) {
      case 'pending':
        statusColor = Colors.orange;
        break;
      case 'shipped':
        statusColor = Colors.blue;
        break;
      case 'delivered':
        statusColor = Colors.green;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: UIFactoryTheme.isDarkMode ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  orderNumber,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  customer,
                  style: TextStyle(
                    fontSize: 14,
                    color: UIFactoryTheme.textColor.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 12,
                    color: statusColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHealthDashboard(
    BuildContext context,
    Color primaryColor,
    Color backgroundColor,
  ) {
    final steps = data['steps'] ?? 8542;
    final calories = data['calories'] ?? 2150;
    final heartRate = data['heartRate'] ?? 72;
    final sleep = data['sleep'] ?? 7.5;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Health Dashboard'),
        backgroundColor: primaryColor,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: primaryColor,
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, $userName',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Let\'s check your health today',
                        style: TextStyle(
                          fontSize: 16,
                          color: UIFactoryTheme.textColor.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildHealthMetricCard(
                    'Steps',
                    steps.toString(),
                    Icons.directions_walk,
                    Colors.blue,
                    '10,000 goal',
                  ),
                  _buildHealthMetricCard(
                    'Calories',
                    calories.toString(),
                    Icons.local_fire_department,
                    Colors.red,
                    'kcal burned',
                  ),
                  _buildHealthMetricCard(
                    'Heart Rate',
                    '$heartRate bpm',
                    Icons.favorite,
                    Colors.pink,
                    'Resting',
                  ),
                  _buildHealthMetricCard(
                    'Sleep',
                    '${sleep}h',
                    Icons.bedtime,
                    Colors.purple,
                    'Last night',
                  ),
                ],
              ),
              const SizedBox(height: 24),
              FactoryCard(
                style: 'modern',
                padding: const EdgeInsets.all(20),
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
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          'Health Chart Placeholder\n(Integrate with fl_chart)',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Quick Actions',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildQuickActionButton(
                      'Log Water',
                      Icons.water_drop,
                      Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildQuickActionButton(
                      'Add Meal',
                      Icons.restaurant,
                      Colors.orange,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildQuickActionButton(
                      'Start Workout',
                      Icons.fitness_center,
                      Colors.green,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildQuickActionButton(
                      'Meditation',
                      Icons.self_improvement,
                      Colors.purple,
                    ),
                  ),
                ],
              ),
              if (widgets.isNotEmpty) ...widgets,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHealthMetricCard(
    String title,
    String value,
    IconData icon,
    Color color,
    String subtitle,
  ) {
    return FactoryCard(
      style: 'modern',
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: color, size: 24),
              if (title == 'Steps')
                Container(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    value: 0.85,
                    backgroundColor: color.withOpacity(0.2),
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                    strokeWidth: 3,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 12,
              color: UIFactoryTheme.textColor.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionButton(String title, IconData icon, Color color) {
    return FactoryCard(
      style: 'modern',
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPlaceholderWidgets(BuildContext context) {
    return [
      FactoryCard(
        style: 'modern',
        padding: const EdgeInsets.all(20),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to your Dashboard',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'This is a customizable dashboard. Add your own widgets to personalize your experience.',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      const SizedBox(height: 16),
      Row(
        children: [
          Expanded(
            child: FactoryCard(
              style: 'modern',
              padding: const EdgeInsets.all(16),
              child: const Column(
                children: [
                  Icon(Icons.analytics, size: 40, color: Colors.blue),
                  SizedBox(height: 8),
                  Text(
                    'Analytics',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: FactoryCard(
              style: 'modern',
              padding: const EdgeInsets.all(16),
              child: const Column(
                children: [
                  Icon(Icons.notifications, size: 40, color: Colors.orange),
                  SizedBox(height: 8),
                  Text(
                    'Notifications',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ];
  }
}
