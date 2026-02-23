import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiService {
  static const String apiKey = "AIzaSyBS9SNDRO1GJaJEo8O_uKY5ZPwkzJjr_9Q"; // Add your Gemini API key when needed

  static Future<String> generateText(String prompt) async {
    final url = Uri.parse(
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=$apiKey",
    );

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {"text": prompt}
            ]
          }
        ]
      }),
    );

    final data = jsonDecode(response.body);
    return data["candidates"][0]["content"]["parts"][0]["text"];
  }
}