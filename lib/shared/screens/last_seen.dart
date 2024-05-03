import 'package:flutter/material.dart';

class LastSeen extends StatefulWidget {
  final String userStatus;

  const LastSeen({
    super.key,
    required this.userStatus,
  });

  @override
  LastSeenState createState() => LastSeenState();
}

class LastSeenState extends State<LastSeen> {
  DateTime? lastOnlineTimestamp;

  @override
  void initState() {
    super.initState();
    if (widget.userStatus == 'Online') {
      lastOnlineTimestamp = DateTime.now();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.userStatus == 'Online') {
      return const Text("Online");
    } else if (widget.userStatus == 'Offline') {
      if (lastOnlineTimestamp == null) {
        // Handle the case where there's no lastOnlineTimestamp available
        return const Text("Last seen: unknown");
      }

      Duration difference = DateTime.now().difference(lastOnlineTimestamp!);

      return Text(
        'Last seen ${formatTimeDiff(difference)} ago',
        overflow: TextOverflow.ellipsis,
      );
    } else {
      // Handle other status conditions if needed
      return Container();
    }
  }

  String formatTimeDiff(Duration difference) {
    if (difference.inDays > 0) {
      return '${difference.inDays}d';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m';
    } else {
      return 'Just now';
    }
  }
}



//  //ignore_for_file: must_be_immutable
// //TODO chore: Check this Last Seen
// import 'dart:async';

// import 'package:ark/core/constants/app_exports.dart';
// import 'package:flutter/material.dart';

// class LastSeen extends StatefulWidget {
//   String userStatus;

//   LastSeen({
//     Key? key,
//     required this.userStatus,
//   }) : super(key: key);

//   @override
//   LastSeenState createState() => LastSeenState();
// }

// class LastSeenState extends State<LastSeen> {
//   DateTime? lastOnlineTimestamp;
//   late Timer inactivityTimer;

//   @override
//   void initState() {
//     super.initState();

//     if (widget.userStatus == 'Online') {
//       lastOnlineTimestamp = DateTime.now();
//       startInactivityTimer();
//     } else if (widget.userStatus == 'Offline') {
//       lastOnlineTimestamp = DateTime.now();
//     }
//   }

//   @override
//   void dispose() {
//     inactivityTimer.cancel();
//     super.dispose();
//   }

//   void startInactivityTimer() {
//     const inactivityDuration = Duration(minutes: 5);

//     inactivityTimer = Timer(inactivityDuration, () {
//       if (mounted) {
//         setState(() {
//           widget.userStatus = 'Offline';
//           lastOnlineTimestamp = DateTime.now();
//         });
//       }
//     });
//   }

//   void resetInactivityTimer() {
//     // Cancel the current timer and start a new one
//     inactivityTimer.cancel();
//     startInactivityTimer();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (widget.userStatus == 'Online') {
//       resetInactivityTimer(); // Reset the timer when entering the conversation screen
//       return Text(
//         "Online",
//         style: AppTextTheme.sDark400.copyWith(
//           color: AppColors.neutral,
//         ),
//       );
//     } else if (widget.userStatus == 'Offline') {
//       if (lastOnlineTimestamp == null) {
//         return const Text("Last seen: Unknown");
//       }

//       Duration difference = DateTime.now().difference(lastOnlineTimestamp!);

//       return Text(
//         'Last seen ${formatTimeDiff(difference)} ago',
//         overflow: TextOverflow.ellipsis,
//         style: AppTextTheme.sDark400.copyWith(
//           color: AppColors.neutral,
//         ),
//       );
//     } else {
//       return Container();
//     }
//   }

//   String formatTimeDiff(Duration difference) {
//     if (difference.inDays > 0) {
//       return '${difference.inDays}d';
//     } else if (difference.inHours > 0) {
//       return '${difference.inHours}h';
//     } else if (difference.inMinutes > 0) {
//       return '${difference.inMinutes}m';
//     } else {
//       return 'Just now';
//     }
//   }
// }



//* Duplicate

// class LastSeen extends StatefulWidget {
//   String userStatus;

//   LastSeen({
//     Key? key,
//     required this.userStatus,
//   }) : super(key: key);

//   @override
//   LastSeenState createState() => LastSeenState();
// }

// class LastSeenState extends State<LastSeen> {
//   DateTime? lastOnlineTimestamp;
//   Timer? inactivityTimer; // Initialize with a default value

//   @override
//   void initState() {
//     super.initState();

//     if (widget.userStatus == 'Online') {
//       lastOnlineTimestamp = DateTime.now();
//       startInactivityTimer();
//     } else if (widget.userStatus == 'Offline') {
//       lastOnlineTimestamp = DateTime.now();
//     }
//   }

//   @override
//   void dispose() {
//     inactivityTimer!.cancel();
//     super.dispose();
//   }

  // void startInactivityTimer() {
  //   const inactivityDuration = Duration(minutes: 5);

  //   inactivityTimer = Timer(inactivityDuration, () {
  //     if (mounted) {
  //       setState(() {
  //         widget.userStatus = 'Offline';
  //         lastOnlineTimestamp = DateTime.now();
  //       });
  //     }
  //   });
  // }

//   void resetInactivityTimer() {
//     inactivityTimer!.cancel();
//     startInactivityTimer();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (widget.userStatus == 'Online') {
//       // resetInactivityTimer();
//       return Text(
//         "Online",
//         style: AppTextTheme.sDark400.copyWith(
//           color: AppColors.neutral,
//         ),
//       );
//     } else if (widget.userStatus == 'Offline') {
//       if (lastOnlineTimestamp == null) {
//         return const Text("Last seen: Unknown");
//       }

//       Duration difference = DateTime.now().difference(lastOnlineTimestamp!);

//       return Text(
//         'Last seen ${formatTimeDiff(difference)} ago',
//         overflow: TextOverflow.ellipsis,
//         style: AppTextTheme.sDark400.copyWith(
//           color: AppColors.neutral,
//         ),
//       );
//     } else {
//       return Container();
//     }
//   }

//   String formatTimeDiff(Duration difference) {
//     if (difference.inDays > 0) {
//       return '${difference.inDays}d';
//     } else if (difference.inHours > 0) {
//       return '${difference.inHours}h';
//     } else if (difference.inMinutes > 0) {
//       return '${difference.inMinutes}m';
//     } else {
//       return 'Just now';
//     }
//   }
// }

