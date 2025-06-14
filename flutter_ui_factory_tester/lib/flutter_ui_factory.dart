import 'package:flutter/material.dart';
import 'package:flutter_ui_factory/flutter_ui_factory.dart';

void main() {
  runApp(const TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder:
            (context) => Scaffold(
              appBar: AppBar(title: const Text('Package Tester')),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Test button from your package
                    UIFactory.getButton(
                      style: 'primary',
                      text: 'Test Button',
                      onPressed: () => debugPrint('Button pressed!'),
                    ),

                    const SizedBox(height: 20),

                    // Test screen navigation
                    ElevatedButton(
                      onPressed: () {
                        try {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (_) => UIFactory.createEcommerceScreen(
                                    type: 'home',
                                    theme: 'modern', // Add required parameters
                                  ),
                            ),
                          );
                        } catch (e) {
                          debugPrint('Error: $e');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error: ${e.toString()}')),
                          );
                        }
                      },
                      child: const Text('Open E-commerce Screen'),
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
