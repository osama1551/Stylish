import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stylish/wedgits/sign_screens/sign_in.dart';
import 'package:stylish/wedgits/sign_screens/sign_up.dart';
// Add this to your pubspec.yaml

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // The "Let's Get Started" Title
            const Text(
              "Let's Get Started",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 100), // Spacing to push content down

            // --- Social Media Sign-in Buttons ---
            // Facebook Button
            SocialSignInButton(
              text: 'Facebook',
              color: const Color(0xFF4267B2),
              icon: FontAwesomeIcons.facebookF,
              onPressed: () {},
            ),
            const SizedBox(height: 16),

            // Twitter Button
            SocialSignInButton(
              text: 'Twitter',
              color: const Color(0xFF1DA1F2),
              icon: FontAwesomeIcons.twitter,
              onPressed: () {},
            ),
            const SizedBox(height: 16),

            // Google Button
            SocialSignInButton(
              text: 'Google',
              color: const Color(0xFFDB4437),
              icon: FontAwesomeIcons.google,
              onPressed: () {},
            ),
            // --- End Social Media Sign-in Buttons ---

            const Spacer(), // Pushes content towards the top and bottom

            // Already have an account text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Already have an account?',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
                  },
                  child: const Text(
                    'Signin',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline, // Add underline for link-like appearance
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      // Fixed bottom "Create an Account" button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: SizedBox(
          height: 80, // Height for the bottom bar button
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8A2BE2), // Purple color
              shape: const RoundedRectangleBorder(), // Remove border radius
              padding: const EdgeInsets.symmetric(vertical: 20),
            ),
            child: const Text(
              'Create an Account',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Custom widget for the social sign-in buttons
class SocialSignInButton extends StatelessWidget {
  final String text;
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;

  const SocialSignInButton({
    required this.text,
    required this.color,
    required this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, size: 24),
          const SizedBox(width: 10),
          Text(text),
        ],
      ),
    );
  }
}