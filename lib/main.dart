import 'package:flutter/material.dart';
import 'package:quiz_test/second_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CounterApp(),
    );
  }
}

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Counter value = $number", style: const TextStyle(fontSize: 30),),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            backgroundColor: Colors.green
                        ),
                        onPressed: (){
                          setState(() {
                            number++;
                            if(number == 5){
                              showDialog(context: context, builder: (context) {
                                return AlertDialog(
                                  title: Text("Counter Alert"),
                                  content: Text("Counter Value is 5!"),
                                  actions: [
                                    TextButton(onPressed: (){
                                      Navigator.pop(context);
                                    }, child: const Text("OK")
                                    )
                                  ],
                                );
                              },
                              );
                            }
                            if(number == 10){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => const SecondScreen(),));
                            }
                          });
                        },
                        child: const Text("Increment")
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            backgroundColor: Colors.red
                        ),
                        onPressed: (){
                          setState(() {
                            number--;
                          });
                        },
                        child: const Text("Decrement")
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
