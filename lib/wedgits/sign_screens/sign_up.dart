import 'package:flutter/material.dart';
import 'package:stylish/wedgits/welcome/home_screen.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    // The Purple color used for the button and accents
    const Color primaryPurple = Color(0xFF8A2BE2);

    return Scaffold(

      // Use Stack to place the body and the persistent bottom button
      body: Stack(
        children: [
          // Main Scrollable Content
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Spacing from the top (for status bar and app bar elements)
                const SizedBox(height: 60),

                // Back Arrow Button
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),

                const SizedBox(height: 20),

                // "Sign Up" Title
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 60),

                // --- Input Fields ---

                // 1. Username Field
                _buildValidatedTextField(
                  label: 'Username',
                  initialValue: '',
                  isValid: true,
                ),

                const SizedBox(height: 20),

                // 2. Password Field
                _buildPasswordTextField(
                  label: 'Password',
                  initialValue: '',
                  status: 'Strong',
                ),

                const SizedBox(height: 20),

                // 3. Email Address Field
                _buildValidatedTextField(
                  label: 'Email Address',
                  initialValue: '',
                  isValid: true,
                ),

                const SizedBox(height: 30),

                // --- Remember Me Toggle ---

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Remember me',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Switch(
                      value: _rememberMe,
                      onChanged: (bool newValue) {
                        setState(() {
                          _rememberMe = newValue;
                        });
                      },
                      activeColor: primaryPurple, // Active color for the switch
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: Colors.grey.shade700,
                    ),
                  ],
                ),

                // Add space at the bottom equal to the height of the button + padding
                const SizedBox(height: 100),
              ],
            ),
          ),

          // --- Persistent Bottom Button ---

          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: double.infinity,
              height: 70, // Height matching the visual
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryPurple, // Solid purple background
                  shape: const RoundedRectangleBorder(), // Square edges
                  elevation: 0, // No shadow
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const ShoppingApp()));
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for standard text fields with a validation checkmark
  Widget _buildValidatedTextField({
    required String label,
    required String initialValue,
    required bool isValid,
  }) {
    return TextFormField(
      initialValue: initialValue,
      style: const TextStyle(color: Colors.white, fontSize: 16),
      decoration: InputDecoration(
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelStyle: const TextStyle(color: Colors.white70),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white70),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF8A2BE2), width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white70),
        ),
        suffixIcon: isValid
            ? const Icon(Icons.check, color: Color(0xFF5CB85C), size: 18)
            : null,
      ),
    );
  }

  // Helper widget for the password field with a status text
  Widget _buildPasswordTextField({
    required String label,
    required String initialValue,
    required String status,
  }) {
    return TextFormField(
      initialValue: initialValue,
      obscureText: true,
      style: const TextStyle(color: Colors.white, fontSize: 16),
      decoration: InputDecoration(
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelStyle: const TextStyle(color: Colors.white70),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white70),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF8A2BE2), width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white70),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Text(
            status,
            style: const TextStyle(
              color: Color(0xFF5CB85C), // Green text for 'Strong'
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}