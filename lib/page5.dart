import 'package:flutter/material.dart';
import 'Page6.dart';
import 'Page4.dart';

class Page5 extends StatefulWidget {
  final String userType;

  const Page5({super.key, this.userType = 'default'});
  @override
  _Page5State createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  final _formKey = GlobalKey<FormState>(); // Declare Form Key
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form( // Wrap the column inside Form
          key: _formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 60),
              Image.asset('assets/touchme.png', width: 400, height: 150),
              const SizedBox(height: 10),
              Image.asset(
                'assets/p5i2.png',
                width: 500,
                height: 80,
                errorBuilder: (context, error, stackTrace) =>
                    const Center(child: Text('Image not found')),
              ),
              const SizedBox(height: 10),

              // Username Field
              TextFormField(
                
                decoration: InputDecoration(
                  labelText: "Username or Email",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset('assets/User.png', width: 24, height: 24),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: const BorderSide(color: Colors.purple),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: const BorderSide(color: Colors.purple),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: const BorderSide(color: Colors.purple, width: 2),
                  ),
                ),
               
              ),
              const SizedBox(height: 25),

              // Password Field
              TextFormField(
               
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset('assets/lock.png', width: 24, height: 24),
                  ),
                 
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: const BorderSide(color: Colors.purple),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: const BorderSide(color: Colors.purple),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: const BorderSide(color: Colors.purple, width: 2),
                  ),
                ),
                
              ),
              const SizedBox(height: 40),

              // Login Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) { // Validate form before navigating
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Page6()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF38084B),
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 155),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
                  ),
                  child: const Text("Login", style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
              const SizedBox(height: 40),

              const Text("- Or Continue -"),
              const SizedBox(height: 40),

              // Social Login Button
              InkWell(
                onTap: () {
                  // Add your button action here
                },
                child: Image.asset('assets/p4i7.png', width: 200, height: 40),
              ),
              const SizedBox(height: 20),

              // Signup Navigation
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Page4()),
                    );
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: " Create An Account ",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      children: [
                        TextSpan(
                          text: " SignUp",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF38084B),
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xFF38084B),
                            decorationThickness: 1.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}