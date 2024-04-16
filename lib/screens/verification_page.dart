import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//tsssst
class VerificationPage extends StatefulWidget {
  final String verificationId;

  const VerificationPage({Key? key, required this.verificationId}) : super(key: key);

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify Phone Number'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: codeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter verification code',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  // Get the verification code from the text field
                  String verificationCode = codeController.text.trim();
                  try {
                    // Create a PhoneAuthCredential with the verification code
                    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: widget.verificationId, smsCode: verificationCode);
                    // Sign in the user with the credential
                    await FirebaseAuth.instance.signInWithCredential(credential);
                    // If successful, navigate to home page or any other desired page
                    Navigator.pushReplacementNamed(context, '/home');
                  } catch (e) {
                    // Handle errors, e.g., invalid verification code
                    print('Verification failed: $e');
                    // You can show an error message to the user if needed
                  }
                },
                child: Text('Verify'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
