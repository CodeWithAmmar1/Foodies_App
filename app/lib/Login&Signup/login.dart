import 'package:app/Button/button.dart';
import 'package:app/HomeScreens/home_screen.dart';
import 'package:app/HomeScreens/navbar.dart';
import 'package:app/login&signup/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool hide = true;
  bool isloading = false;
  logIn(context) async {
    setState(() {
      isloading = true;
    });
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);

      var snackBar = SnackBar(
        content: Text('The account is login ${credential.user!.email}'),
        backgroundColor: Colors.blue,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 6.0,
        duration: Duration(seconds: 1),
      );

      setState(() {
        isloading = false;
        email.clear();
        password.clear();
      });
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Future.delayed(snackBar.duration, () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BottomNavigation()),
        );
      });
      ;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        var snackBar = SnackBar(
          content: Text('No user found for that email.'),
          backgroundColor: Colors.blue,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 6.0,
          duration: Duration(seconds: 2),
        );
        setState(() {
          isloading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (e.code == 'wrong-password') {
        var snackBar = SnackBar(
          content: Text('Wrong password provided for that user.'),
          backgroundColor: Colors.blue,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 6.0,
          duration: Duration(seconds: 2),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        setState(() {
          isloading = false;
        });
      } else if (e.code == 'invalid-credential') {
        print('Wrong password provided for that user.');
        var snackBar = SnackBar(
          content: Text('User not exist.'),
          backgroundColor: Colors.blue,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 6.0,
          duration: Duration(seconds: 2),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        setState(() {
          isloading = false;
        });
      } else {
        var snackBar = SnackBar(
          content: Text('${e.code}'),
          backgroundColor: Colors.blue,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 6.0,
          duration: Duration(seconds: 2),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        setState(() {
          isloading = false;
        });
      }
    } catch (e) {
      print(e);
      var snackBar = SnackBar(
        content: Text('error : ${e}'),
        backgroundColor: Colors.blue,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 6.0,
        duration: Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {
        isloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Frame 18.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 90,
            ),
            Center(
              child: Container(
                width: 97,
                height: 94,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/logo.png"),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  "Deliver Favourite Food",
                  style: TextStyle(color: Colors.white, fontSize: 21),
                ),
              ),
            ),
            Center(
              child: Container(
                width: 300,
                height: 410,
                decoration: BoxDecoration(
                    color: Color(0xff1D102D),
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(30),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        controller: email,
                        decoration: InputDecoration(
                          hintText: "example,@345gmail.com",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 3)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade200, width: 2)),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        controller: password,
                        obscureText: hide,
                        decoration: InputDecoration(
                          hintText: "Password",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 3)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade200, width: 2)),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hide = !hide;
                                });
                              },
                              icon: Icon(
                                Icons.remove_red_eye_outlined,
                                color: Colors.white,
                              )),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forget Password? ",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: isloading
                          ? CircularProgressIndicator(
                              color: Colors.blue,
                            )
                          : Button(
                              ontap: () {
                                logIn(context);
                              },
                              insideText: "Login"),
                    ),
                    Container(
                        margin: EdgeInsets.all(8),
                        child: Text("Or",
                            style: TextStyle(
                                color: Color(0xffEC2578), fontSize: 12))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/google-icon 1.png"),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          width: 29,
                          height: 29,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/facebook-3 1.png",
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Text(
                    "Did not have account? ",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Builder(
                    builder: (context) => TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Signup()));
                        },
                        child: Text(
                          "REGISTER",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
