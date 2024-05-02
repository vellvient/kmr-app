import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kmrapp/screens/login.dart';
import 'package:kmrapp/screens/home_page.dart';
import 'package:kmrapp/screens/root.dart';
import 'package:kmrapp/screens/verification_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
  
class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key});

  @override
  Widget build(BuildContext context) {
    TextEditingController fullNameController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    Future<void> handleRegister() async {
      String fullName = fullNameController.text;
      String phoneNumber = phoneNumberController.text;
      String password = passwordController.text;
      String confirmPassword = confirmPasswordController.text;

      if (password != confirmPassword) {
        return;
      }

      try {
        // Send OTP to the provided phone number
        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            // Auto-retrieve the SMS code and sign in
            await FirebaseAuth.instance.signInWithCredential(credential);
          },
          verificationFailed: (FirebaseAuthException e) {
            // Handle the error here
            print('Failed to verify phone number: ${e.message}');
          },
          codeSent: (String verificationId, int? resendToken) {
            // Navigate to verification page and pass verification ID
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VerificationPage(
                  verificationId: verificationId,
                  phoneNumber: phoneNumber,
                ),
              ),
            );
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            // Handle the code auto-retrieval timeout
          },
        );

        // Store additional user information in Firestore
        String userId = FirebaseAuth.instance.currentUser!.uid;
        await FirebaseFirestore.instance.collection('users').doc(userId).set({
          'fullName': fullName,
          'phoneNumber': phoneNumber,
        });

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RootPage()),
        );
      } catch (e) {
        // Handle registration failure
        print('Failed to register user: $e');
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffDFCEFA),
      ),
      body: ListView(
        padding: const EdgeInsets.only(
          top: 0,
          bottom: 14,
        ),
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            width: double.infinity,
            height: 200,
            decoration: const BoxDecoration(
                color: Color(0xffDFCEFA),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'User Register',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff966FD6)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Please fill in your personal informations required below',
                  style: TextStyle(color: Color(0xff966FD6), fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                TextField(
                  controller: fullNameController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 30),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    labelText: 'Full Name',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 30),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    labelText: 'Phone Number',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 30),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    labelText: 'Password',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 30),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    labelText: 'Confirm Password',
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: Text('Login here'),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xff966FD6),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: handleRegister,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50)),
                            child: const Text(
                              'GET STARTED',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
