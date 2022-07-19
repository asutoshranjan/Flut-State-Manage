import 'package:flutter/material.dart';

class pizzaprovider extends ChangeNotifier{
  int numberofpizzas;
  pizzaprovider({
    this.numberofpizzas = 0,
  });
  void changeNumberofPizza(int newvalue){
    numberofpizzas = newvalue;
    notifyListeners();
  }
}