import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Custom Buttons'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: const [
            CustomButton(
              label: 'Submit',
              icon: Icons.check,
              button: ButtonType.primary,
              iconPosition: IconPosition.left,
            ),
            CustomButton(
              label: 'Time',
              icon: Icons.access_time_outlined,
              button: ButtonType.secondary,
              iconPosition: IconPosition.right,
            ),
            CustomButton(
              label: 'Account',
              icon: Icons.account_tree_sharp,
              button: ButtonType.disable,
              iconPosition: IconPosition.right,
            ),
          ],
        ),
      ),
    ),
  ));
}

enum ButtonType {
  primary(backgroundColor: Colors.blue),
  secondary(backgroundColor: Colors.green),
  disable(backgroundColor: Colors.grey);

  final Color backgroundColor;

  const ButtonType({
    required this.backgroundColor,
  });
}

enum IconPosition { 
  left, 
  right
}

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType button;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.button = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 35,
      decoration: BoxDecoration(
        color: button.backgroundColor, 
        borderRadius: BorderRadius.circular(50),
      ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconPosition == IconPosition.left) Icon(icon, size: 20),
            if (iconPosition == IconPosition.left) const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
            if (iconPosition == IconPosition.right) const SizedBox(width: 8),
            if (iconPosition == IconPosition.right) Icon(icon, size: 20),
          ],
        ),
    );
  }
}