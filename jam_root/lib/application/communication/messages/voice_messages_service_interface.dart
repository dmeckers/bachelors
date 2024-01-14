abstract class VoiceMessagesServiceInterface {
  Future<void> recordVoiceMessage({required String path});
  Future<void> stopRecording();
  Future<void> pauseRecording();
  Future<void> resumeRecording();
}
