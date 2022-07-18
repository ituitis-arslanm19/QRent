import 'package:qrent/core/managers/network/NetworkManager.dart';

import '../../../core/constants/app/Enums/HTTPRequestEnum.dart';
import '../../house/model/house_model.dart';
import '../model/home_model.dart';
import '../model/location_model.dart';

abstract class IHomeService {
  final NetworkManager? manager;
  Future<List<LocationModel>> fetchHomes();
  Future<HouseModel> fetchHouse(Object? id);
  IHomeService(this.manager);
}

class HomeService extends IHomeService {
  HomeService(NetworkManager? manager) : super(manager);

  Future<List<LocationModel>> fetchHomes() async {
    final response =
        await manager!.coreDio!.send<List<LocationModel>, LocationModel>(
      "http://10.0.2.2:8080/locations",
      parseModel: LocationModel(),
      type: HttpTypes.GET,
      queryParameters: null,
    );
    print(response);
    return response.data ?? [];
  }

  @override
  Future<HouseModel> fetchHouse(Object? id) async {
    final response = await manager!.coreDio!.send<HouseModel, HouseModel>(
      "http://10.0.2.2:8080/house/$id",
      parseModel: HouseModel(),
      type: HttpTypes.GET,
      data: id,
      queryParameters: null,
    );
    print(response);
    return response.data ?? HouseModel();
  }
}
