import 'package:flutter/material.dart';

void main() {
  runApp(const Regstration());
}

class Regstration extends StatelessWidget {
  const Regstration({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RoleSelectionScreen(),
    );
  }
}

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  _RoleSelectionScreenState createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  String? selectedRole; // To store the selected role

  final List<String> roles = ['H.O.D', 'Faculty', 'Student']; // Available roles

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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Please select a role to continue:',
              style: TextStyle(
                fontSize: 20, // Slightly larger font size
                fontWeight: FontWeight.w600, // Semi-bold font weight
                color: Color(0xFF1F1F1F), // Darker color for better contrast
                letterSpacing: 0.8, // Slight letter spacing for modern look
                shadows: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(2, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedRole,
              hint: const Text("Select Role"),
              onChanged: (String? newValue) {
                setState(() {
                  selectedRole = newValue;
                });
              },
              items: roles.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: selectedRole == null
                  ? null
                  : () {
                      // Navigate to the next screen or save the selected role
                      print('Selected Role: $selectedRole');
                      // You could navigate like this:
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen(role: selectedRole)));
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0XFF0B0B60), // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 16, horizontal: 32), // Padding inside the button
              ),
              child: const Text('Next'),
            ),
          ],
        ),
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
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.home, color: Color.fromARGB(255, 16, 13, 65)),
            Icon(Icons.person, color: Color.fromARGB(255, 22, 25, 93)),
            Icon(Icons.settings, color: Color.fromARGB(255, 23, 7, 62)),
          ],
        ),
      ),
    );
  }
}
