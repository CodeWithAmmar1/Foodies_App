import 'package:app/Button/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool hide = true;
  bool isloading = false;
  signUp(context) async {
    setState(() {
      isloading = true;
    });
    try {
      UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      var snackBar = SnackBar(
        content: Text('The account is created ${credential.user!.email}'),
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
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        var snackBar = SnackBar(
          content: const Text('The password provided is too weak.'),
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
      } else if (e.code == 'email-already-in-use') {
        var snackBar = SnackBar(
          content: const Text('The account already exists for this email.'),
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
                        "Signup",
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
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: isloading
                          ? CircularProgressIndicator(
                              color: Colors.blue,
                            )
                          : Button(
                              ontap: () {
                                signUp(context);
                              },
                              insideText: "Create Account"),
                    ),
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
                    "Already have an account? ",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Builder(
                    builder: (context) => TextButton(
                        onPressed: () {},
                        child: Text(
                          "Signup",
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
