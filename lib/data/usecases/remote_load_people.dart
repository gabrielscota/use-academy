import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';
import '../http/http.dart';
import '../models/models.dart';

class RemoteLoadPeople implements LoadPeople {
  final HttpClient httpClient;
  final String url;

  RemoteLoadPeople({
    required this.httpClient,
    required this.url,
  });

  @override
  Future<List<PersonEntity>> loadPeople() async {
    final List<dynamic> response = await httpClient.request(url: '$url/people', method: 'get');

    return response.map((person) => RemotePersonModel.fromJson(person as Map<String, dynamic>).toEntity()).toList();
  }
}
