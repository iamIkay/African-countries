import 'package:flutter/material.dart';

import '../../../../config/theme.dart';

class ErrorContainer extends StatelessWidget {
  final String title;
  final String description;
  final Function()? onRefresh;
  const ErrorContainer(
      {required this.title,
      required this.description,
      this.onRefresh,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.warning, color: Colors.red[800], size: 60.0),
          const SizedBox(height: 8.0),
          Text(title,
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500)),
          const SizedBox(height: 2.0),
          Text(description.toString().replaceAll('Exception:', ''),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 11.0, color: Colors.grey)),
          const SizedBox(height: 12.0),
          SizedBox(
            width: 120.0,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Palette.primary,
                    textStyle: const TextStyle(),
                    foregroundColor: Colors.white),
                onPressed: onRefresh,
                child: const Text(
                  "Try Again",
                )),
          )
        ],
      ),
    );
  }
}
