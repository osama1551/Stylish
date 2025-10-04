import 'package:flutter/material.dart';
import 'package:stylish/wedgits/sign_screens/verification_code.dart';


class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Note: To display the actual cloud/lock image, you would need to add the asset
    // to your project's `pubspec.yaml` and assets folder.
    // For this example, we'll use a placeholder or a simple Icon/Container to represent the space.
    Widget cloudLockImage = Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: const Color(0xFF5A4FCF), // Placeholder color for the cloud
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Simplified representation of the lock on the cloud
          Container(
            width: 80,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Icon(Icons.lock, color: Colors.brown, size: 30),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
           Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 20), // Add some top padding
                  const Text(
                    'Forgot Password',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Center(
                    child: Image.asset('assets/images/cloud_lock.png')
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    'Email Address',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  TextFormField(
                    initialValue: 'osama.bhaa@example.com',
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                      isDense: true,
                      // The label text 'Email Address' is handled by a separate Text widget above
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Center(
                    child: Text(
                      'Please write your email to receive a confirmation code to set a new password.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50), // Add bottom padding for better spacing
                ],
              ),
            ),
          ),
        ],
      ),
      // Persistent bottom section for the button
      bottomNavigationBar: SizedBox(
        height: 80, // Height to match the appearance
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xFF6A1B9A), // Purple background
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero, // Square corners
            ),
            padding: const EdgeInsets.symmetric(vertical: 20),
          ),
          onPressed: () {
            // Navigate to verification code screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const VerificationCodeScreen(),
              ),
            );
          },
          child: const Text(
            'Confirm Mail',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}