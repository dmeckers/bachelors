import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jam/domain/domain.dart';
import 'package:jam_utils/jam_utils.dart';

class JamRouterCodec extends Codec<Object?, Object?> {
  const JamRouterCodec();

  @override
  Converter<Object?, Object?> get decoder => const _JamRouterDecoder();

  @override
  Converter<Object?, Object?> get encoder => const _JamRouterEncoder();
}

class _JamRouterDecoder extends Converter<Object?, Object?> {
  const _JamRouterDecoder();

  @override
  Object? convert(Object? input) {
    if (input.isNull) return null;

    if ((input as List).first == 'LatLng') {
      return LatLng.fromJson(input[1] as Map<String, dynamic>);
    }

    if (input.first.startsWith('list:')) {
      final jsonClassId = (input.first as String).split(':').second;
      final list = (input.second as String).split(',');

      return list
          .map(
            (e) => _exhaustiveFromJson(jsonClassId, e as Map<String, dynamic>),
          )
          .toList();
    }

    return _exhaustiveFromJson(
      input.first,
      input.second as Map<String, dynamic>,
    );
  }

  _exhaustiveFromJson(String jsonClassId, Map<String, dynamic> json) =>
      switch (jsonClassId) {
        JamModel.jsonClassId => JamModel.fromJson(json),
        FriendInviteModel.jsonClassId => FriendInviteModel.fromJson(json),
        ChatModel.jsonClassId => ChatModel.fromJson(json),
        VibeModel.jsonClassId => VibeModel.fromJson(json),
        _ => throw FormatException('Unsupported type: $jsonClassId'),
      };
}

class _JamRouterEncoder extends Converter<Object?, Object?> {
  const _JamRouterEncoder();

  @override
  Object? convert(Object? input) {
    if (input.isNull) return null;
    if (input.runtimeType == LatLng) {
      return ['LatLng', (input as LatLng).toJson()];
    }

    if (input is List && input.isNotEmpty && input.first is Jsonable) {
      return [
        'list:${(input.first as Jsonable).getJsonClassId()}',
        input.map((e) => (e as Jsonable).toJson()).join(',')
      ];
    }

    if (input is Jsonable) {
      return [input.getJsonClassId(), input.toJson()];
    } else {
      throw FormatException('Unsupported type: ${input.runtimeType}');
    }
  }
}
