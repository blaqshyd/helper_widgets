import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helper/core/core.dart';
import 'package:helper/shared/shared.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:local_auth/local_auth.dart';

class Keypad extends StatefulWidget {
  const Keypad({super.key});

  @override
  State<Keypad> createState() => _KeypadState();
}

class _KeypadState extends State<Keypad> {
  String? authorized;
  bool isAuthenticating = false;
  bool authenticated = false;

  late final TextEditingController _controller;
  late final LocalAuthentication _auth;

  @override
  void initState() {
    //* Request for permissions here
    _auth = LocalAuthentication();
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  FutureVoid _authenticate() async {
    try {
      authenticated = await _auth.authenticate(
        localizedReason: 'Let OS determine authentication method',
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
    } on PlatformException catch (e) {
      (e).log();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(controller: _controller),
            SizedBox(
                height: MediaQuery.sizeOf(context).height * .45,
                child: PinKeyboard(
                  controller: _controller,
                  onChange: (p0) {
                    'key pressed'.log();

                    setState(() {
                      // p0 = controller.text;
                      _controller.text = p0;
                    });
                  },
                  onBiometric: () {
                    _authenticate();
                    'biometric pressed!!!'.log();
                  },
                )),
          ],
        ),
      ),
    );
  }
}

class PinKeyboard extends StatefulWidget {
  final double space;
  final int length;
  final void Function(String)? onChange;
  final void Function(String)? onConfirm;
  final VoidCallback? onBiometric;
  final TextEditingController controller;

  const PinKeyboard({
    super.key,
    this.space = 60,
    this.length = 4,
    this.onChange,
    this.onConfirm,
    this.onBiometric,
    required this.controller,
  });

  @override
  State<PinKeyboard> createState() => _PinKeyboardState();
}

class _PinKeyboardState extends State<PinKeyboard> {
  // String _pinCode = "";

  int? length;

  @override
  void initState() {
    length = widget.length + 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 50.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _createNumber("1", _handleTabNumber),
              const Spacer(),
              _createNumber("2", _handleTabNumber),
              const Spacer(),
              _createNumber("3", _handleTabNumber),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _createNumber("4", _handleTabNumber),
              const Spacer(),
              _createNumber("5", _handleTabNumber),
              const Spacer(),
              _createNumber("6", _handleTabNumber),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _createNumber("7", _handleTabNumber),
              const Spacer(),
              _createNumber("8", _handleTabNumber),
              const Spacer(),
              _createNumber("9", _handleTabNumber),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _createBiometricIcon(),
              const Spacer(),
              _createNumber("0", _handleTabNumber),
              const Spacer(),
              _createBackspaceIcon(),
            ],
          ),
        ],
      ),
    );
  }

  _createNumber(String number, void Function(String) onPress) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.space.h),
      ),
      child: Container(
        height: widget.space.h,
        width: widget.space.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: AppColor.black7,
        ),
        child: Center(
          child: Text(
            number,
            style: GoogleFonts.nunito(
              fontSize: 30.sp,
              color: AppColor.background,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      onTap: () {
        onPress(number);
      },
    );
  }

  Widget _createImage(Widget icon, void Function() onPress) => InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.space.h),
        ),
        child: SizedBox(
          height: widget.space.h,
          width: widget.space.h,
          child: Center(child: icon),
        ),
        onTap: () {
          onPress();
        },
      );

  void _handleTabNumber(String number) {
    if (widget.controller.text.length + 1 == length) {
      return;
    }
    if (widget.onChange == null || widget.onConfirm == null) return;
    if (widget.controller.text.length < length!) {
      widget.controller.text += number;
      widget.onChange!(widget.controller.text);
      if (widget.controller.text.length == length) {
        widget.onConfirm!(widget.controller.text);
        widget.controller.text = "";
      }
    }
  }

  void _handleTabBiometric() {
    if (widget.onBiometric != null) widget.onBiometric!();
  }

  void _handleTabBackspace() {
    if (widget.controller.text.isNotEmpty) {
      widget.controller.text = widget.controller.text
          .substring(0, widget.controller.text.length - 1);
      if (widget.onChange != null) {
        widget.onChange!(widget.controller.text);
      }
    }
  }

  Widget _createBiometricIcon() {
    return _createImage(
      widget.onBiometric == null
          ? const SizedBox()
          : Container(
              height: widget.space.h,
              width: widget.space.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColor.black7,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Iconsax.finger_scan_copy,
                    size: 34.sp,
                    color: AppColor.background,
                  )
                ],
              ),
            ),
      _handleTabBiometric,
    );
  }

  Widget _createBackspaceIcon() {
    return _createImage(
      Container(
        height: widget.space.h,
        width: widget.space.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: AppColor.black7,
        ),
        child: Icon(
          Icons.backspace_outlined,
          size: 26.h,
          color: AppColor.background,
        ),
      ),
      _handleTabBackspace,
    );
  }
}
