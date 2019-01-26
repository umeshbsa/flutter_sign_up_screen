import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
          primaryColor: Colors.grey,
          primarySwatch: Colors.red,
          accentColor: Colors.blue),
      title: "Sign Up Screen",
      home: SignUpUI(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SignUpUI extends StatefulWidget {
  @override
  _SignUpUIState createState() => _SignUpUIState();
}

class _SignUpUIState extends State<SignUpUI> {
  BuildContext context;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _fname;
  String _lname;
  String _mobile;
  String _email;
  String _password;
  String _conpassword;
  String _address;

  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();

  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _conPasswordController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return new Scaffold(
      body: new GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: new SingleChildScrollView(
          child: new Container(
            padding: EdgeInsets.fromLTRB(25, 60.0, 25, 20),
            child: new Column(
              children: <Widget>[
                new CircleAvatar(
                  backgroundImage: new NetworkImage(
                      "https://images.pexels.com/photos/462118/pexels-photo-462118.jpeg?cs=srgb&dl=bloom-blooming-blossom-462118.jpg&fm=jpg"),
                  radius: 55.0,
                ),
                new Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
                new Form(
                  key: _formKey,
                  autovalidate: _autoValidate,
                  child: FormUI(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showAlert() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // Retrieve the text the user has typed in using our
          // TextEditingController
          title: new Text("Sign Up"),
          content: new Text(" First Name :" +
              _fnameController.text +
              "\n Last Name : " +
              _lnameController.text +
              "\n Mobile Number : " +
              _mobileController.text +
              "\n Email : " +
              _emailController.text +
              "\n Password : " +
              _passwordController.text +
              "\n Address : " +
              _addressController.text),
          actions: <Widget>[
            FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  _fnameController.clear();
                  _lnameController.clear();
                  _mobileController.clear();
                  _emailController.clear();
                  _passwordController.clear();
                  _conPasswordController.clear();
                  _addressController.clear();
                  Navigator.of(context).pop();
                })
          ],
        );
      },
    );
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
      _formKey.currentState.save();
      showAlert();
    } else {
//    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }

  Widget FormUI() {
    return new Column(
      children: <Widget>[
        new TextFormField(
          controller: _fnameController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: 'First Name',
            labelStyle: TextStyle(
                fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
            icon: Icon(Icons.account_box),
          ),
          keyboardType: TextInputType.text,
          validator: validateName,
          onSaved: (String val) {
            _fname = val;
          },
        ),
        new TextFormField(
          controller: _lnameController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: 'Last Name',
            labelStyle: TextStyle(
                fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
            icon: Icon(Icons.account_box),
          ),
          keyboardType: TextInputType.text,
          // validator: validateName,
          /* onSaved: (String val) {
            _lname = val;
          },*/
        ),
        new TextFormField(
          controller: _mobileController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: 'Mobile Number',
            labelStyle: TextStyle(
                fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
            icon: Icon(Icons.add_call),
          ),
          keyboardType: TextInputType.phone,
          validator: validateMobile,
          onSaved: (String val) {
            _mobile = val;
          },
        ),
        new TextFormField(
          controller: _emailController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: 'Email',
            labelStyle: TextStyle(
                fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
            icon: Icon(Icons.alternate_email),
          ),
          keyboardType: TextInputType.emailAddress,
          validator: validateEmail,
          onSaved: (String val) {
            _email = val;
          },
        ),
        new TextFormField(
          obscureText: true,
          controller: _passwordController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: 'Password',
            labelStyle: TextStyle(
                fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
            icon: Icon(Icons.pages),
          ),
          keyboardType: TextInputType.text,
          validator: validatePassword,
          onSaved: (String val) {
            _password = val;
          },
        ),
        new TextFormField(
          obscureText: true,
          controller: _conPasswordController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: 'Confirm Password',
            labelStyle: TextStyle(
                fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
            icon: Icon(Icons.pages),
          ),
          keyboardType: TextInputType.text,
          validator: validateConPassword,
          onSaved: (String val) {
            _conpassword = val;
          },
        ),
        new TextFormField(
          controller: _addressController,
          textInputAction: TextInputAction.done,
          decoration: const InputDecoration(
            labelText: 'Address',
            labelStyle: TextStyle(
                fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
            icon: Icon(Icons.home),
          ),
          keyboardType: TextInputType.text,
          onSaved: (String val) {
            _address = val;
          },
        ),
        Padding(padding: const EdgeInsets.fromLTRB(0, 20, 0, 0)),
        ButtonTheme(
          buttonColor: Colors.blueAccent,
          minWidth: 300,
          height: 50.0,
          child: RaisedButton(
              onPressed: _validateInputs,
              child: new Text(
                "Sign Up",
                style: new TextStyle(color: Colors.white, fontSize: 20.0),
              )),
        ),
      ],
    );
  }

  String validateName(String value) {
    if (value.length < 3)
      return 'First name must be more than 3 charaters';
    else
      return null;
  }

  String validateMobile(String value) {
    if (value.length != 10)
      return 'Mobile mumber must be of 10 characters';
    else
      return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  String validatePassword(String value) {
    if (value.trim().length < 6)
      return 'Password must be 6 character length';
    else
      return null;
  }

  String validateConPassword(String value) {
    String pass = _passwordController.text;
    String conpass = _conPasswordController.text;

    print(pass);
    print(conpass);

    if (pass != conpass)
      return 'Password and confirm password must be eqauls';
    else
      return null;
  }
}
