import 'package:flutter/material.dart';
import 'package:ned_template/features/auth/screen/sign_in.dart';
import 'package:ned_template/features/home/screen/home_screen.dart';
import 'package:ned_template/utils/widgets/text_filed.dart';

class SignUpScreen extends StatefulWidget {
  static const route = 'sign_up';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _retypePasswordController = TextEditingController();

  FocusNode _passwordFocusNode;
  FocusNode _retypePasswordFocusNode;

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
    _retypePasswordFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Material(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(),
                  ),
                  _buildTitle(),
                  _buildUserIdField(),
                  _buildPasswordField(),
                  _buildRetypePasswordField(),
                  SizedBox(height: 64),
                  _buildSignInButton(),
                  SizedBox(height: 24),
                  _buildBottomButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      height: 125,
      child: Column(
        children: [
          Text(
            'Welcome!',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xff384f7d),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            'Create your account to get stated. After that, you can share books and make friends.',
            style: TextStyle(
              fontSize: 15,
              color: Color(0xbb384f7d),
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Widget _buildUserIdField() {
    return TextFieldWidget(
      hint: 'Email',
      inputType: TextInputType.emailAddress,
      icon: Icons.person,
      iconColor: Colors.black54,
      textController: _userEmailController,
      inputAction: TextInputAction.next,
      onChanged: (value) {},
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(_passwordFocusNode);
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFieldWidget(
      hint: 'Password',
      isObscure: true,
      padding: EdgeInsets.only(top: 16.0),
      icon: Icons.lock,
      iconColor: Colors.black54,
      textController: _passwordController,
      focusNode: _passwordFocusNode,
      onChanged: (value) {},
    );
  }

  Widget _buildRetypePasswordField() {
    return TextFieldWidget(
      hint: 'Retype Password',
      isObscure: true,
      padding: EdgeInsets.only(top: 16.0),
      icon: Icons.lock,
      iconColor: Colors.black54,
      textController: _retypePasswordController,
      focusNode: _retypePasswordFocusNode,
      onChanged: (value) {},
    );
  }

  Widget _buildSignInButton() {
    return Container(
      height: 54,
      child: RaisedButton(
        child: Text(
          'Sign Up',
          style: TextStyle(fontSize: 18),
        ),
        color: Colors.orangeAccent,
        textColor: Colors.white,
        onPressed: () async {
          _navigate();
        },
      ),
    );
  }

  Widget _buildBottomButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xff384f7d),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                SignInScreen.route, (Route<dynamic> route) => false);
          },
          child: Text(
            'Login',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xff384f7d),
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  _navigate() {
    Future.delayed(Duration(milliseconds: 0), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
          HomeScreen.route, (Route<dynamic> route) => false);
    });
  }

  _showErrorMessage(String message) {}

  @override
  void dispose() {
    _userEmailController.dispose();
    _passwordController.dispose();
    _retypePasswordController.dispose();
    _passwordFocusNode.dispose();
    _retypePasswordFocusNode.dispose();
    super.dispose();
  }
}
