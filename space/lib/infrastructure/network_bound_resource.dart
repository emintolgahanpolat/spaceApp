import 'dart:async';

import 'package:space/infrastructure/logger.dart';
import 'package:space/infrastructure/resource.dart';

class NetworkBoundResource<ResultType, RequestType> {
  final _result = StreamController<Resource<ResultType?>>();
  Stream<Resource<ResultType?>> asStream({
    required Future<ResultType?> Function() loadFromDb,
    required bool Function(ResultType? data) shouldFetch,
    required Future<RequestType> Function() createCall,
    required FutureOr Function(RequestType? item) saveCallResult,
  }) {
    Log.i("Yükleniyor..", tag: "NetworkBoundResource");
    _result.sink.add(Resource.loading(null));

    loadFromDb().then((event) async {
      if (shouldFetch(event)) {
        try {
          var res = await createCall();
          Log.i("İnternetten yüklendi", tag: "NetworkBoundResource");
          saveCallResult(res);
          _result.sink.add(Resource.success(processResponse(res)));
        } on Exception catch (e) {
          Log.e("İnteretten yüklenemedi", tag: "NetworkBoundResource");
          _result.sink.add(Resource.error(e.toString(), null));
        }
      } else {
        Log.i("Cihazdan yüklendi", tag: "NetworkBoundResource");
        _result.sink.add(Resource.success(event));
      }
    });

    return _result.stream;
  }

  ResultType processResponse(RequestType result) => result as ResultType;
}
