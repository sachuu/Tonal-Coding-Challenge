import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:metricwidget/styles/styles.dart';

// Instances of the bubble model data are used as parameters to create the Metric Bubble Widget 
// Due to providers method of updating the UI we can use stateless widgets

class MetricBubble extends StatelessWidget{
  String? label;
  int? weight;
  String? unit;

  MetricBubble({Key? key, this.label, this.weight, this.unit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 3.5,
      width: MediaQuery.of(context).size.width / 3.5,
      decoration: bubbleBoxDecoration,
      child: Stack(
        children: [
          svg,
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(label ?? "", style: labelTextStyle),
                  Text(weight.toString(), style: weightTextStyle),
                  Text(unit ?? "", style: unitTextStyle)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// SVG used for graph background
const String assetName = 'lib/assets/graph.svg';

final Widget svg = SvgPicture.asset(
  assetName,
  semanticsLabel: 'Acme Logo'
);