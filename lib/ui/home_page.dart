import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/authentication/authentication_bloc.dart';
import 'package:flutter_firebase/authentication/authentication_events.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc  authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Home Page'),
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.white,
            fontSize: 20.0
          )
        ),
      ),
     body: Container(
        child: Center(
            child: RaisedButton(
              child: Text('logout'),
                onPressed: () {
                  authenticationBloc.dispatch(LoggedOut());
          },
        )),
      ),
    );
  }
}