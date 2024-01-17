import 'package:flutter/material.dart';

class Formulaire extends StatefulWidget {
  @override
  _FormulaireState createState() => _FormulaireState();
}

class _FormulaireState extends State<Formulaire> {
  int? selectedGender;
  bool isFootballSelected = false;
  bool isHandballSelected = false;
  bool isBasketballSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 540,
          width: 400,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Text(
                  "Student Registration",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          border: OutlineInputBorder(),
                          hintText: 'Enter your Nom',
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          border: OutlineInputBorder(),
                          hintText: 'Enter your Prenom',
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          border: OutlineInputBorder(),
                          hintText: 'Enter your Email',
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          border: OutlineInputBorder(),
                          hintText: 'Enter your Phone',
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          border: OutlineInputBorder(),
                          hintText: 'Enter your ville',
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 12.0)),
                        Text(
                          "Gender",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value as int?;
                            });
                          },
                        ),
                        Text("Femme"),
                        Radio(
                          value: 2,
                          groupValue: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value as int?;
                            });
                          },
                        ),
                        Text("Homme"),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sports",
                      style: TextStyle(fontSize: 16),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: isFootballSelected,
                          onChanged: (value) {
                            setState(() {
                              isFootballSelected = value!;
                            });
                          },
                        ),
                        Text("Football"),
                        

                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                          value: isHandballSelected,
                          onChanged: (value) {
                            setState(() {
                              isHandballSelected = value!;
                            });
                          },
                        ),
                        Text("Handball"),
                        
                        ],
                        ),
                        Row(
                        children: [
                          Checkbox(
                          value: isBasketballSelected,
                          onChanged: (value) {
                            setState(() {
                              isBasketballSelected = value!;
                            });
                          },
                        ),
                        Text("Basketball"),
                        
                        
                      ],
                    ),
                    Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          border: OutlineInputBorder(),
                          hintText: 'Password',
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                  ],
                ),
                  ],
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                   
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(355, 50)), 
                  ),
                  child: Text("Enregistrer"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
