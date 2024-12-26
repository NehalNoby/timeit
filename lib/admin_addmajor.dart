import 'package:flutter/material.dart';

void main() {
  runApp(const AddMajor());
}

class AddMajor extends StatelessWidget {
  const AddMajor({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Semester selection variable
  String? _selectedSemester = 'Semester 1';
  
  // List of major names
  List<String> majors = ['Major 1', 'Major 2', 'Major 3', 'Major 4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        backgroundColor: const Color(0XFF0B0B60), // Deep bluish color
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
            bottomStart: Radius.circular(40),
            bottomEnd: Radius.circular(40),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 7.0, top: 7.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 23.0),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 75.0, top: 04.0), // Add padding here
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,  // Align text to the start
            children: [
              const Text(
                "Subject Add",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        centerTitle: false,  // To make sure title is left-aligned
      ),
      body: Column(
        children: [
          // Semester Dropdown
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DropdownButton<String>(
              value: _selectedSemester,
              isExpanded: true,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedSemester = newValue;
                });
              },
              items: <String>['Semester 1', 'Semester 2', 'Semester 3', 'Semester 4']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: majors.length, // Number of majors
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                majors[index], // Major name dynamically
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                              const SizedBox(height: 4),
                              SizedBox(
                                width: 200,
                                child: TextField(
                                  decoration: const InputDecoration(
                                    hintText: "Enter major details",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text("ASSIGN"),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                "APPLY",
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
