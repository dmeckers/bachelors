import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:jam/domain/domain.dart';

part 'chat_state.model.freezed.dart';
part 'chat_state.model.g.dart';

@freezed
abstract class ChatState with _$ChatState {
  @HiveType(typeId: 11, adapterName: 'ChatStateAdapter')
  const factory ChatState({
    @HiveField(0) String? messageDraft,
    @HiveField(1) ChatInputMode? inputMode,
    @HiveField(2) MessageModel? model,
  }) = _ChatState;
}
