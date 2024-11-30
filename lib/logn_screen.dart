import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method returns the same UI structure for both "Sign In" and "Sign Up"
    Widget buildForm(String buttonText, String screenTitle) {
      return Column(
        children: [
          const SizedBox(height: 10),
          Text(
            screenTitle,
            style: const TextStyle(
              fontSize: 30,
              color: Color(0XFF0B0B60),
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
              wordSpacing: 3.0,
              fontFamily: 'time',
            ),
          ),
          const SizedBox(height: 20), // Adjust spacing between text and logo
          // Logo Image
          Image.asset(
            'assets/images/lissahlogo.png', // Replace with your logo path
            height: 175, // Adjust height as needed
            width: 175, // Adjust width as needed
          ),
          const SizedBox(height: 20),
          // Email Input Field
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20.0), // Adds margin to both sides
            child: SizedBox(
              height: 60,
              child: Card(
                color: Colors.white,
                elevation: 8,
                child: TextField(
                  style: const TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.all(20),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          // Password Input Field
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20.0), // Same margin for consistency
            child: SizedBox(
              height: 60,
              child: Card(
                color: Colors.white,
                elevation: 10,
                child: TextField(
                  style: const TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: const Icon(Icons.visibility),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.all(20),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 2.0),
          // Forgot Password Text Button
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 17.0),
              child: TextButton(
                onPressed: () {
                  print('Forget Password clicked');
                },
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                child: const Text('Forget Password?'),
              ),
            ),
          ),
          // Elevated Button
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              onPressed: () {
                print(buttonText);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0XFF0B0B60), // Button background color
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 140),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                buttonText,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      );
    }

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
        leading: Padding(
          padding: const EdgeInsets.only(
              left: 7.0, top: 7.0), // Adjust padding as needed
          child: Align(
            alignment: Alignment.topLeft, // Ensures alignment at the top-left
            child: IconButton(
              icon: const Icon(Icons.arrow_back,
                  color: Colors.white, size: 23.0), // Adjust size if needed
              onPressed: () {
                Navigator.pop(context); // Return to the previous screen
              },
            ),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          tabs: const [
            Tab(text: "Sign In"),
            Tab(text: "Sign Up"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildForm("Sign In", "Welcome Back!"),
          buildForm("Sign Up", "Create Account"),
          const Align()
        ],
      ),
      bottomNavigationBar: Container(
        width: double.maxFinite,
        height: 80,
        decoration: const BoxDecoration(
          color: Color(0XFF0B0B60),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
      ),
    );
  }
}