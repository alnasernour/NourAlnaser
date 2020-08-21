import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/users/Database.dart';
// My
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'model/Users.dart';
// import 'package:json_model/json_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "firstApp",
        // home:  Scaffold(
        // appBar: AppBar(title:Text("Home Page"),backgroundColor: Colors.purpleAccent, centerTitle: true, elevation: 8,),
        //),
        home: new LoginPage(),
        );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blueGrey,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // first child is img
          new Image(
            image: new AssetImage("assets/pic.jpeg"),
            fit: BoxFit.cover,
            color: Colors.black54,
            colorBlendMode: BlendMode.darken,
          ),
          // second child
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: 100.0,
              ),
              new Form(
                child: Theme(
                  data: new ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.teal,
                      inputDecorationTheme: new InputDecorationTheme(
                          labelStyle: new TextStyle(
                              color: Colors.teal, fontSize: 20.0))),
                  child: Container(
                    padding: const EdgeInsets.all(40.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new TextFormField(
                          decoration:
                              new InputDecoration(labelText: "Enter Email"),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        new TextFormField(
                          decoration:
                              new InputDecoration(labelText: "Enter Password"),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                        ),
                        new MaterialButton(
                            height: 50.4,
                            minWidth: 200.0,
                            color: Colors.teal,
                            textColor: Colors.white,
                            child: new Text("Login"),
                            splashColor: Colors.black,
                            onPressed: () {
                              //my code

                              var router = new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ThirdScreen());
                              Navigator.of(context).push(router);
                            }),
                        new Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                        ),
                        new MaterialButton(
                          height: 40.4,
                          minWidth: 100.0,
                          onPressed: () {
                            //my code

                            var router = new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ScondScreen());
                            Navigator.of(context).push(router);
                          },
                          color: Colors.teal,
                          textColor: Colors.white,
                          child: new Text("Sign up"),
                          splashColor: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ScondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<ScondScreen> {
  @override
  Widget build(BuildContext context) {
//mycode

    return new Scaffold(
      backgroundColor: Colors.blueGrey,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // first child is img
          new Image(
            image: new AssetImage("assets/pic.jpeg"),
            fit: BoxFit.cover,
            color: Colors.black54,
            colorBlendMode: BlendMode.darken,
          ),
          // second child
          new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new FlutterLogo(
                size: 70.0,
              ),
              new Form(
                child: Theme(
                  data: new ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.teal,
                      inputDecorationTheme: new InputDecorationTheme(
                          labelStyle: new TextStyle(
                              color: Colors.teal, fontSize: 20.0))),
                  child: Container(
                    padding: const EdgeInsets.all(40.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new TextFormField(
                          decoration:
                              new InputDecoration(labelText: "Enter your name"),
                          keyboardType: TextInputType.text,
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                        ),
                        new TextFormField(
                          decoration:
                              new InputDecoration(labelText: "Enter Email"),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                        ),
                        new TextFormField(
                          decoration:
                              new InputDecoration(labelText: "Enter Password"),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                        ),
                        new TextFormField(
                          decoration: new InputDecoration(
                              labelText: "Confirm Password"),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                        ),
                        new MaterialButton(
                            height: 50.4,
                            minWidth: 200.0,
                            color: Colors.teal,
                            textColor: Colors.white,
                            child: new Text("Register"),
                            splashColor: Colors.black,
                            onPressed: () {
                              //my code

                              var router = new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ThirdScreen());
                              Navigator.of(context).push(router);
                            })
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

// https://jsonplaceholder.typicode.com/posts

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {


  getData() async {
    var url = "https://jsonplaceholder.typicode.com/posts";
    var response = await http.get(url);
    var responsebody = convert.jsonDecode(response.body);
    log(responsebody[0].toString());

    // Converting the json of users to user list
//   convertData(responsebody);

    return responsebody;
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Users"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
      // first child is img
      new Image(
      image: new AssetImage("assets/pic.jpeg"),
      fit: BoxFit.cover,
      color: Colors.black54,
      colorBlendMode: BlendMode.darken,
    ),
            new FlutterLogo(
              size: 70.0,
            ),
      Center(
        child: Text("WELCOME ",
        style: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          letterSpacing: 2
        ),),

      ),
    ]),
    );
  }

  Future convertData() async {
    var data = getData();
    List<Users> users = data.map((user) => Users.fromMap(user)).toList();
    for (final user in users) {
      log(user.title);
      await DBProvider.db.newUser(user);
    }
  }
}
