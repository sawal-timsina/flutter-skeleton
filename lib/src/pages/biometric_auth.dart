import 'package:flutter/material.dart';

class BiometricAuth extends StatefulWidget {
  const BiometricAuth({super.key});

  @override
  State<BiometricAuth> createState() => _BiometricAuthState();
}

class _BiometricAuthState extends State<BiometricAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Verified"),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.fingerprint,
              size: 50,
              color: Colors.grey[300],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("User Verified"),
          ],
        ),
      ),
    );
  }
}
