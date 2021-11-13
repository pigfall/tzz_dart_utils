import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class ButtonSwitch extends StatefulWidget {
  bool initedIsOn = false;
  bool Function(bool isOn) onChanged;
  ButtonSwitch({
    Key? key,
    required this.onChanged,
    this.initedIsOn = false,
  }) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<ButtonSwitch> createState() => _ButtonSwitchState(this.initedIsOn);
}

class _ButtonSwitchState extends State<ButtonSwitch> {
  _ButtonSwitchState(bool isOn) {
    this.isOn = isOn;
  }
  bool isOn = false;
  @override
  Widget build(BuildContext context) {
    return Switch(
        value: this.isOn,
        onChanged: (bool isOn) {
          isOn = this.widget.onChanged(isOn);
          setState(() {
            print(isOn);
            this.isOn = isOn;
          });
        });
  }
}
