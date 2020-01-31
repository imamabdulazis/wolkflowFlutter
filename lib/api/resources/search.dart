import 'package:wolkflow/api/api.dart';
import 'package:built_collection/built_collection.dart';

class SearchApi extends ApiResource {
  SearchApi(ApiClient client) : super(client);

  Future<Result> searchEntries(int page, String q) async {
    var items = await client.request('search', 'entries',
        named: {'page': page.toString()}, post: {'q': q});
    return normalizeEntriesResponse(BuiltList.from(
        client.deserializeList(EntryResponse.serializer, items)));
  }

  Future<Result> searchLinks(int page, String q) async {
    var items = await client.request('search', 'links',
        named: {'page': page.toString()}, post: {'q': q});
    return normalizeLinksResponse(
        BuiltList.from(client.deserializeList(LinkResponse.serializer, items)));
  }
}
