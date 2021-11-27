import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

enum ButtonSwitchStatus {
  Off,
  Switching,
  On,
}

class ButtonSwitch extends StatefulWidget {
  ButtonSwitchStatus status = ButtonSwitchStatus.Off;
  final String offDesc;
  final String switchingDesc;
  final String onDesc;
  void Function(ButtonSwitchStatus curStatus, ButtonSwitchState buttonState)
      onPress;

  ButtonSwitch({
    //void Function(ButtonSwitchStatus curStatus, ButtonSwitchState buttonState) onPress,
    required this.onPress,
    required this.offDesc,
    required this.switchingDesc,
    required this.onDesc,
  });

  @override
  State<StatefulWidget> createState() {
    return ButtonSwitchState();
  }
}

class ButtonSwitchState extends State<ButtonSwitch> {
  changeButtonState(ButtonSwitchStatus status) {
    setState(() {
      this.widget.status = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    var child = Text("");
    switch (widget.status) {
      case ButtonSwitchStatus.Off:
        child = Text(widget.offDesc);
        break;
      case ButtonSwitchStatus.Switching:
        child = Text(widget.switchingDesc);
        break;
      case ButtonSwitchStatus.On:
        child = Text(widget.onDesc);
        break;
    }
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(32),
      child: ElevatedButton(
        onPressed: () {
          this.widget.onPress(this.widget.status, this);
        },
        child: child,
      ),
    );
  }
}
