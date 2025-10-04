import 'package:flutter/material.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with the back arrow
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
            // Handle back button press
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Title
          const Padding(
            padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 60.0),
            child: Text(
              'New Password',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          // Password Fields Container
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // 1. Password Field
                const Text(
                  'Password',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                TextFormField(
                  initialValue: 'HJ@#9783kja', // Example placeholder text
                  obscureText: true, // Hide password input
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(height: 30), // Spacing between fields

                // 2. Confirm Password Field
                const Text(
                  'Confirm Password',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                TextFormField(
                  initialValue: 'HJ@#9783kja', // Example placeholder text
                  obscureText: true, // Hide password input
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),

          // Instruction Text
          const Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'Please write your new password.',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),

          // Confirm Password Button (Fixed at the bottom)
          SizedBox(
            width: double.infinity,
            height: 85,
            child: ElevatedButton(
              onPressed: () {
                // Handle password confirmation logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6A1B9A), // Purple background
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero, // Make edges sharp
                ),
                elevation: 0,
                padding: const EdgeInsets.all(0), // Remove default padding
              ),
              child: const Text(
                'Confirm Password',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}