import 'package:flutter/material.dart';
void main(){
  runApp(Myapp());
}
class Myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomeApp(),
    );
  }
}
class MyHomeApp extends StatefulWidget {
  @override
  State<MyHomeApp> createState() => _MyHomeAppState();
}
class _MyHomeAppState extends State<MyHomeApp> {
  late TextEditingController _value1Controller,_value2Controller;
  late String _message;
  @override
  void initState() {
    _message = "";
    _value1Controller = TextEditingController();
    _value2Controller = TextEditingController();
  }
  Widget _buildvalue1TextField(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: TextField(
        controller: _value1Controller,
        decoration: InputDecoration(
            labelText: "Enter a number: "
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
  Widget _buildvalue2TextField(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: TextField(
        controller: _value2Controller,
        decoration: InputDecoration(
            labelText: "Enter a number: "
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
  void _calcUpdate(String opr){
    setState(() {
      final double value1= double.parse(_value1Controller.text);
      final double value2= double.parse(_value2Controller.text);
      switch(opr){
        case "+" : {
          _message=(value1+value2).toString();
        }break;
        case "-" : {
          _message=(value1-value2).toString();
        }break;
        case "*" : {
          _message=(value1*value2).toString();
        }break;
        case "/" : {
          _message=(value1/value2).toString();
        }
      }
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _value1Controller.dispose();
    _value2Controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simple Calculator"),),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Text("Output: $_message", style: TextStyle(fontSize: 25),),
            ),
            Divider(height: 4,color: Colors.grey, thickness: 5,),
            _buildvalue1TextField(),
            _buildvalue2TextField(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: () {
                  _calcUpdate("+");
                }, child: Text("+"),
                ),
                ElevatedButton(onPressed: () {
                  _calcUpdate("-");
                }, child: Text("-"),
                ),
                ElevatedButton(onPressed: () {
                  _calcUpdate("*");
                }, child: Text("*"),
                ),
                ElevatedButton(onPressed: () {
                  _calcUpdate("/");
                }, child: Text("/"),
                ),
              ],
            ),
            ElevatedButton(onPressed: (){
              setState(() {
                _message=0.toString();
                _value2Controller.clear();
                _value1Controller.clear();
              });
            }, child: Text("Clear"),),
          ],
        ),
      ),
    );
  }
}
