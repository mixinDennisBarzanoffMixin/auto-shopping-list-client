import 'dart:convert';

import 'package:auto_shopping_list_client/protobuf/ShoppingList.pb.dart';
import 'package:http/http.dart' as http;

class ClickUpApi {
  final String _apiToken;
  final String _baseUrl = 'https://api.clickup.com/api/v2';

  ClickUpApi(this._apiToken);

  Future<ShoppingList> fetchShoppingList() async {
    String listId = '900400786224';

    var response = await http.get(
      Uri.parse('$_baseUrl/list/$listId/task'),
      headers: {
        'Authorization': _apiToken,
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var tasks = jsonResponse['tasks'] as List;

      return ShoppingList(items: [
        for (final task in tasks)
          ShoppingItem(
            name: task['name'],
            grams: double.parse(task['custom_fields'].where((element) => element['name'] == 'Grams').first['value'] ?? '0'),
          )
      ]);
    } else {
      throw Exception('Failed to load stores');
    }
  }
}
