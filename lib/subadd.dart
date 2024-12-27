import 'package:flutter/material.dart';

class AddSubjectPage extends StatefulWidget {
  const AddSubjectPage({super.key});

  @override
  _AddSubjectPageState createState() => _AddSubjectPageState();
}

class _AddSubjectPageState extends State<AddSubjectPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _subjectNameController = TextEditingController();
  final TextEditingController _deptNameController = TextEditingController();
  final TextEditingController _facultyNameController = TextEditingController();
  final TextEditingController _subjectTypeController = TextEditingController();
  final TextEditingController _subjectCodeController = TextEditingController();

  // Checkbox value
  bool _isChecked = false;

  // Function to handle saving the subject
  void _saveSubject() {
    if (_formKey.currentState!.validate()) {
      // Get the values from the controllers
      String subjectName = _subjectNameController.text;
      String deptName = _deptNameController.text;
      String facultyName = _facultyNameController.text;
      String subjectType = _subjectTypeController.text;
      String subjectCode = _subjectCodeController.text;

      // Show a message confirming the data has been saved
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Subject Saved: $subjectName'),
      ));

      // Optionally clear the fields after saving
      _subjectNameController.clear();
      _deptNameController.clear();
      _facultyNameController.clear();
      _subjectTypeController.clear();
      _subjectCodeController.clear();
    }
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
          "ADD SUBJECT",
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Subject Name
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  controller: _subjectNameController,
                  decoration: const InputDecoration(
                    labelText: 'Subject Name',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter subject name';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10),
              
              // Department Name
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  controller: _deptNameController,
                  decoration: const InputDecoration(
                    labelText: 'Department Name',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter department name';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10),

              // Faculty Name
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  controller: _facultyNameController,
                  decoration: const InputDecoration(
                    labelText: 'Faculty Name',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter faculty name';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10),

              // Subject Type
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  controller: _subjectTypeController,
                  decoration: const InputDecoration(
                    labelText: 'Subject Type',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter subject type';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10),

              // Subject Code
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  controller: _subjectCodeController,
                  decoration: const InputDecoration(
                    labelText: 'Subject Code',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter subject code';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 10),

              // Checkbox with Text
              Row(
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (bool? newValue) {
                      setState(() {
                        _isChecked = newValue!;
                      });
                    },
                  ),
                  const Text("Is Fixed"),
                ],
              ),
              const SizedBox(height: 20),

              // Save Button
              ElevatedButton(
                onPressed: _saveSubject,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 50),
                  textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
