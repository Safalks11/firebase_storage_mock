import 'package:flutter/material.dart';
import '../authservice.dart';
import 'login&Reg/home_screen.dart';

class VerificationCodePage extends StatefulWidget {
  final String verificationId;

  VerificationCodePage(this.verificationId);

  @override
  _VerificationCodePageState createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  final TextEditingController _verificationCodeController =
      TextEditingController();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify Code'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _verificationCodeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Verification Code'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                String verificationCode =
                    _verificationCodeController.text.trim();
                await _authService.verifyAndSignIn(
                    widget.verificationId, verificationCode);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              child: Text('Verify'),
            ),
          ],
        ),
      ),
    );
  }
}
