import 'package:dio/dio.dart';
import 'dio_service.dart';

class DioServiceImp implements DioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/4/',
        headers: {
          'content-type': 'application/json; charset=utf-8',
          'authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5MGVjZDc0M2I5NTNiYWFkMDhmYzk5OWE4NzdjYmI0MyIsInN1YiI6IjY0YTc1ODQyZjkyNTMyMDEyZDM5NTM1OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.WKVtViU5bdYsa8lPSE5b06lnX3Yc4FI92vQtRj7hiwo',
          'accept': 'application/json',
        },
      ),
    );
  }
}
