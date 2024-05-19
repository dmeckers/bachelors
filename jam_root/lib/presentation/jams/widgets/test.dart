// import 'package:flutter/material.dart';
// import 'package:qr_flutter/qr_flutter.dart';
// import 'package:uuid/uuid.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class QRInviteScreen extends StatefulWidget {
//   @override
//   _QRInviteScreenState createState() => _QRInviteScreenState();
// }

// class _QRInviteScreenState extends State<QRInviteScreen> {
//   String _inviteLink;
//   bool _isLoading = false;

//   Future<void> _generateInviteLink() async {
//     setState(() {
//       _isLoading = true;
//     });

//     // Generate a unique token
//     var uuid = Uuid();
//     String token = uuid.v4();

//     // Example inviter ID and invitee email
//     String inviterId = 'example-inviter-id';
//     String inviteeEmail = 'friend@example.com';

//     // Insert the token and other details into the Supabase database
//     final response = await Supabase.instance.client.from('invitations').insert({
//       'inviter_id': inviterId,
//       'invitee_email': inviteeEmail,
//       'token': token,
//     });

//     if (response.error == null) {
//       setState(() {
//         _inviteLink = 'https://yourapp.com/invite?token=$token';
//         _isLoading = false;
//       });
//     } else {
//       setState(() {
//         _isLoading = false;
//       });
//       // Handle error
//       print('Failed to store invite data: ${response.error.message}');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Invite via QR Code'),
//       ),
//       body: Center(
//         child: _isLoading
//             ? CircularProgressIndicator()
//             : _inviteLink == null
//                 ? ElevatedButton(
//                     onPressed: _generateInviteLink,
//                     child: Text('Generate Invite Link'),
//                   )
//                 : QrImage(
//                     data: _inviteLink,
//                     version: QrVersions.auto,
//                     size: 200.0,
//                   ),
//       ),
//     );
//   }
// }
