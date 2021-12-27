import 'package:flutter/material.dart';
import 'signup.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: <String, WidgetBuilder>{
      '/sign': (BuildContext context) => SignUp()
    },
    home: LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation titleAnimation, formAnimation, buttonAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 3), vsync: this);

    titleAnimation = Tween(begin: -1, end: 0.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn
    ));

    formAnimation = Tween(begin: -1, end: 0.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)
    ));

    buttonAnimation = Tween(begin: -1, end: 0.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn)
    ));
    
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    _controller.forward();
    return AnimatedBuilder(
      animation: _controller, 
      builder: (BuildContext context, Widget child){
        return Scaffold(
          resizeToAvoidBottomPadding: false,
          body: Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Transform(
                  transform: Matrix4.translationValues(titleAnimation.value * width, 0.0, 0.0),
                  child: Container(
                    margin: EdgeInsets.only(top: 100.0),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Hello', style: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold),),
                              Text('There', style: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 157.0, top: 112.0),
                          height: 15.0,
                          width: 15.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(7.5)),
                            color: Colors.green
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30.0,),
                Transform(
                  transform: Matrix4.translationValues(formAnimation.value * width, 0.0, 0.0),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'EMAIL',
                            labelStyle: TextStyle(
                              color: Colors.grey
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'PASSWORD',
                            labelStyle: TextStyle(
                              color: Colors.grey
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            ),
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 15.0,),
                        Container(
                          alignment: Alignment(1.0, 0.0),
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 25.0,),
                Transform(
                  transform: Matrix4.translationValues(0.0, titleAnimation.value * (-width), 0.0),
                  child: Material(
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        width: MediaQuery.of(context).size.width - 40,
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          color: Colors.green
                        ),
                        child: Center(
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0,),
                Transform(
                  transform: Matrix4.translationValues(formAnimation.value * (-width), 0.0, 0.0),
                  child: GestureDetector(
                    onTap: (){},
                    child: Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(25.0))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(child: Image.asset('assets/images/facebook.png', width: 20.0,),),
                          SizedBox(width: 10.0,),
                          Center(
                            child: Text('Log in with Facebook'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Transform(
                  transform: Matrix4.translationValues(buttonAnimation.value * width, 0.0, 0.0),
                  child: Container(
                    alignment: Alignment(0.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('New to Spotify?'),
                        SizedBox(width: 10.0,),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, '/sign');
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
    });
  }
}