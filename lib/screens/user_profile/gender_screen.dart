import 'package:dating_app/utils/colors.dart';
import 'package:dating_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class GenderScreen extends StatefulWidget {
  static String routeName = '/gender';
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  int _selectedButtonIndex = -1; // -1 means no button is selected

  List<String> buttonLabels = ['Woman', 'Man', 'Choose another'];
  // Function to handle button selection
  void _selectButton(int index) {
    setState(() {
      _selectedButtonIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "I am a",
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 50),
              Column(
                children: List.generate(3, (index) {
                  return Column(
                    children: [
                      ElevatedButton(
                        onPressed: () => _selectButton(index),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _selectedButtonIndex == index
                              ? Colors.red
                              : Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          minimumSize: const Size(double.infinity, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(
                              color: HexColor("#E8E6EA"),
                              width: 1,
                            ), // Adding a grey border
                          ),
                          shadowColor: Colors.transparent,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: buttonLabels[index], // Change the label based on index
                                  style: TextStyle(
                                    color: _selectedButtonIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: _selectedButtonIndex == index
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  );
                }),
              ),
              const SizedBox(height: 270),
              CustomButton(
                onTap: () {},
                text: "Continue",
                backgroundColor: primaryRed,
                textColor: text2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
