import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  OtpScreenState createState() => OtpScreenState();
}

class OtpScreenState extends State<OtpScreen> {
  final ValueNotifier<String> otpValueNotifier = ValueNotifier<String>("");
  final List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());

  List<TextEditingController> controllers =
      List.generate(4, (index) => TextEditingController());

  @override
  void dispose() {
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            4,
            (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 64,
                height: 68,
                child: TextFormField(
                  controller: controllers[index],
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      // Move focus to the next TextField when a digit is entered
                      if (index < 3) {
                        FocusScope.of(context).nextFocus();
                      }
                    } else {
                      // Move focus to the previous TextField when a digit is deleted
                      if (index > 0) {
                        FocusScope.of(context).previousFocus();
                      }
                    }
                  },
                  // onSaved: (newValue) => newValue = otpValueNotifier.value,
                  onSaved: (newValue) {
                    otpValueNotifier.value = newValue!;
                    if (kDebugMode) debugPrint(newValue);
                  },

                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
