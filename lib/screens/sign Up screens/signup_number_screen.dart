import 'package:dating_app/utils/colors.dart';
import 'package:dating_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class NumberSignUpScreen extends StatefulWidget {
  static String routeName = '/signUpNumber';
  const NumberSignUpScreen({super.key});

  @override
  State<NumberSignUpScreen> createState() => _NumberSignUpScreenState();
}

class _NumberSignUpScreenState extends State<NumberSignUpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  PhoneNumber number = PhoneNumber(isoCode: 'VN');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              SizedBox(
                height: 50,
              ),
              Text(
                'My mobile',
                style: GoogleFonts.inclusiveSans(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              // Subtitle
              Text(
                'Please enter your valid phone number. We will send you a 4-digit code to verify your account.',
                style: GoogleFonts.inclusiveSans(
                  fontSize: 15,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 32),
              // Phone Number Input
              InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {
                  print(number.phoneNumber);
                },
                onInputValidated: (bool value) {
                  print(value);
                },
                selectorConfig: SelectorConfig(
                    selectorType: PhoneInputSelectorType.DIALOG,
                    useBottomSheetSafeArea: true,
                    showFlags: true),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: TextStyle(color: Colors.black),
                initialValue: number,
                textFieldController: controller,
                formatInput: true,
                keyboardType: TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                inputBorder: OutlineInputBorder(),
                onSaved: (PhoneNumber number) {
                  print('On Saved: $number');
                },
              ),
              SizedBox(height: 32),
              CustomButton(
                onTap: () {
                  formKey.currentState?.save();
                  Navigator.pushNamed(context, "/otpScreen");
                },
                text: "Countinue",
                backgroundColor: primaryRed,
                textColor: text1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
