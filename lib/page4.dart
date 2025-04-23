import 'package:flutter/material.dart';
import 'Page5.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Page4 extends StatefulWidget {
  const Page4({super.key});



  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  String _passwordStrength = "";
  Color _strengthColor = Colors.grey;
  String _confirmPasswordError = "";

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return; // User canceled login

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Signed in as ${googleUser.displayName}")),
      );

      // Navigate to the next page after successful login
      Navigator.pushNamed(context, '/home'); // Replace with your actual route
    } catch (e) {
      print("Google Sign-In Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Sign-in failed. Try again.")),
      );
    }
  }

  void _checkPasswordStrength(String password) {
    if (password.isEmpty) {
      setState(() {
        _passwordStrength = "";
        _strengthColor = Colors.grey;
      });
      return;
    }

    final RegExp strongRegex = RegExp(
        r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@\$!%*?&])[A-Za-z\d@\$!%*?&]{8,}");
    final RegExp mediumRegex =
        RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{6,}");

    setState(() {
      if (strongRegex.hasMatch(password)) {
        _passwordStrength = "Strong";
        _strengthColor = Colors.green;
      } else if (mediumRegex.hasMatch(password)) {
        _passwordStrength = "Medium";
        _strengthColor = Colors.orange;
      } else {
        _passwordStrength = "Weak";
        _strengthColor = Colors.red;
      }
    });
  }

  void _validateConfirmPassword(String value) {
    setState(() {
      if (value != _passwordController.text) {
        _confirmPasswordError = "Passwords do not match";
      } else {
        _confirmPasswordError = "";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 60),
                      Image.asset('assets/touchme.png',
                          width: 400, height: 150),
                      const SizedBox(height: 8),
                      const Text("Create an Account",
                          style: TextStyle(
                              fontSize: 34,
                              color: Color(0xFF38084B),
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      TextFormField(
                       
                        decoration: InputDecoration(
                          labelText: "Username or Email",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Image.asset('assets/User.png',
                                width: 24, height: 24),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: const BorderSide(color: Colors.purple),
                          ),
                        ),
                        
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        
                        decoration: InputDecoration(
                          labelText: "Password",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Image.asset('assets/lock.png',
                                width: 24, height: 24),
                          ),
                          
                          
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: const BorderSide(color: Colors.purple),
                          ),
                        ),
                        
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5, right: 10),
                          child: Text(
                            _passwordStrength,
                            style: TextStyle(
                                color: _strengthColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: !_isConfirmPasswordVisible,
                        onChanged: _validateConfirmPassword,
                        decoration: InputDecoration(
                          labelText: "Confirm Password",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Image.asset('assets/lock.png',
                                width: 24, height: 24),
                          ),
                          suffixIcon: IconButton(
                            icon: Image.asset(
                              _isConfirmPasswordVisible
                                  ? 'assets/eye.png'
                                  : 'assets/eye_closed.png',
                              width: 24,
                              height: 24,
                            ),
                            onPressed: () {
                              setState(() {
                                _isConfirmPasswordVisible =
                                    !_isConfirmPasswordVisible;
                              });
                            },
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: const BorderSide(color: Colors.purple),
                          ),
                        ),
                      ),
                      if (_confirmPasswordError.isNotEmpty)
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5, right: 10),
                            child: Text(
                              _confirmPasswordError,
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Page5(userType: 'default'), // Provide a valid userType
                              ),
                            );

                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF38084B),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 115),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)),
                        ),
                        child: const Text("Create Account",
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "- Or Continue -",
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          _signInWithGoogle();
                        },
                        child: Image.asset('assets/p4i7.png',
                            width: 200, height: 40),
                      ),
                      const SizedBox(height: 8),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Page5(userType: 'default'), // Provide a valid userType
                              ),
                            );

                          },
                          child: RichText(
                            text: const TextSpan(
                              text: "I Already Have an Account ",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                              children: [
                                TextSpan(
                                  text: "Login",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF38084B),
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xFF38084B),
                                    // Ensure underline color matches
                                    decorationThickness: 1.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]))));
  }
}
