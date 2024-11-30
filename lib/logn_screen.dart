import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
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
    Widget _buildForm(String buttonText, String screenTitle) {
      return Column(
        children: [
          SizedBox(height: 30),
          Text(
            screenTitle,
            style: TextStyle(
              fontSize: 30,
              color: Color(0XFF0B0B60),
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
              wordSpacing: 3.0,
              fontFamily: 'time',
            ),
          ),
          SizedBox(height: 30),
          // Email Input Field
          Container(
            height: 60,
            child: Card(
              color: Colors.white,
              elevation: 8,
              child: TextField(
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: EdgeInsets.all(20),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          // Password Input Field
          Container(
            height: 60,
            child: Card(
              color: Colors.white,
              elevation: 8,
              child: TextField(
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.visibility),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: EdgeInsets.all(20),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          // Forgot Password Text Button
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: TextButton(
                onPressed: () {
                  print('Forget Password clicked');
                },
                child: Text('Forget Password?'),
                style: TextButton.styleFrom(foregroundColor: Colors.red),
              ),
            ),
          ),
          // Elevated Button
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: ElevatedButton(
              onPressed: () {
                print(buttonText);
              },
              child: Text(buttonText,style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0XFF0B0B60), // Button background color
                
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 140),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 225,
        backgroundColor: Color(0XFF0B0B60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
            bottomStart: Radius.circular(40),
            bottomEnd: Radius.circular(40),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          tabs: [
            Tab(text: "Sign In"),
            Tab(text: "Sign Up"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildForm("Sign In", "Welcome Back!"),
          _buildForm("Sign Up", "Create Account"),
        ],
      ),
      bottomNavigationBar: Container(
        width: double.maxFinite,
        height: 100,
        decoration: BoxDecoration(
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
