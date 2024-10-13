import 'package:movie_app/Features/home_feature/data/repos/saved_repo/saved_repo.dart';
import 'package:movie_app/core/utils/api_service.dart';

class SavedRepoImpl implements SavedRepo {
  final ApiService apiService;

  SavedRepoImpl(this.apiService);

  @override
  Future<void> addToFav({body}) async {
    await apiService.post(endPoint: 'account/21536210/favorite?', body: body);
  }
}
