import 'package:flutter/material.dart';

class CustomDatePicker extends StatelessWidget {
  final TextEditingController controller;
  final double width;
  final double height;
  final ValueChanged<String> onChanged;

  const CustomDatePicker({super.key,
    required this.controller,
    required this.width,
    required this.height,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        controller: controller,
        readOnly: true,
        decoration: const InputDecoration(
          hintText: "Select Date",
          suffixIcon: Icon(Icons.calendar_today, color: Colors.black,),
        ),
        onTap: () async {
          DateTime today = DateTime.now();
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: today,
            firstDate: today, // Prevent selection of past dates
            lastDate: DateTime(2100),
            builder: (BuildContext context, Widget? child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: const ColorScheme.light(
                    primary: Colors.teal, // Header background color
                    onPrimary: Colors.white, // Header text color
                    onSurface: Colors.black, // Body text color
                  ),
                  textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.teal, // Button text color
                    ),
                  ),
                ),
                child: child!,
              );
            },
          );

          if (pickedDate != null) {
            String formattedDate = "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
            controller.text = formattedDate;
            onChanged(formattedDate);
          }
        },

      ),
    );
  }
}
