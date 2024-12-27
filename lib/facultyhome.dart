import 'package:flutter/material.dart';  

void main() {  
  runApp(const Facultyhome());  
}  

class Facultyhome extends StatelessWidget {  
  const Facultyhome({super.key});  

  @override  
  Widget build(BuildContext context) {  
    return const MaterialApp(  
      debugShowCheckedModeBanner: false,  
      home: CustomPage(),  
    );  
  }  
}  

class CustomPage extends StatelessWidget {  
  const CustomPage({super.key});  

  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      body: Container(  
        decoration: BoxDecoration(  
          gradient: LinearGradient(  
            colors: [  
              const Color(0xFF455A64), // Dark slate gray  
              const Color(0xFFB0BEC5), // Soft gray  
            ],  
            begin: Alignment.topCenter,  
            end: Alignment.bottomCenter,  
          ),  
        ),  
        child: Column(  
          children: [  
            _buildAppBar(),  
            // Main content below the AppBar  
            Expanded(  
              child: Padding(  
                padding: const EdgeInsets.all(16.0),  
                child: Column(  
                  crossAxisAlignment: CrossAxisAlignment.start,  
                  children: [  
                    const SizedBox(height: 20),  
                    const Text(  
                      'Hello,',  
                      style: TextStyle(  
                        fontSize: 24,  
                        color: Colors.white,  
                        shadows: [  
                          Shadow(  
                            color: Colors.black54, // Shadow color  
                            offset: Offset(1, 1), // Shift down by 1  
                            blurRadius: 3, // Blur strength  
                          ),  
                        ],  
                      ),  
                    ),  
                    const Text(  
                      'Hi Name',  
                      style: TextStyle(  
                        fontSize: 28,  
                        fontWeight: FontWeight.bold,  
                        color: Colors.white,  
                        shadows: [  
                          Shadow(  
                            color: Colors.black54, // Shadow color  
                            offset: Offset(1, 1), // Shift down by 1  
                            blurRadius: 3, // Blur strength  
                          ),  
                        ],  
                      ),  
                    ),  
                    const SizedBox(height: 32),  
                    // Buttons Section  
                    Row(  
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,  
                      children: [  
                        _buildCard(icon: Icons.school, label: 'Common'),  
                        _buildCard(icon: Icons.group, label: 'Students'),  
                      ],  
                    ),  
                    const SizedBox(height: 32),  
                    // Faculty Section  
                    const Text(  
                      'FACULTY',  
                      style: TextStyle(  
                        fontSize: 18,  
                        fontWeight: FontWeight.bold,  
                        color: Colors.white,  
                        shadows: [  
                          Shadow(  
                            color: Colors.black54,  
                            offset: Offset(1, 1),  
                            blurRadius: 3,  
                          ),  
                        ],  
                      ),  
                    ),  
                    const SizedBox(height: 16),  
                    // Faculty container with shadow  
                    Container(  
                      decoration: BoxDecoration(  
                        color: const Color.fromARGB(255, 71, 71, 85),  
                        borderRadius: BorderRadius.circular(16),  
                        boxShadow: const [  
                          BoxShadow(  
                            color: Colors.black26, // Shadow color for container  
                            offset: Offset(0, 4), // Shift down  
                            blurRadius: 8, // Blur radius  
                          ),  
                        ],  
                      ),  
                      padding: const EdgeInsets.all(16),  
                      child: Row(  
                        children: [  
                          CircleAvatar(  
                            backgroundColor: Colors.white,  
                            child: const Icon(Icons.person, color: Color(0xFF263238)),  
                          ),  
                          const SizedBox(width: 18),  
                          const Column(  
                            crossAxisAlignment: CrossAxisAlignment.start,  
                            children: [  
                              Text(  
                                'FACULTY NAME',  
                                style: TextStyle(  
                                  fontSize: 18,  
                                  fontWeight: FontWeight.bold,  
                                  color: Colors.black,  
                                  shadows: [  
                                    Shadow(  
                                      color: Colors.black54, // Shadow color  
                                      offset: Offset(1, 1), // Shift down by 1  
                                      blurRadius: 3, // Blur strength  
                                    ),  
                                  ],  
                                ),  
                              ),  
                              Text(  
                                'subject',  
                                style: TextStyle(  
                                  fontSize: 15,  
                                  color: Colors.grey,  
                                  shadows: [  
                                    Shadow(  
                                      color: Colors.black54, // Shadow color  
                                      offset: Offset(1, 1), // Shift down by 1  
                                      blurRadius: 3,  
                                    ),  
                                  ],  
                                ),  
                              ),  
                            ],  
                          ),  
                        ],  
                      ),  
                    ),  
                  ],  
                ),  
              ),  
            ),  
          ],  
        ),  
      ),  
      bottomNavigationBar: _buildBottomAppBar(),  
    );  
  }  

  // Function to create a gradient AppBar  
  Widget _buildAppBar() {  
    return Container(  
      height: 185,  
      decoration: BoxDecoration(  
        gradient: LinearGradient(  
          colors: [  
            const Color(0xFF263238), // Dark charcoal color  
            const Color(0xFF455A64), // Gradient to a lighter gray  
          ],  
          begin: Alignment.topCenter,  
          end: Alignment.bottomCenter,  
        ),  
        borderRadius: const BorderRadius.vertical(  
          bottom: Radius.circular(30),  
        ),  
      ),  
      child: Padding(  
        padding: const EdgeInsets.all(16.0),  
        child: Column(  
          children: [  
            Row(  
              mainAxisAlignment: MainAxisAlignment.spaceBetween,  
              children: [  
                IconButton(  
                  icon: const Icon(Icons.arrow_back, color: Colors.white),  
                  onPressed: () {  
                    // Back button action  
                  },  
                ),  
                const CircleAvatar(  
                  backgroundColor: Colors.white,  
                  child: Text(  
                    ':)',  
                    style: TextStyle(color: Color(0xFF009688)),  
                  ),  
                ),  
              ],  
            ),  
            const Text(  
              'Student Registration',  
              style: TextStyle(  
                color: Colors.white,  
                fontSize: 22,  
                fontWeight: FontWeight.bold,  
                shadows: [  
                  Shadow(  
                    color: Colors.black54, // Shadow color  
                    offset: Offset(1, 1), // Shift down by 1  
                    blurRadius: 3, // Blur strength  
                  ),  
                ],  
              ),  
            ),  
          ],  
        ),  
      ),  
    );  
  }  

  // Custom function to create a card  
  Widget _buildCard({required IconData icon, required String label}) {  
    return Container(  
      width: 150,  
      height: 100,  
      decoration: BoxDecoration(  
        color: const Color.fromARGB(255, 71, 71, 85),  
        borderRadius: BorderRadius.circular(16),  
        boxShadow: const [  
          BoxShadow(  
            color: Colors.black12,  
            offset: Offset(0, 4),  
            blurRadius: 8,  
          ),  
        ],  
      ),  
      child: Column(  
        mainAxisAlignment: MainAxisAlignment.center,  
        children: [  
          Icon(icon, size: 40, color: Colors.black),  
          const SizedBox(height: 8),  
          Text(  
            label,  
            style: const TextStyle(  
              fontSize: 16,  
              fontWeight: FontWeight.bold,  
              color: Colors.black,  
              shadows: [  
                Shadow(  
                  color: Colors.black54, // Shadow color  
                  offset: Offset(1, 1), // Shift down  
                  blurRadius: 3, // Blur strength  
                ),  
              ],  
            ),  
          ),  
        ],  
      ),  
    );  
  }  

  // Function to create the Bottom App Bar  
  Widget _buildBottomAppBar() {  
    return Container(  
      height: 70,  
      decoration: BoxDecoration(  
        gradient: LinearGradient(  
          colors: [  
            const Color(0xFF263238),  
            const Color(0xFF455A64),  
          ],  
          begin: Alignment.topCenter,  
          end: Alignment.bottomCenter,  
        ),  
        borderRadius: const BorderRadius.vertical(top: Radius.circular(0)),  
      ),  
      child: Row(  
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,  
        children: [  
          _buildBottomButton(icon: Icons.home, label: 'Home'),  
          _buildBottomButton(icon: Icons.settings, label: 'Settings'),  
          _buildBottomButton(icon: Icons.save, label: 'Save'),  
        ],  
      ),  
    );  
  }  

  // Function to create buttons for the bottom app bar  
  Widget _buildBottomButton({required IconData icon, required String label}) {  
    return Column(  
      mainAxisAlignment: MainAxisAlignment.center,  
      children: [  
        Icon(icon, color: Colors.white),  
        Text(  
          label,  
          style: const TextStyle(fontSize: 12, color: Colors.white),  
        ),  
      ],  
    );  
  }  
}