import 'package:flutter/material.dart';

class FactField extends StatelessWidget {
  final String fact;
  const FactField({Key? key, required this.fact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Material(
      elevation: 20,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: themeData.colorScheme.onPrimary,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Text(
            '''" $fact "''',
            textAlign: TextAlign.center,
            style: themeData.textTheme.bodyText1,
          ),
        ),
      ),
    );
  }
}
