import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Major(),
    ));

class Major extends StatefulWidget {
  const Major({Key? key}) : super(key: key);

  @override
  _MajorState createState() => _MajorState();
}

class _MajorState extends State<Major> {
  String? _selectedMajor;
  String? _selectedLanguage;
  bool _agreedToTerms = false;

  Widget _buildLanguageButton(String language) {
    bool isSelected = _selectedLanguage == language;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.blue : Colors.grey,
          elevation: isSelected ? 10.0 : 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
        ),
        onPressed: () {
          setState(() {
            _selectedLanguage = language;
          });
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Radio<String>(
              value: language,
              groupValue: _selectedLanguage,
              onChanged: (value) {
                setState(() {
                  _selectedLanguage = value;
                });
              },
            ),
            SizedBox(width: 10.0),
            Text(
              language,
              style: TextStyle(
                fontSize: 20.0,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Form'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 188, 247, 255), 
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Major',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Center(
              child: ToggleButtons(
                isSelected: [
                  _selectedMajor == 'Computer Science',
                  _selectedMajor == 'Information Technology'
                ],
                onPressed: (index) {
                  setState(() {
                    if (index == 0) {
                      _selectedMajor = 'Computer Science';
                    } else {
                      _selectedMajor = 'Information Technology';
                    }
                  });
                },
                borderColor: Colors.grey,
                selectedBorderColor: Colors.blue,
                borderWidth: 2,
                selectedColor: Colors.white,
                fillColor: Colors.blue,
                borderRadius: BorderRadius.circular(8),
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 25,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Text(
                        'Computer Science',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: _selectedMajor == 'Computer Science'
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 25,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 46, vertical: 8),
                      child: Text(
                        'Information Technology',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: _selectedMajor == 'Information Technology'
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Language',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildLanguageButton('Thai'),
                _buildLanguageButton('English'),
                _buildLanguageButton('Chinese'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Checkbox(
                  value: _agreedToTerms,
                  activeColor: Colors.blue,
                  onChanged: (value) {
                    setState(() {
                      _agreedToTerms = value!;
                    });
                  },
                ),
                Text(
                  'Agree Condition Terms',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _agreedToTerms ? () {} : null,
                child: Text('Register'),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _agreedToTerms ? Colors.blue : Colors.grey,
                  padding:
                      EdgeInsets.symmetric(horizontal: 150, vertical: 15),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
