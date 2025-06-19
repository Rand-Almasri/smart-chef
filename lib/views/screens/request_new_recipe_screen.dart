import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class RequestNewRecipeScreen extends StatefulWidget {
  @override
  _RequestNewRecipeScreenState createState() => _RequestNewRecipeScreenState();
}

class _RequestNewRecipeScreenState extends State<RequestNewRecipeScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String? _selectedCategory;
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  // Categories list
  final List<String> _categories = [
    'Desserts',
    'Breakfast',
    'Main Course',
    'Beverages',
    'Appetizers'
  ];

  // Pick image
  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  // Submit request
  void _submitRequest() {
    if (_formKey.currentState!.validate()) {
      if (_selectedCategory == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select a category')),
        );
        return;
      }

      // Here we send data to Backend
      _sendRequestToBackend();
    }
  }

  void _sendRequestToBackend() {
    // TODO: Send data to server
    print('Recipe Name: ${_nameController.text}');
    print('Description: ${_descriptionController.text}');
    print('Category: $_selectedCategory');
    print('Image: ${_selectedImage?.path}');

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Recipe request sent successfully!'),
        backgroundColor: Colors.green,
      ),
    );

    // Go back to previous screen
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request New Recipe'),
        backgroundColor: Color(0xFF8FB78F),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Recipe name field
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Recipe Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.restaurant),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter recipe name';
                  }
                  return null;
                },
              ),

              SizedBox(height: 16),

              // Description field
              TextFormField(
                controller: _descriptionController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: 'Recipe Description',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.description),
                  alignLabelWithHint: true,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter recipe description';
                  }
                  return null;
                },
              ),

              SizedBox(height: 16),

              // Category selection
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.category),
                ),
                items: _categories.map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCategory = newValue;
                  });
                },
              ),

              SizedBox(height: 16),

              // Image selection section
              Container(
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: _selectedImage == null
                    ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_a_photo, size: 50, color: Colors.grey),
                    SizedBox(height: 10),
                    Text('Choose image for recipe'),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _pickImage,
                      child: Text('Choose Image'),
                    ),
                  ],
                )
                    : Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        _selectedImage!,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedImage = null;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24),

              // Submit button
              ElevatedButton(
                onPressed: _submitRequest,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF8FB78F),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Submit Request',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}