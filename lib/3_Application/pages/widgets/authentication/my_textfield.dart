import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextfield extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  const MyTextfield({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  State<MyTextfield> createState() => _MyTextfieldState();
}

class _MyTextfieldState extends State<MyTextfield> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: TextField(
        controller: widget.controller, // Corrected to use widget.controller
        obscureText: widget.hintText.contains("Password")
            ? obscureText
            : false, // Fix the obscureText logic
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.secondary),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Theme.of(context).colorScheme.inversePrimary,
          filled: true,
          suffixIcon: widget.hintText.contains("Password")
              ? IconButton(
                  icon: Icon(
                    obscureText
                        ? Icons.visibility
                        : Icons
                            .visibility_off, // Corrected icon based on obscureText
                  ),
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                )
              : null,
          hintText: widget.hintText, // Corrected to use widget.hintText
          hintStyle: GoogleFonts.poppins(
              color: Theme.of(context).colorScheme.inverseSurface,
              fontSize: 18),
        ),
      ),
    );
  }
}
