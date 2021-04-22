import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:testtypes/unit/fetch.dart';
import 'fetch_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('fetchAlbum', () {
    test('retorna um album se a chamada http der ok', () async {
      final client = MockClient();

      when(client.get(Uri.https('jsonplaceholder.typicode.com', 'albums/1')))
          .thenAnswer((_) async =>
              http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200));

      expect(await fetchAlbum(client), isA<Album>());
    });

    test('Executa uma excecao se a chamada http der errado', () {
      final client = MockClient();

      when(client.get(Uri.https('jsonplaceholder.typicode.com', 'albums/1')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(fetchAlbum(client), throwsException);
    });
  });
}
