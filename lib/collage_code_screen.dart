import 'package:flutter/material.dart';
import 'package:timeit/logn_screen%20copy.dart';

class CollegeCodeScreen extends StatefulWidget {
  const CollegeCodeScreen({super.key});

  @override
  _CollegeCodeScreenState createState() => _CollegeCodeScreenState();
}

class _CollegeCodeScreenState extends State<CollegeCodeScreen> {
  final TextEditingController _collegeCodeController = TextEditingController();
  String? _errorText;

  @override
  void dispose() {
    _collegeCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 180,
        backgroundColor: const Color(0XFF0B0B60),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
            bottomStart: Radius.circular(40),
            bottomEnd: Radius.circular(40),
          ),
        ),
        title: const Text(
          'Hi',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Enter your Campus Code to continue:",
              style: TextStyle(
                fontSize: 18,
                color: Color(0XFF0B0B60),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10.0), // Same margin for consistency
              child: Card(
                color: Colors.white,
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextField(
                    controller: _collegeCodeController, // Added controller here
                    style: const TextStyle(fontSize: 18),
                    decoration: const InputDecoration(
                      hintText: 'Campus code',
                      prefixIcon: Icon(Icons.account_balance),
                      border: InputBorder
                          .none, // Removed outline border for clean card design
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String collegeCode = _collegeCodeController.text.trim();
                FocusScope.of(context).unfocus(); // Dismiss the keyboard

                if (collegeCode.isEmpty || collegeCode.length < 4) {
                  setState(() {
                    _errorText = "Please enter a valid campus code.";
                  });
                } else {
                  setState(() {
                    _errorText = null;
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('campus code accepted!')),
                  );

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0XFF0B0B60),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 40),
              ),
              child: const Text("Proceed"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 80,
        decoration: const BoxDecoration(
          color: Color(0XFF0B0B60),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: const Center(
          child: Text(
            'Please contact your college for the campus code',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ),
    );
  }
}