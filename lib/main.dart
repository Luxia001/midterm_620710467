import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _lengthController = TextEditingController();
  final _girthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('PIG WEIGHT',
                              style: TextStyle(
                                  fontSize: 36.0,
                                  color: Colors.redAccent.shade200)),
                          Text('CALCULATOR',
                              style: TextStyle(
                                  fontSize: 36.0,
                                  color: Colors.redAccent.shade200)),
                          ],
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset('assets/images/pig.png', height: 200.0),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              const Text('LENGTH',
                                style: TextStyle(fontWeight: FontWeight.bold,
                                    fontSize: 20.0),),
                              const Text('(cm)',
                                style: TextStyle(fontWeight: FontWeight.bold,
                                    fontSize: 20.0),),

                              Padding(
                                padding: const EdgeInsets.only(top: 16.0, bottom: 10.0),
                                child: TextField(
                                    controller: _lengthController,
                                    decoration: const InputDecoration(
                                      hintText: 'Enter length',
                                    ),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 20.0)
                                ),

                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              const Text('GIRTH', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                              const Text('(cm)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),

                              Padding(
                                padding: const EdgeInsets.only(top: 16.0, bottom: 10.0),
                                child: TextField(
                                    controller: _girthController,
                                    decoration: const InputDecoration(
                                      hintText: 'Enter girth',
                                    ),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 20.0)
                                ),

                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: ElevatedButton(onPressed: (){
                  var lengthText = _lengthController.text;
                  var grithText =  _girthController.text;
                  double? length = double.tryParse(lengthText);
                  double? girth = double.tryParse(grithText);

                  if(girth == null ||  length== null){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("ERROR",style: TextStyle(
                              color: Color(0xFFF50000),
                          fontSize: 25.0,),
                          ),
                          content: const Text("Invalid input",style: TextStyle(
                            color: Color(0xFFF50075),
                            fontSize: 25.0,),),
                          actions: [
                            OutlinedButton(
                              child: const Text('OK',style: TextStyle(
                                color: Color(0xFF13B700),
                                fontSize: 25.0,),),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                  else{
                    var weight = (girth/100) * (girth/100) * (length/100) * 69.3;
                    var price = weight * 112.50;
                    var weightMax = (0.03 * weight)+weight;
                    var priceMax = (0.03 * price)+price;
                    var weightMin = weight-(0.03 * weight);
                    var priceMin = price-(0.03 * price);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Image.asset('assets/images/ic_pig.png',
                                    width: 40, height: 30),
                                Text('  RESULT'),
                              ],
                            ),
                          ),
                          content: Text('Weight: ${weightMin.round()} - ${weightMax.round()} kg\nPrice: ${priceMin.round()} - ${priceMax.round()} Baht'),
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                }, child: Text('CALCULATE'),),
              ),
            ],
          ),
      ),
    );
  }
}