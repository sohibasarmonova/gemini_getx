import 'package:gemini_getx/domain/repositories/gemini_talk_repository.dart';

class GeminiTextAndImageUseCase {
  final GeminiTalkRepository repository;

  GeminiTextAndImageUseCase(this.repository);

  Future<String> call(String text, String base64) async {
    return await repository.onTextAndImage(text, base64);
  }
}