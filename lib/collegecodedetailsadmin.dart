import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const CollegeApp());
}

class CollegeApp extends StatelessWidget {
  const CollegeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CollegeDetailsPage(),
    );
  }
}

class CollegeDetailsPage extends StatefulWidget {
  const CollegeDetailsPage({super.key});

  @override
  _CollegeDetailsPageState createState() => _CollegeDetailsPageState();
}

class _CollegeDetailsPageState extends State<CollegeDetailsPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  File? _selectedLogo;

  Future<void> _pickLogo() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedLogo = File(image.path);
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _codeController.dispose();
    _locationController.dispose();
    _yearController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _saveDetails() {
    if (_nameController.text.isEmpty ||
        _codeController.text.isEmpty ||
        _locationController.text.isEmpty ||
        _yearController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _selectedLogo == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Error"),
          content: const Text("Please fill in all fields and upload a logo."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Details Saved"),
        content: Text(
          "College Name: ${_nameController.text}\n"
          "College Code: ${_codeController.text}\n"
          "Location: ${_locationController.text}\n"
          "Established Year: ${_yearController.text}\n"
          "Contact Email: ${_emailController.text}",
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        backgroundColor: const Color(0XFF0B0B60),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
            bottomStart: Radius.circular(40),
            bottomEnd: Radius.circular(40),
          ),
        ),
        title: const Text(
          "College Details",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 4.0, top: 7.0),
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
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("College Name", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            TextField(controller: _nameController, decoration: const InputDecoration(hintText: "Enter college name", border: OutlineInputBorder())),
            const SizedBox(height: 16),
            const Text("College Code", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            TextField(controller: _codeController, decoration: const InputDecoration(hintText: "Enter college code", border: OutlineInputBorder())),
            const SizedBox(height: 16),
            const Text("Location", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            TextField(controller: _locationController, decoration: const InputDecoration(hintText: "Enter location", border: OutlineInputBorder())),
            const SizedBox(height: 16),
            const Text("Established Year", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            TextField(controller: _yearController, keyboardType: TextInputType.number, decoration: const InputDecoration(hintText: "Enter established year", border: OutlineInputBorder())),
            const SizedBox(height: 16),
            const Text("Contact Email", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            TextField(controller: _emailController, keyboardType: TextInputType.emailAddress, decoration: const InputDecoration(hintText: "Enter contact email", border: OutlineInputBorder())),
            const SizedBox(height: 16),
            const Text("Upload College Logo", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Row(
              children: [
                ElevatedButton(onPressed: _pickLogo, child: const Text("Choose Logo")),
                const SizedBox(width: 16),
                _selectedLogo != null ? Image.file(_selectedLogo!, width: 50, height: 50) : const Text("No logo selected"),
              ],
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: _saveDetails,
                child: const Text("Save"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0B0B60),
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
