import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isSignupScreen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: _body(context),
    );
  }

  Widget _body(final BuildContext context) => Stack(
        children: [
          _headerItem(),
          _submitButton(true),
          _cardItem(),
          _submitButton(false),
          _footerButtons()
        ],
      );

  Widget _footerButtons() => Positioned(
        left: 0,
        right: 0,
        top: 630,
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.transparent,
              boxShadow: [
                BoxShadow(
                    color: Colors.brown.withOpacity(0.6),
                    blurRadius: 15,
                    spreadRadius: 5),
              ],
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Expanded(child: _loginButtonItem('Google', () {}, Colors.red)),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                  child: _loginButtonItem(
                      'Facebook', () {}, Colors.blue.shade900)),
              const SizedBox(
                width: 5,
              ),
              Expanded(child: _loginButtonItem('Github', () {}, Colors.black54))
            ],
          ),
        ),
      );

  Widget _loginButtonItem(final String lable, final VoidCallback onTap,
      final Color backgroundColor) {
    return TextButton(
        style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            minimumSize: Size(120, 40)),
        onPressed: onTap,
        child: Text(lable));
  }

  Widget _submitButton(final bool hasShadow) => Positioned(
        left: 0,
        right: 0,
        top: isSignupScreen?450:380,
        child: GestureDetector(
          onTap: () {},
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(8),
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  if (hasShadow)
                    BoxShadow(
                        offset: const Offset(0, 1),
                        color: Colors.brown.withOpacity(0.6),
                        spreadRadius: 5,
                        blurRadius: 15)
                ],
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.brown.withOpacity(0.9),
                      Colors.brown.shade900,
                    ], begin: Alignment.topLeft, end: Alignment.bottomCenter),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 1,
                          spreadRadius: 1,
                          offset: const Offset(0, 1))
                    ]),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
          ),
        ),
      );

  Widget _headerItem() => Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 300,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/assets/images/cafe.jpg'),
                fit: BoxFit.fill)),
        child: Container(
          padding: const EdgeInsets.only(top: 90, left: 20),
          color: Colors.brown.withOpacity(0.75),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Welcome to',
                    style: TextStyle(
                        color: Colors.yellow.shade700,
                        fontSize: 25,
                        letterSpacing: 1.3),
                  ),
                  Text(
                    ' CafeApp',
                    style: TextStyle(
                        color: Colors.yellow.shade400,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.3,
                        fontSize: 24),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'the description of my cafe app',
                style: TextStyle(
                  letterSpacing: 1.5,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ));

  Widget _cardItem() => Positioned(
        top: 200,
        right: 0,
        left: 0,
        child: Container(
          padding: EdgeInsets.all(16),
          height: isSignupScreen?300:220,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.brown.withOpacity(0.7),
                    blurRadius: 15,
                    spreadRadius: 5)
              ],
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              _loginAndSignUpButtons(),
              const SizedBox(
                height: 20,
              ),
              _formItems()
            ],
          ),
        ),
      );

  Widget _formItems() => Column(
        children: [
          textFieldItem('user name', Icons.person),
          const SizedBox(
            height: 15,
          ),
          isSignupScreen?textFieldItem('email', Icons.email):const SizedBox.shrink(),
          isSignupScreen? const SizedBox(
            height: 15,
          ):const SizedBox.shrink(),
          textFieldItem('password', Icons.lock)
        ],
      );

  Widget textFieldItem(final String lable, final IconData icon) {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.brown.shade200),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.brown.shade600),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          prefixIcon: Icon(
            icon,
            color: Colors.brown.shade200,
          ),
          contentPadding: EdgeInsets.all(12),
          hintText: lable,
          hintStyle: TextStyle(color: Colors.grey)),
    );
  }

  Widget _loginAndSignUpButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [_loginButton(), _signUpButton()],
      );

  Widget _loginButton() => GestureDetector(
        onTap: () {
          setState(() {
            isSignupScreen = false;
          });
        },
        child: Column(
          children: [
             Text(
              'Login',
              style: TextStyle(fontSize: 16,
                color:!isSignupScreen ? Colors.brown.shade700 : Colors.grey,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 4),
              color: !isSignupScreen ? Colors.brown.shade700 : Colors.grey,
              height: 3,
              width: 50,
            )
          ],
        ),
      );

  Widget _signUpButton() => GestureDetector(
        onTap: () {
          setState(() {
            isSignupScreen = true;
          });
        },
        child: Column(
          children: [
            Text(
              'Signup',
              style: TextStyle(
                  color: isSignupScreen ? Colors.brown.shade700 : Colors.grey,
                  fontSize: 16),
            ),
            Container(
              margin: EdgeInsets.only(top: 4),
              color: isSignupScreen?Colors.brown.shade200:Colors.grey,
              height: 3,
              width: 60,
            )
          ],
        ),
      );
}
