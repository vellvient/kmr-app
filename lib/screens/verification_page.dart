import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kmrapp/screens/home_page.dart';

class VerificationPage extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;

  const VerificationPage({
    Key? key,
    required this.verificationId,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  TextEditingController smsCodeController = TextEditingController();

  void verifyPhoneNumber(String smsCode) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: smsCode,
      );

      // Sign in with the credential
      await FirebaseAuth.instance.signInWithCredential(credential);

      // After successful sign-in, you can navigate to the desired page
      // For example, navigate to the home page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } catch (e) {
      // Handle error
      print('Failed to verify SMS code: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verification'),
        backgroundColor: Color(0xffDFCEFA),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter the SMS code sent to ${widget.phoneNumber}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            TextField(
              controller: smsCodeController,
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: InputDecoration(
                labelText: 'SMS Code',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String smsCode = smsCodeController.text.trim();
                verifyPhoneNumber(smsCode);
              },
              child: Text('Verify'),
            ),
          ],
        ),
      ),
    );
  }
}
