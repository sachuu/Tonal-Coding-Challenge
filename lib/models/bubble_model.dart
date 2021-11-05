import 'package:flutter/material.dart';

// All three bubble models can have their unique values updated so I've created three classes for each bubble with ChangeNotifier
// using providers this seperates the UI from the business logic 

class BubbleModelOne with ChangeNotifier{
  // Each intance has it's own properties for displaying metric data
  String? label;
  int? weight;
  final String? unit;

  BubbleModelOne(this.label, this.weight, this.unit);

  // Updating values calls notify listener which updates the UI
  void updateLabel(newLabel){
    if(newLabel != null){
      label = newLabel;
      notifyListeners();
    }
  }

  void updateWeight(newWeight){
    if(newWeight != null){
      weight = newWeight;
      notifyListeners();
    }
  }
}

class BubbleModelTwo with ChangeNotifier{
  String? label;
  int? weight;
  String? unit;

  BubbleModelTwo(this.label, this.weight, this.unit);

  void updateLabel(newLabel){
    if(newLabel != null){
      label = newLabel;
      notifyListeners();
    }
  }

  void updateWeight(newWeight){
    if(newWeight != null){
      weight = newWeight;
      notifyListeners();
    }
  }
}

class BubbleModelThree with ChangeNotifier{
  String? label;
  int? weight;
  String? unit;

  BubbleModelThree(this.label, this.weight, this.unit);

  void updateLabel(newLabel){
    if(newLabel != null){
      label = newLabel;
      notifyListeners();
    }
  }

  void updateWeight(newWeight){
    if(newWeight != null){
      weight = newWeight;
      notifyListeners();
    }
  }
}
