import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

void addDialogBox(BuildContext context, String mode) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return DialogContent(mode: mode);
    },
  );
}

class DialogContent extends StatefulWidget {
  final String mode;

  DialogContent({required this.mode});

  @override
  DialogContentState createState() => DialogContentState();
}

class DialogContentState extends State<DialogContent> {
  String textField1Value = "";
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      title: Text(
        widget.mode,
        style: GoogleFonts.poppins(
          color: Theme.of(context).colorScheme.inversePrimary,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.attach_money),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey, // Replace with your desired color
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue, // Replace with your desired color
                  ),
                ),
                filled: true,
                fillColor: Colors.white, // Replace with your desired color
                hintText: "Amount",
                hintStyle: GoogleFonts.poppins(
                  color: Theme.of(context).colorScheme.inverseSurface,
                  fontSize: 14,
                ),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              onChanged: (value) {
                setState(() {
                  textField1Value = value;
                });
              },
            ),
            const SizedBox(height: 10),
            TextField(
              readOnly: true,
              onTap: () => _selectDate(context),
              controller: TextEditingController(
                text: selectedDate != null
                    ? DateFormat('dd MMMM yyyy').format(selectedDate!)
                    : '',
              ),
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.date_range),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                fillColor: Theme.of(context).colorScheme.inversePrimary,
                filled: true,
                hintText: "Date",
                hintStyle: GoogleFonts.poppins(
                  color: Theme.of(context).colorScheme.inverseSurface,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.unfold_more),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey, // Replace with your desired color
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue, // Replace with your desired color
                  ),
                ),
                filled: true,
                fillColor: Colors.white, // Replace with your desired color
                hintText: "Category",
                hintStyle: GoogleFonts.poppins(
                  color: Theme.of(context).colorScheme.inverseSurface,
                  fontSize: 14,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  textField1Value = value;
                });
              },
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.description),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey, // Replace with your desired color
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue, // Replace with your desired color
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white, // Replace with your desired color
                  hintText: "Description",
                  hintStyle: GoogleFonts.poppins(
                    color: Theme.of(context).colorScheme.inverseSurface,
                    fontSize: 14,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    textField1Value = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Do something with textField1Value and selectedDate
            Navigator.pop(context);
          },
          child: Text(
            'Submit',
            style: GoogleFonts.poppins(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
