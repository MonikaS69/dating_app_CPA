import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onscreen_num_keyboard/onscreen_num_keyboard.dart';

class OtpScreens extends StatefulWidget {
  static String routeName = '/otpScreen';

  const OtpScreens({super.key});

  @override
  State<OtpScreens> createState() => _OtpScreensState();
}

class _OtpScreensState extends State<OtpScreens> {
  final List<TextEditingController> otpControllers =
      List.generate(4, (_) => TextEditingController());

  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  int _currentFieldIndex = 0; // Keeps track of the active OTP field.

  /// Function to handle keyboard tap and update the OTP fields
  void onKeyboardTap(String value) {
    setState(() {
      if (_currentFieldIndex < 4) {
        otpControllers[_currentFieldIndex].text = value; // Set value to field
        _currentFieldIndex++;
        if (_currentFieldIndex < 4) {
          focusNodes[_currentFieldIndex].requestFocus(); // Move to next field
        } else {
          // When all fields are filled, navigate to next screen
          _checkAndNavigate();
        }
      }
    });
  }

  /// Handle backspace (Delete) from the numeric keyboard
  void onBackspaceTap() {
    setState(() {
      if (_currentFieldIndex > 0) {
        _currentFieldIndex--;
        otpControllers[_currentFieldIndex].clear(); // Clear current field
        focusNodes[_currentFieldIndex].requestFocus(); // Focus previous field
      }
    });
  }

  /// Check all fields and navigate to next screen
  void _checkAndNavigate() {
    final otpCode = otpControllers.map((e) => e.text).join(); // Combine all input
    if (otpCode.length == 4) {
      // Replace with your navigation logic here
      Navigator.pushNamed(context, '/userpf'); // Route to next screen
    }
  }

  @override
  void dispose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.redAccent,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 24),
              // Timer and title
              Text(
                '00:42',
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Type the verification code\nwe’ve sent you',
                textAlign: TextAlign.center,
                style: GoogleFonts.inclusiveSans(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 32),
              // OTP Input Fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  4,
                  (index) => SizedBox(
                    width: 60,
                    child: TextField(
                      controller: otpControllers[index],
                      focusNode: focusNodes[index],
                      readOnly: true,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(color: Colors.redAccent),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // Resend Code
              TextButton(
                onPressed: () {
                  // Add logic to resend OTP here
                },
                child: const Text(
                  'Send again',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 16,
                  ),
                ),
              ),
              // Custom On-Screen Numeric Keyboard
              SizedBox(height: 30,),
              NumericKeyboard(
                onKeyboardTap: onKeyboardTap,
                textStyle:
                    const TextStyle(fontSize: 25.0, color: Colors.black),
                rightButtonFn: onBackspaceTap,
                rightIcon: const Icon(
                  Icons.backspace,
                  color: Colors.red,
                ),
                leftButtonFn: () {
                  // Manual navigation (optional)
                  _checkAndNavigate();
                },
                leftIcon: const Icon(
                  Icons.check,
                  color: Colors.red,
                ),
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              )
            ],
          ),
        ),
      ),
    );
  }
}
