import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MethodChannelImplementation(),
    );
  }
}

class MethodChannelImplementation extends StatefulWidget {
  @override
  _MethodChannelImplementationState createState() => _MethodChannelImplementationState();
}

class _MethodChannelImplementationState extends State<MethodChannelImplementation> {

  String methodChannelValue;

  static const methodChannel = MethodChannel("username");
  
  @override
  void initState() {
    super.initState();
    methodChannelValue = "Not Initiated";
  }

  void initMethodChannel() async{
    String returnedValue = await methodChannel.invokeMethod("getUserName");

    if(returnedValue != null){
      setState(() {
        methodChannelValue = returnedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Method Channel"),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(methodChannelValue),
            RaisedButton(
              onPressed: initMethodChannel,
              child: Text("Initiate Method Channel"),
            ),
          ],
        ),
      ),
    );
  }
}
