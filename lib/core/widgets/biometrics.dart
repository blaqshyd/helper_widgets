import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helper/core/core.dart';
import 'package:local_auth/local_auth.dart';

class BioMetrics extends StatefulWidget {
  const BioMetrics({super.key});

  @override
  BioMetricsState createState() => BioMetricsState();
}

class BioMetricsState extends State<BioMetrics> {
  final LocalAuthentication _auth = LocalAuthentication();
  bool authenticated = false;

  @override
  void initState() {
    //* Request for permissions here
    super.initState();
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
    } catch (e) {
      if (!mounted) (e).log();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: 64,
      decoration: ShapeDecoration(
        color: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: IconButton(
        icon: const Icon(
          Icons.fingerprint,
          color: Colors.white,
          size: 18,
        ),
        onPressed: () => _authenticate(),
      ),
    );
  }
}
