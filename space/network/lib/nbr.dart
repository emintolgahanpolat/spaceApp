import 'dart:async';
import 'package:network/logger.dart';
import 'package:network/resource.dart';

class NetworkBoundResource<ResultType, RequestType> {
  final _result = StreamController<Resource<ResultType?>>();
  Stream<Resource<ResultType?>> asStream({
    required Stream<ResultType?> Function() loadFromDb,
    required bool Function(ResultType? data) shouldFetch,
    required Future<RequestType> Function() createCall,
    required FutureOr Function(RequestType item) saveCallResult,
  }) {
    Log.i("Call loading...", tag: "NBR");
    _result.sink.add(Resource.loading(null));

    _result.addStream(loadFromDb().transform(
        StreamTransformer<ResultType?, Resource<ResultType>>.fromHandlers(
            handleData: (event, sink) async {
      if (shouldFetch(event)) {
        Log.i("Fetch data and call loading", tag: "NBR");
        try {
          var res = await createCall();
          Log.i("Fetching success", tag: "NBR");
          _result.sink.add(Resource.success(processResponse(res)));
        } on Exception catch (e) {
          Log.i("Fetching failed", tag: "NBR");
          sink.add(Resource.error(e.toString(), null));
        }
      } else {
        Log.i("Fetching data its not necessary", tag: "NBR");
        sink.add(Resource.success(event));
      }
    })));

    return _result.stream;
  }

  ResultType processResponse(RequestType result) => result as ResultType;
}
