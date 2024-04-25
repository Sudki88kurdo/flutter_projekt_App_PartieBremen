import 'dart:convert';
import 'package:http/http.dart' as http;
import 'entities/user.dart';

class APIService {
  static const baseUrl = 'https://api.partibremen.student.28apps-software.de';

  static Future<bool> registerUser(User user) async {
    final url = '$baseUrl/user';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(user.toJson()), // Konvertiere das User-Objekt in JSON
      );

      print('HTTP Statuscode: ${response.statusCode}');

      if (response.statusCode == 200) {
        return true; // Erfolgreich registriert
      } else {
        print('Fehler bei der Registrierung: ${response.body}');
        return false; // Fehler bei der Registrierung
      }
    } catch (e) {
      print('Fehler beim Verbinden mit der API: $e');
      return false; // Fehler beim Verbinden mit der API
    }
  }


//---------------------------------------------------------------------
  static Future<bool> loginUser(String email, String password) async {
    final url = '$baseUrl/user/login';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json', // Setze den Content-Type auf JSON
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );
      print('------------ HTTP Statuscode: ${response.statusCode}');
      if (response.statusCode == 200) {
        // Überprüfe die Antwort der API
        final responseData = jsonDecode(response.body);
        print('..............................');
        print(responseData);
        if (responseData['verified'] == true) {
          // Erfolgreich eingeloggt
          // Hier könntest du zusätzliche Verarbeitung durchführen, z.B. das Token extrahieren
          return true;
        } else {
          print('Falsche Anmeldeinformationen');
          print('Fehlermeldung: ${responseData['id']}');
          return false;
        }
      } else {
        print('Fehler bei der Anmeldung: ${response.body}');
        return false; // Fehler bei der Registrierung
      }
    } catch (e) {
      print('Fehler beim Verbinden mit der API: $e');
      return false; // Fehler beim Verbinden mit der API
    }
  }

}

