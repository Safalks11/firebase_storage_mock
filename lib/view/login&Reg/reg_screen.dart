import 'package:flutter/material.dart';
import '../../authservice.dart';
import '../verification_code.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                String phoneNumber = _phoneNumberController.text.trim();
                await _authService.signInWithPhone(
                  phoneNumber,
                  (String verificationId) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            VerificationCodePage(verificationId),
                      ),
                    );
                  },
                );
              },
              child: Text('Send Verification Code'),
            ),
          ],
        ),
      ),
    );
  }
}
