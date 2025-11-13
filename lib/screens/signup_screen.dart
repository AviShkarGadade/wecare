import 'package:flutter/material.dart';
import '../widgets/custom_textfield.dart';
import 'signin_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const Text("Sign Up to Wecare",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                const Text("Welcome please enter your detail",
                    style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 25),
                const CustomTextField(hintText: 'Full Name', icon: Icons.person),
                const SizedBox(height: 15),
                const CustomTextField(hintText: 'Email', icon: Icons.email_outlined),
                const SizedBox(height: 15),
                const CustomTextField(
                    hintText: 'Password',
                    icon: Icons.lock_outline,
                    obscureText: true),
                const SizedBox(height: 15),
                const CustomTextField(
                    hintText: 'Confirm Password',
                    icon: Icons.lock_outline,
                    obscureText: true),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF003300),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {},
                  child: const Text("Sign Up"),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const SignInScreen()));
                        },
                        child: const Text("Sign In"))
                  ],
                ),
                const SizedBox(height: 10),
                buildSocialButton("Continue with Google", Icons.g_mobiledata),
                const SizedBox(height: 10),
                buildSocialButton("Continue with Apple", Icons.apple),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSocialButton(String text, IconData icon) {
    return OutlinedButton.icon(
      icon: Icon(icon, color: Colors.black),
      label: Text(text, style: const TextStyle(color: Colors.black)),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.black12),
        minimumSize: const Size(double.infinity, 50),
      ),
      onPressed: () {},
    );
  }
}
