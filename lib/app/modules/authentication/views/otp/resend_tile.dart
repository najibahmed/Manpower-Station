import 'package:flutter/material.dart';
import 'dart:async';

import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/config/theme/my_fonts.dart';

class ResendSmsTile extends StatefulWidget {
  @override
  _ResendSmsTileState createState() => _ResendSmsTileState();
}

class _ResendSmsTileState extends State<ResendSmsTile> {
  Timer? _timer;
  int _start = 30;
  bool _isTileActive = false;
  FocusNode emailFocusNode=FocusNode();

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _isTileActive = false;
    _start = 30;
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
          _isTileActive = true;
          emailFocusNode.hasFocus;
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListTile(
      focusNode: emailFocusNode,
      focusColor: LightThemeColors.primaryColor,
      enabled: _isTileActive,
      onTap: _isTileActive ? _resendSms : null,
      leading: Icon(Icons.sms, color: _isTileActive ? LightThemeColors.primaryColor :LightThemeColors.opacityTextColor),
      title: Text('Resend SMS'),
      trailing:  _isTileActive ? Text(''):Text('Wait $_start s',
        style: TextStyle(
          fontSize: MyFonts.bodySmallTextSize,
          color:LightThemeColors.primaryColor
        )
      ),
    );
  }

  void _resendSms() {
    // Your resend SMS logic here
    print('SMS resent');
    emailFocusNode.unfocus();
    // Restart the timer after resending
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    emailFocusNode.dispose();
    super.dispose();
  }
}