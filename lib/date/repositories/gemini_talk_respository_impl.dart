import 'package:dartz/dartz.dart';
import 'package:gemini_getx/date/datasources/http_service.dart';

import '../../domain/repositories/gemini_talk_repository.dart';

class GeminiTalkRepositoryImpl extends GeminiTalkRepository {
  @override
  Future<Either<String, String>> onTextOnly(String text) async {
    try {
      var response = await Network.POST(Network.API_GEMINI_TALK, Network.paramsTextOnly(text));
      var geminiTalk = Network.parseGeminiTalk(response!);
      var result = geminiTalk.candidates[0].content.parts[0].text;
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> onTextAndImage(
      String text, String base64) async {
    try {
      var response = await Network.POST(Network.API_GEMINI_TALK, Network.paramsTextAndImage(text, base64));
      var geminiTalk = Network.parseGeminiTalk(response!);
      var result = geminiTalk.candidates[0].content.parts[0].text;
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}