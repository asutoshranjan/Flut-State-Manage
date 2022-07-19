import 'package:flut_py/provider/pizzaprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyPizza extends StatefulWidget {
  const MyPizza({Key? key}) : super(key: key);

  @override
  _MyPizzaState createState() => _MyPizzaState();
}

class _MyPizzaState extends State<MyPizza> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => pizzaprovider())],
      child: MyPizzaApp(),
    );
  }
}

class MyPizzaApp extends StatelessWidget {
  const MyPizzaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Pizza(),
    );
  }
}

class Pizza extends StatefulWidget {
  const Pizza({Key? key}) : super(key: key);

  @override
  _PizzaState createState() => _PizzaState();
}

class _PizzaState extends State<Pizza> {
  @override
  Widget build(BuildContext context) {
    int numberOfPizza = Provider.of<pizzaprovider>(context).numberofpizzas;
    return Scaffold(
      appBar: AppBar(
        title: Text("Pizza App"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text("Number of Pizzas :"),
            Text(numberOfPizza.toString()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<pizzaprovider>(context, listen: false).changeNumberofPizza(++numberOfPizza);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
