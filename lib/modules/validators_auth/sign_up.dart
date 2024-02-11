import 'package:flutter/material.dart';
import 'package:helper/common/common.dart';
import 'package:helper/common/custom_textf.dart';
import 'package:helper/core/extensions/extensions.dart';
import 'package:helper/core/validators.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class AuthScreens extends StatefulWidget {
  const AuthScreens({Key? key}) : super(key: key);

  @override
  AuthScreensState createState() => AuthScreensState();
}

class AuthScreensState extends State<AuthScreens> {
  late TextEditingController emailCtrl;
  late TextEditingController pwdCtrl;
  late TextEditingController confirmCtrl;
  late TextEditingController unameCtrl;

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    //* the initialization
    emailCtrl = TextEditingController(text: 'johndoe@gmail.com');
    unameCtrl = TextEditingController(text: 'blaqshyd');
    pwdCtrl = TextEditingController();
    confirmCtrl = TextEditingController();
  }

  @override
  void dispose() {
    emailCtrl.dispose();
    unameCtrl.dispose();
    pwdCtrl.dispose();
    confirmCtrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppSizing.padding,
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Sign Up',
                    style: Theme.of(context).textTheme.displaySmall),
                34.sbH,
                CustomTextf(
                  hintText: 'Enter your email address',
                  controller: emailCtrl,
                  validator: (_) => AppValidator.email(emailCtrl.text),
                ),
                12.sbH,
                CustomTextf(
                  hintText: 'Enter your username',
                  controller: unameCtrl,
                  validator: (_) => AppValidator.username(unameCtrl.text),
                ),
                12.sbH,
                CustomTextf(
                  hintText: 'Enter your password',
                  controller: pwdCtrl,
                  validator: (_) => AppValidator.password(pwdCtrl.text),
                  obscureText: !AppValidator.isPwdVisible,
                  suffixIcon: IconButton(
                    onPressed: () => setState(() {
                      AppValidator.togglePwd();
                    }),
                    icon: AppValidator.isPwdVisible
                        ? const Icon(Iconsax.eye_slash_copy)
                        : const Icon(Iconsax.eye_copy),
                  ),
                ),
                12.sbH,
                CustomTextf(
                  hintText: 'Confirm password',
                  controller: confirmCtrl,
                  obscureText: !AppValidator.isPwdVisible,
                  validator: (_) => AppValidator.confirmPwd(
                    pwd: pwdCtrl.text,
                    confirm: confirmCtrl.text,
                  ),
                ),
                24.sbH,
                // * This is the Listenable for multiple controllers
                ListenableBuilder(
                  listenable: Listenable.merge([pwdCtrl, confirmCtrl]),
                  builder: (context, child) {
                    var e =
                        confirmCtrl.text.isNotEmpty && pwdCtrl.text.isNotEmpty;
                    return ButtonUtil.build(
                      text: 'Create Account',
                      cta: e
                          ? () => setState(() {
                                debugPrint('Create');
                                isLoading = true;
                              })
                          : null,
                      bgColor: e ? Colors.deepPurpleAccent : null,
                    ).ignoreCTaps(isLoading);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
