import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Form Validation Example",
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.greenAccent,
          appBarTheme: AppBarTheme(color: Colors.amberAccent)),
      home: MyFormState(),
    );
  }
}

class MyFormState extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyFormState> {
  GlobalKey<FormState> _key = new GlobalKey<FormState>();
  Information information = new Information();

  void _submitForm() {
    if (_key.currentState!.validate()) {
      _key.currentState?.save();
      print(information.toString());
      showSnackbar(context);
    }
  }

  void showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Saved")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Form Validation"),
      ),
      body: Form(
          key: _key,
          child: SingleChildScrollView(
            child: SizedBox(
              height: 1000,
              child: Center(
                  child: Column(
                children: [
                  CustomFormTextField(
                    onSaved: (text) {
                      information.name = text;
                    },
                    onValidation: (text) {
                      if (text == null || text.toString().isEmpty) {
                        return "Required";
                      }
                      return null;
                    },
                    hintText: "Enter Name",
                    textInputType: TextInputType.text,
                  ),
                  CustomFormTextField(
                    onSaved: (text) {
                      information.age = int.parse(text);
                    },
                    onValidation: (text) {
                      if (text == null || text.toString().isEmpty) {
                        return "Required";
                      }
                      return null;
                    },
                    hintText: "Enter Age",
                    textInputType: TextInputType.number,
                  ),
                  CustomFormTextField(
                    onSaved: (text) {
                      information.address = text;
                    },
                    onValidation: (text) {
                      if (text == null || text.toString().isEmpty) {
                        return "Required";
                      }
                      return null;
                    },
                    hintText: "Enter Address",
                    textInputType: TextInputType.text,
                  ),
                  CustomFormTextField(
                    onSaved: (text) {
                      information.phone = text;
                    },
                    onValidation: (text) {
                      if (text == null || text.toString().isEmpty) {
                        return "Required";
                      }
                      return null;
                    },
                    hintText: "Enter Phone",
                    textInputType: TextInputType.phone,
                  ),
                  CustomFormTextField(
                    onSaved: (text) {
                      information.email = text;
                    },
                    onValidation: (text) {
                      return null;
                    },
                    hintText: "Enter Email",
                    textInputType: TextInputType.emailAddress,
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            _submitForm();
                          },
                          child: Text("Submit"),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amberAccent,
                              shadowColor: Colors.greenAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)))),
                    ),
                  )
                ],
              )),
            ),
          )),
    );
  }
}

class CustomFormTextField extends StatelessWidget {
  final Function onSaved;
  final Function onValidation;
  final TextInputType? textInputType;
  final String hintText;

  const CustomFormTextField(
      {super.key,
      required this.onSaved,
      required this.onValidation,
      this.textInputType,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(15),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: this.hintText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
        onSaved: (text) => this.onSaved(text),
        validator: (text) => this.onValidation(text),
        keyboardType: this.textInputType ?? TextInputType.text,
        textInputAction: TextInputAction.next,
      ),
    );
  }
}

class Information {
  String _name = "";
  int _age = 0;
  String _address = "";
  String _phone = "";
  String? _email;

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get age => _age;

  set age(int value) {
    _age = value;
  }

  String get address => _address;

  set address(String value) {
    _address = value;
  }

  String get phone => _phone;

  set phone(String value) {
    _phone = value;
  }

  String? get email => _email;

  set email(String? value) {
    _email = value;
  }

  @override
  String toString() {
    return 'Information{_name: $_name, _age: $_age, _address: $_address, _phone: $_phone, _email: $_email}';
  }
}
