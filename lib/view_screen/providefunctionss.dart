import 'package:flutter/foundation.dart';

class Calculatebills with ChangeNotifier {
  int units = 0;
  double bill = 0.0;
  bool showBill = false;


   //int get unitss => units;
  // double get bills => bill;

  void calculateBill(int units){
    //double bill;
    //units= int.tryParse(value) ?? 0;
    if(units > 500 ){
      bill = units*57.0;
    }else if(units > 300){
      bill = units*43.0;
    }else{
      bill = units*2;
      if(units >2000){
        bill= units*74.0;
      }
      bill = (!showBill) as double;
      // billamount = bill;
      notifyListeners();
    }
  }
  void resetBill(){
    units=0;
    bill = 0.0;
    notifyListeners();
  }
  void billDisplay(){
    showBill = !showBill;
    notifyListeners();
  }

  // int _count = 50;
  // int get count => _count;
  //
  // void setCount (){
  //   _count++;
  //   notifyListeners();
  }

