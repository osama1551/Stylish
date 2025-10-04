import 'package:flutter/material.dart';
import 'dart:async'; // Required for Timer
import 'package:stylish/wedgits/sign_screens/sign_in.dart';
import 'package:stylish/wedgits/sign_screens/reset_password.dart';
class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});
  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}
class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  // Verification code digits
  final List<String> codeDigits = ['', '', '', '']; // Pre-filled as in the image
  int _secondsRemaining = 20;
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    _startTimer();
  }
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        _timer?.cancel();
        // Here you would typically enable the resend button functionality
      }
    });
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // Get screen width for responsive sizing
    final double screenWidth = MediaQuery.of(context).size.width;
    // Calculate a size for the code boxes (roughly 1/5th of the screen width)
    final double boxSize = screenWidth / 4.6 - 6 ;
    // Adjusted for spacing
    return Scaffold(
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

        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0, bottom: 40.0),
                    child: Text(
                      'Verification Code',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // Custom illustration section
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: SizedBox(
                      width: 250,
                      height: 200,
                      child: Image.asset(
                        'assets/images/cloud_lock.png', // Placeholder: You'd need to add this image asset
                        // For a quick non-asset visual approximation, you could use:
                        // Stack(
                        //   alignment: Alignment.center,
                        //   children: [
                        //     Icon(Icons.cloud, color: Colors.deepPurple, size: 150),
                        //     Icon(Icons.lock, color: Colors.amber, size: 80),
                        //   ],
                        // )
                      ),
                    ),
                  ),
                  // Code Input Boxes
                  Padding(

                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: codeDigits.asMap().entries.map((entry) {
                        int index = entry.key;
                        String digit = entry.value;
                        return VerificationCodeBox(

                          digit: digit,
                          boxSize: boxSize,
                          index: index,
                          onDigitChanged: (newDigit) {
                            setState(() {
                              codeDigits[index] = newDigit;
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  // Timer and Resend Link
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0, bottom: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '00:${_secondsRemaining.toString().padLeft(2, '0')} ',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                        TextButton(
                          onPressed: _secondsRemaining == 0 ? () {
                            // Implement resend code logic here
                            setState(() {
                              _secondsRemaining = 20; // Reset timer
                            });
                            _startTimer();
                          } : null, // Disable button if timer is running
                          child: const Text(
                            'resend confirmation code.',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                              decoration: TextDecoration.underline,
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
          // Confirm Code Button (Fixed at the bottom)
          SizedBox(
            width: double.infinity,
            height: 95,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const NewPasswordScreen()));
                // Handle confirmation logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6A1B9A), // Purple background
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero, // Make edges sharp
                ),
                elevation: 0,
              ),
              child: const Text(
                'Confirm Code',
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

class VerificationCodeBox extends StatefulWidget {
  final String digit;
  final double boxSize;
  final int index;
  final Function(String) onDigitChanged;

  const VerificationCodeBox({
    required this.digit,
    required this.boxSize,
    required this.index,
    required this.onDigitChanged,
    super.key,
  });

  @override
  State<VerificationCodeBox> createState() => _VerificationCodeBoxState();
}

class _VerificationCodeBoxState extends State<VerificationCodeBox> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.digit);
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusNode.requestFocus();
      },
      child: Container(
        width: widget.boxSize,
        height: widget.boxSize * 1.6, // Make boxes taller
        decoration: BoxDecoration(
          color: Colors.black, // Black background as shown in the image
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.white, // White border as shown in the image
            width: 1,

          ),
        ),
        child: TextField(
          controller: _controller,
          focusNode: _focusNode,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
            style: const TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 2.3, // Remove extra line height
            ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            counterText: '',
            contentPadding: EdgeInsets.zero,
          ),
          onChanged: (value) {
            // Only allow digits
            if (value.isNotEmpty && !RegExp(r'[0-9]').hasMatch(value)) {
              _controller.text = '';
              return;
            }
            widget.onDigitChanged(value);
            // Auto-move to next field
            if (value.isNotEmpty && widget.index < 3) {
              // Find next focus node
              FocusScope.of(context).nextFocus();
            } else if (value.isEmpty && widget.index > 0) {
              // Move to previous field on backspace
              FocusScope.of(context).previousFocus();
            }
          },
        ),
      ),
    );
  }
}

// NOTE: To display the exact illustration, you would need to:
// 1. Save the illustration as an image (e.g., cloud_lock.png).
// 2. Place it in your Flutter project's 'assets' folder.
// 3. Add the asset folder reference to your `pubspec.yaml` file.