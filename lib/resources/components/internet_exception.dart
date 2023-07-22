import 'package:flutter/material.dart';
import 'package:get_a/resources/app_colors/app_colors.dart';
import 'package:get_a/resources/components/rounded_button.dart';

class InternetException extends StatefulWidget {
  final VoidCallback onPressed;

  const InternetException({super.key, required this.onPressed});

  @override
  State<InternetException> createState() => _InternetExceptionState();
}

class _InternetExceptionState extends State<InternetException> {
  final bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.cloud_off,
            color: Colors.red,
            size: 100,
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'We Are Unable to Show Result \n Please Check Your Internet \nConnection!',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 15),
          InkWell(
            onTap: widget.onPressed,
            child: Container(
              height: 45,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                  child: loading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          'Retry',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )),
            ),
          )
        ],
      ),
    );
  }
}
