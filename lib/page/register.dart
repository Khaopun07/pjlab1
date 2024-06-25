import 'package:flutter/material.dart';
import 'package:apkhao/page/major.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Register(),
    );
  }
}

class Register extends StatefulWidget {
  const Register({Key? key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String username = '';
  String password = '';
  double weight = 60;
  double height = 170;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 188, 247, 255),
        ),
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              CircleAvatar(
                radius: 110,
                backgroundImage: NetworkImage(
                    'https://img5.pic.in.th/file/secure-sv1/442485862_872252814921570_7569707609834198110_n.jpg'),
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      name = value ?? '';
                    },
                  ),
                ],
              ),
              SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your username',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      username = value ?? '';
                    },
                  ),
                ],
              ),
              SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your password',
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      password = value ?? '';
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text('Weight: ${weight.toStringAsFixed(1)} kg'),
              Slider(
                value: weight,
                min: 30,
                max: 150,
                divisions: 120,
                label: weight.toStringAsFixed(1),
                onChanged: (value) {
                  setState(() {
                    weight = value;
                  });
                },
              ),
              SizedBox(height: 12),
              Text('Height: ${height.toStringAsFixed(1)} cm'),
              Slider(
                value: height,
                min: 100,
                max: 250,
                divisions: 150,
                label: height.toStringAsFixed(1),
                onChanged: (value) {
                  setState(() {
                    height = value;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Major()),
                    );
                  }
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.resolveWith<Color>((states) {
                    return Colors.blue;
                  }),
                ),
                child: Text('NEXT'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
