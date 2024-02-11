import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:helper/core/extensions/extensions.dart';
import 'package:helper/modules/custom_keyboard/numerical_keyboard.dart';
import 'package:helper/modules/reset_timer_counter/otp_screen.dart';

class ResetTimer extends StatefulWidget {
  const ResetTimer({Key? key}) : super(key: key);

  @override
  State<ResetTimer> createState() => _ResetTimerState();
}

class _ResetTimerState extends State<ResetTimer>
    with SingleTickerProviderStateMixin {
  bool timerExpired = false;

  final _timerExpired = ValueNotifier<bool>(false);
  late Tween<double> tween;
  late AnimationController controller;
  late TextEditingController textCtrl;
  late Key tweenKey;

  @override
  void initState() {
    super.initState();
    tween = Tween(begin: 60.0, end: 0);
    tweenKey = UniqueKey();
    textCtrl = TextEditingController();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    )
      ..forward()
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _timerExpired.value = true;
          if (kDebugMode) print('Timer complete');
        }
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _resetTimer() {
    setState(() {
      timerExpired = false;
      if (kDebugMode) print('Timer Reset');
      tween = Tween(begin: 60.0, end: 0);
      tweenKey = UniqueKey();
      controller.reset();
      controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            'OTP Verification'.txt(fontSize: 32),
            const OtpScreen(),
            const Spacer(),
            const NumericalKeyboard(),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('This code will expire in '),
                TweenAnimationBuilder(
                    key: tweenKey,
                    tween: tween,
                    duration: const Duration(seconds: 60),
                    onEnd: () {
                      setState(() => timerExpired = true);
                    },
                    builder: (context, value, child) {
                      var f = '00:${value.toInt().toString().padLeft(2, '0')}';
                      return f.txt();
                      // return timerExpired ? Text(format) : 'Resend OTP'.txt();
                    })
              ],
            ),
            23.sbH,
            ValueListenableBuilder<TextEditingValue>(
              valueListenable: textCtrl,
              builder: (context, value, child) {
                return timerExpired
                    ? ElevatedButton(
                        onPressed: _resetTimer,
                        child: 'Resend OTP'.txt(),
                      )
                    : const SizedBox.shrink();
              },
            ),
            const Spacer(),
          ],
        ),
      )),
    );
  }
}




/*
class ResetTimer extends StatefulWidget {
  const ResetTimer({Key? key}) : super(key: key);

  @override
  State<ResetTimer> createState() => _ResetTimerState();
}

class _ResetTimerState extends State<ResetTimer>
    with SingleTickerProviderStateMixin {
  final _timerExpired = ValueNotifier<bool>(false);
  late Tween<double> tween;
  late AnimationController controller;
  late TextEditingController textCtrl;
  late Key tweenKey;

  @override
  void initState() {
    super.initState();
    tween = Tween(begin: 60.0, end: 0);
    tweenKey = UniqueKey();
    textCtrl = TextEditingController();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    )
      ..forward()
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _timerExpired.value = true;
          if (kDebugMode) print('Timer complete');
        }
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _resetTimer() {
    _timerExpired.value = true;
    if (kDebugMode) print('Timer Reset');
    tween = Tween(begin: 60.0, end: 0);
    tweenKey = UniqueKey();
    controller.reset();
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            'OTP Verification'.txt(fontSize: 32),
            const OtpScreen(),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('This code will expire in '),
                TweenAnimationBuilder(
                    key: tweenKey,
                    tween: tween,
                    duration: const Duration(seconds: 60),
                    onEnd: () => _timerExpired.value = true,
                    builder: (context, value, child) {
                      var f = '00:${value.toInt().toString().padLeft(2, '0')}';
                      return f.txt();
                    })
              ],
            ),
            23.sbH,
            ValueListenableBuilder(
              valueListenable: _timerExpired,
              builder: (context, value, child) {
                return value
                    ? ElevatedButton(
                        onPressed: _resetTimer,
                        child: 'Resend OTP'.txt(),
                      )
                    : const SizedBox.shrink();
              },
            ),
            const Spacer(),
          ],
        ),
      )),
    );
  }
}
*/
