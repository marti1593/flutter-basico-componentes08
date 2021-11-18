import 'package:flutter/material.dart';
import 'package:widgets_07/widgets/custom_text_field.dart';

class LoginRegister extends StatefulWidget{

  static const String ROUTE = "/loginregister";

  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> with SingleTickerProviderStateMixin{

  bool _loginView = true;

  late AnimationController _animationController;
  late Animation<Size> _heightAnimation;

  @override
  void initState() {
    _animationController = 
    AnimationController(
    vsync: this, duration: Duration(milliseconds: 300));
    _heightAnimation = Tween<Size>(
      begin: Size (double.infinity,350),
      end: Size (double.infinity,400),
    ).animate(
      CurvedAnimation(parent: _animationController , curve: Curves.linear));

      _animationController.addListener(() { 
        setState(() {
          print(_animationController.status);
          print(_animationController.value);
        });
      });
    super.initState();
  }

  @override 
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(
          title: Text("App Widgets"),
          ),
      body: Container(
        height: _heightAnimation.value.height,
        //_loginView ? 300 : 350,
        margin: EdgeInsets.all(5),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(2),
          child: Column(
            children: [
              CustomTextField(
                icon: Icons.person,
                placeholder: "Usuario",
               ),
               SizedBox(height: 5,),
               CustomTextField(
                icon: Icons.lock,
                placeholder: "Password",
                obscureText: true,
                primaryColor: Colors.red,
               ),
               SizedBox(height: 5,
               ),
               Visibility(
                 visible: !_loginView,
                 child: CustomTextField(
                  icon: Icons.lock,
                  placeholder: "Repeat Password",
                  obscureText: true,
                  primaryColor: Colors.purple,
                 ),
               ),
               RaisedButton(
                 color: Theme.of(context).primaryColor,
                 child: Text(_loginView ? "Login": "Register", 
                 style:TextStyle(color: Colors.white) ,),
                 onPressed: (){}),
                 Spacer(),
                 SwitchListTile(
                   secondary: Icon(Icons.person),
                   title: Text(_loginView ? "Login": "Register"),
                   value: _loginView, onChanged: (value){
                   setState(() {
                     _loginView = value;

                     if(!_loginView){
                       _animationController.forward();

                     }else{
                       _animationController.reverse();

                     }
                   });

                 })
            ],
          ),
        ),
      ),
    ),
          );
     
  }
}
