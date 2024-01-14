// import 'dart:convert';
// import 'dart:typed_data';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:webcrypto/webcrypto.dart';

// typedef JsonWebKeyPair = ({String privateKey, String publicKey});

// final encrypterProvider = Provider((ref) => EncrypterService());

// class EncrypterService {
//   Future<JsonWebKeyPair> generateKeys() async {
//     final keyPair = await EcdhPrivateKey.generateKey(EllipticCurve.p256);
//     final publicKeyJwk = await keyPair.publicKey.exportJsonWebKey();
//     final privateKeyJwk = await keyPair.privateKey.exportJsonWebKey();

//     return (
//       privateKey: json.encode(privateKeyJwk),
//       publicKey: json.encode(publicKeyJwk),
//     );
//   }

//   Future<List<int>> deriveKey(
//     String senderJwk,
//     String receiverJwk,
//   ) async {
//     final senderPrivateKey = json.decode(senderJwk);
//     final senderEcdhKey = await EcdhPrivateKey.importJsonWebKey(
//       senderPrivateKey,
//       EllipticCurve.p256,
//     );

//     final receiverPublicKey = json.decode(receiverJwk);
//     final receiverEcdhKey = await EcdhPublicKey.importJsonWebKey(
//       receiverPublicKey,
//       EllipticCurve.p256,
//     );

//     // Generating CryptoKey
//     return await senderEcdhKey.deriveBits(256, receiverEcdhKey);
//   }

//   Future<String> encryptMessage(String message, List<int> deriveKey) async {
//     final Uint8List iv = Uint8List.fromList('Initialization Vector'.codeUnits);

//     // Importing cryptoKey
//     final aesGcmSecretKey = await AesGcmSecretKey.importRawKey(deriveKey);

//     // Converting message into bytes
//     final messageBytes = utf8.encode(message);

//     // Encrypting the message
//     final encryptedMessageBytes = await aesGcmSecretKey.encryptBytes(
//       messageBytes,
//       iv,
//     );

//     // Converting encrypted message into String
//     return base64Encode(encryptedMessageBytes);
//   }

//   Future<String> decryptMessage(
//     String encryptedMessage,
//     List<int> deriveKey,
//   ) async {
//     final Uint8List iv = Uint8List.fromList('Initialization Vector'.codeUnits);

//     // Importing cryptoKey
//     final aesGcmSecretKey = AesGcmSecretKey.importRawKey(deriveKey);

//     // Converting message into bytes
//     final messageBytes = base64Decode(encryptedMessage);

//     // Decrypting the message
//     final decryptedMessageBytes =
//         aesGcmSecretKey.then((key) => key.decryptBytes(messageBytes, iv));

//     // Converting decrypted message into String
//     return decryptedMessageBytes.then(utf8.decode);
//   }
// }
