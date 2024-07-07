import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  NetworkImage _defaultImage = NetworkImage(
      "https://img.freepik.com/free-photo/side-view-unknown-man-posing_23-2149417555.jpg?size=626&ext=jpg&ga=GA1.1.1152997229.1709223401&semt=ais");
  File? _profileImageFile;
  String _name = 'John Doe';
  String _email = 'john.doe@example.com';
  String _phone = '123-456-7890';
  String _birthdate = '1 Januari 1990';
  String _address = 'Jalan Merdeka No. 1, Jakarta';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProfileInfo();
  }

  _loadProfileInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name') ?? 'John Doe';
      _email = prefs.getString('email') ?? 'john.doe@example.com';
      _phone = prefs.getString('phone') ?? '123-456-7890';
      _birthdate = prefs.getString('birthdate') ?? '1 Januari 1990';
      _address = prefs.getString('address') ?? 'Jalan Merdeka No. 1, Jakarta';
      String? imagePath = prefs.getString('profile_image');
      if (imagePath != null) {
        _profileImageFile = File(imagePath);
      }
      _isLoading =
          false;
    });
  }

  _saveProfileInfo(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _profileImageFile = File(pickedFile.path);
      });
      _saveProfileInfo('profile_image', pickedFile.path);
    }
  }

  void _resetProfileInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {
      _profileImageFile = null;
      _name = 'John Doe';
      _email = 'john.doe@example.com';
      _phone = '123-456-7890';
      _birthdate = '1 Januari 1990';
      _address = 'Jalan Merdeka No. 1, Medan';
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: Text('My Profile'),
          centerTitle: true,
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetProfileInfo,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: GestureDetector(
                onTap: () => _showImagePickerOptions(),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: _profileImageFile != null
                      ? FileImage(_profileImageFile!)
                      : _defaultImage as ImageProvider,
                ),
              ),
            ),
            SizedBox(height: 90),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProfileInfo('Nama: $_name', 'Edit', _editName),
                  Divider(color: Colors.grey, thickness: 1.0),
                  _buildProfileInfo('Email: $_email', 'Edit', _editEmail),
                  Divider(color: Colors.grey, thickness: 1.0),
                  _buildProfileInfo(
                      'Nomor Telepon: $_phone', 'Edit', _editPhone),
                  Divider(color: Colors.grey, thickness: 1.0),
                  _buildProfileInfo(
                      'Tanggal Lahir: $_birthdate', 'Edit', _editBirthdate),
                  Divider(color: Colors.grey, thickness: 1.0),
                  _buildProfileInfo('Alamat: ${_truncateString(_address, 21)}',
                      'Edit', _editAddress),
                  Divider(color: Colors.grey, thickness: 1.0),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Alamat',
                  hintText: 'Masukkan alamat Anda',
                  border: OutlineInputBorder(),
                ),
                child: Text(
                  _address,
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfo(
      String info, String buttonText, VoidCallback onPressed) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            info,
            style: TextStyle(fontSize: 18),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
          ),
          child: Text(buttonText),
        ),
      ],
    );
  }

  String _truncateString(String text, int limit) {
    return text.length > limit ? text.substring(0, limit) + '...' : text;
  }

  void _editName() {
    _showEditDialog('Edit Name', _name, (value) {
      setState(() {
        _name = value;
      });
      _saveProfileInfo('name', value);
    });
  }

  void _editEmail() {
    _showEditDialog('Edit Email', _email, (value) {
      setState(() {
        _email = value;
      });
      _saveProfileInfo('email', value);
    });
  }

  void _editPhone() {
    _showEditDialog('Edit Phone', _phone, (value) {
      setState(() {
        _phone = value;
      });
      _saveProfileInfo('phone', value);
    });
  }

  void _editBirthdate() {
    _selectDate(context);
  }

  void _editAddress() {
    _showEditDialog('Edit Address', _address, (value) {
      setState(() {
        _address = value;
      });
      _saveProfileInfo('address', value);
    });
  }

  void _showEditDialog(
      String title, String initialValue, ValueChanged<String> onChanged) {
    TextEditingController controller =
        TextEditingController(text: initialValue);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: "Enter $title"),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                onChanged(controller.text);
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectedDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.orange,
            colorScheme: ColorScheme.light(
              primary: Colors.orange,
              onPrimary: Colors.white,
              onSurface: Colors.black,
              secondary: Colors.orange,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        _birthdate =
            "${picked.day} ${_getMonthName(picked.month)} ${picked.year}";
      });
      _saveProfileInfo('birthdate', _birthdate);
    }
  }

  String _getMonthName(int month) {
    List<String> monthNames = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    return monthNames[month - 1];
  }

  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Camera'),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
