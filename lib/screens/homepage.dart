import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:metricwidget/styles/styles.dart';
import 'package:metricwidget/constants/constants.dart';
import 'package:metricwidget/models/bubble_model.dart';
import 'package:metricwidget/widgets/metric_bubble.dart';

class ConsumerWidget extends StatelessWidget {
  final GlobalKey<FormState> _updateBubbleFormKey = GlobalKey<FormState>();

  // Determines which toggle button is selected inside the form
  var currentSelect = 0;
  var isSelected = [true, false, false];

  ConsumerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Consumes and builds model that was provided in root of app
                Consumer<BubbleModelOne>(builder: (context, bubble, child) {
                  return Padding(
                    padding: EdgeInsets.only(right: widgetSidePadding),
                    child: MetricBubble(
                      label: bubble.label,
                      weight: bubble.weight,
                      unit: bubble.unit,
                    ),
                  );
                }),
                Consumer<BubbleModelTwo>(builder: (context, bubble, child) {
                  return MetricBubble(
                    label: bubble.label,
                    weight: bubble.weight,
                    unit: bubble.unit,
                  );
                }),
                Consumer<BubbleModelThree>(builder: (context, bubble, child) {
                  return Padding(
                    padding: EdgeInsets.only(left: widgetSidePadding),
                    child: MetricBubble(
                      label: bubble.label,
                      weight: bubble.weight,
                      unit: bubble.unit,
                    ),
                  );
                }),
              ],
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: buttonTopPadding),
                child: OutlinedButton(
                  onPressed: () {
                    // Bottom sheet used to display form data
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height - 300,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Form(
                                key: _updateBubbleFormKey,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: TextFormField(
                                        onSaved: (String? value) {
                                          if (value != "") {
                                            // Updating based on selected widget number in form
                                            switch (currentSelect) {
                                              case 0:
                                                // Provider allows access to method and will later notify listener of change prompting UI update
                                                Provider.of<BubbleModelOne>(
                                                  context,
                                                  listen: false,
                                                ).updateLabel(value);
                                                break;
                                              case 1:
                                                Provider.of<BubbleModelTwo>(
                                                  context,
                                                  listen: false,
                                                ).updateLabel(value);
                                                break;
                                              case 2:
                                                Provider.of<BubbleModelThree>(
                                                  context,
                                                  listen: false,
                                                ).updateLabel(value);
                                                break;
                                            }
                                          }
                                        },
                                        inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))],
                                        keyboardType: TextInputType.text,
                                        maxLength: 10,
                                        decoration: InputDecoration(
                                          icon: const Icon(Icons.label),
                                          hintText: formHintTextLabel,
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty ||
                                              value.length < 10) {
                                            return formSubmissionNullError;
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: TextFormField(
                                        onSaved: (String? value) {
                                          if (int.parse(value!) > 0 && value != '') {
                                            // Updating based on selected widget number in form
                                            switch (currentSelect) {
                                              case 0:
                                                // Provider allows access to method and will later notify listener of change prompting UI update
                                                Provider.of<BubbleModelOne>(
                                                  context,
                                                  listen: false,
                                                ).updateWeight(
                                                    int.parse(value));
                                                break;
                                              case 1:
                                                Provider.of<BubbleModelTwo>(
                                                  context,
                                                  listen: false,
                                                ).updateWeight(
                                                    int.parse(value));
                                                break;
                                              case 2:
                                                Provider.of<BubbleModelThree>(
                                                  context,
                                                  listen: false,
                                                ).updateWeight(
                                                    int.parse(value));
                                                break;
                                            }
                                          }
                                        },
                                        keyboardType: TextInputType.number,
                                        maxLength: 3,
                                        decoration: InputDecoration(
                                          icon: const Icon(Icons.label),
                                          hintText: formHintTextWeight,
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return formSubmissionNullError;
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Text(toggleButtonLabel, style: formTextStyle),
                                     ),
                                    // Toggle button used to select which widget user would like to update
                                    StatefulBuilder(
                                      builder: (BuildContext context,
                                          StateSetter stateSetter) {
                                        return ToggleButtons(
                                          children: const [
                                            Icon(Icons.looks_one),
                                            Icon(Icons.looks_two),
                                            Icon(Icons.looks_3)
                                          ],
                                          onPressed: (int index) {
                                            for (int i = 0;
                                                i < isSelected.length;
                                                i++) {
                                              if (index == i) {
                                                stateSetter(
                                                  () => {
                                                    isSelected[i] =
                                                        !isSelected[i],
                                                    currentSelect = index
                                                  },
                                                );
                                              } else {
                                                stateSetter(
                                                  () => isSelected[i] = false,
                                                );
                                              }
                                            }
                                          },
                                          isSelected: isSelected,
                                        );
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: submitButtonTopPadding,
                                      ),
                                      child: OutlinedButton(
                                        onPressed: () async {
                                          _updateBubbleFormKey.currentState!
                                              .save();
                                          Navigator.pop(context);
                                        },
                                        child: Text(formSubmit),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Text(updateButtonText),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
