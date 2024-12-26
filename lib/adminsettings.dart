// import 'package:flutter/material.dart';

// void main() {
//   runApp(const TimetableApp());
// }

// class TimetableApp extends StatelessWidget {
//   const TimetableApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: TimetablePage(),
//     );
//   }
// }

// class TimetablePage extends StatefulWidget {
//   const TimetablePage({super.key});

//   @override
//   _TimetablePageState createState() => _TimetablePageState();
// }

// class _TimetablePageState extends State<TimetablePage> {
//   // Initial selection values
//   int _selectedDays = 5; // Default working days
//   int _selectedHours = 8; // Default hours per day

//   // Controllers to handle text inputs
//   final TextEditingController _daysController = TextEditingController(text: '5');
//   final TextEditingController _hoursController = TextEditingController(text: '8');

//   @override
//   void dispose() {
//     // Dispose the controllers when the widget is disposed
//     _daysController.dispose();
//     _hoursController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 150,
//         backgroundColor: const Color(0XFF0B0B60), // Deep bluish color
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadiusDirectional.only(
//             bottomStart: Radius.circular(40),
//             bottomEnd: Radius.circular(40),
//           ),
//         ),
//         leading: Padding(
//           padding: const EdgeInsets.only(left: 7.0, top: 7.0),
//           child: Align(
//             alignment: Alignment.topLeft,
//             child: IconButton(
//               icon: const Icon(Icons.arrow_back, color: Colors.white, size: 23.0),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ),
//         ),
//         title: Padding(
//           padding: const EdgeInsets.only(left: 50.0, top: 4.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Timetable Setup',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         centerTitle: false,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Working Days Input Field
//             const Text(
//               'Enter Number of Working Days:',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             TextField(
//               controller: _daysController,
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(
//                 hintText: 'Enter number of days',
//                 border: OutlineInputBorder(),
//                 contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//               ),
//               onChanged: (value) {
//                 setState(() {
//                   _selectedDays = int.tryParse(value) ?? _selectedDays;
//                 });
//               },
//             ),
//             const SizedBox(height: 20),

//             // Hours per Day Input Field
//             const Text(
//               'Enter Number of Hours per Day:',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             TextField(
//               controller: _hoursController,
//               keyboardType: TextInputType.number,
//               decoration: const InputDecoration(
//                 hintText: 'Enter number of hours',
//                 border: OutlineInputBorder(),
//                 contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
//               ),
//               onChanged: (value) {
//                 setState(() {
//                   _selectedHours = int.tryParse(value) ?? _selectedHours;
//                 });
//               },
//             ),

//             // Save Button
//             const SizedBox(height: 20), // Reduced space here
//             ElevatedButton(
//               onPressed: () {
//                 // Submit button action (you can add functionality here)
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: const Text('Saved'),
//                       content: Text(
//                           'Working Days: $_selectedDays\nHours per Day: $_selectedHours'),
//                       actions: <Widget>[
//                         TextButton(
//                           child: const Text('OK'),
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               },
//               child: const Text('Save'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color.fromARGB(255, 185, 193, 199),
//                 padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
//                 textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
