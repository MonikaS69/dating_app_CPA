import 'package:dating_app/utils/colors.dart';
import 'package:dating_app/widgets/animated_textfield.dart';
import 'package:dating_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UserProfileScreen extends StatefulWidget {
  static String routeName = '/userpf';

  const UserProfileScreen({super.key});
  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  File? _image;

  /// Pick Image using `image_picker`
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Add Profile Details",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Please add your profile details here",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey[200],
                        backgroundImage: _image != null
                            ? FileImage(_image!)
                            : const AssetImage('assets/default_avatar.png')
                                as ImageProvider,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: _pickImage,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.pinkAccent,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: const Icon(Icons.edit, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                //Input Fields
                AnimatedTextField(label: "Name", suffix: null),
                const SizedBox(height: 16),
                AnimatedTextField(label: "Email Address", suffix: null),
                const SizedBox(height: 16),
                _buildTextField('Date of Birth', '14/02/2023',
                    isDatePicker: true),
                const SizedBox(height: 16),
                AnimatedTextField(label: "Enter Address", suffix: null),
                const SizedBox(height: 30),

                // Continue Button
                Center(
                  child: CustomButton(
                    onTap: () {
                      Navigator.popAndPushNamed(context, '/gender');
                    },
                    text: "Continue",
                    backgroundColor: primaryRed,
                    textColor: text2,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Build Input Fields (with optional Date Picker logic)
  Widget _buildTextField(String label, String placeholder,
      {bool isDatePicker = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 6),
        TextFormField(
          readOnly: isDatePicker,
          onTap: isDatePicker ? _showDatePicker : null,
          initialValue: placeholder,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.pinkAccent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.pinkAccent, width: 2),
            ),
            suffixIcon: isDatePicker ? const Icon(Icons.calendar_today) : null,
          ),
        ),
      ],
    );
  }

  /// Show Date Picker Function
  Future<void> _showDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      // You can process the picked date here
      print("Selected Date: ${pickedDate.toLocal()}");
    }
  }
}
