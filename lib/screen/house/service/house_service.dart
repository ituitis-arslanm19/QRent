import 'package:qrent/screen/house/model/house_model.dart';

import '../../../core/constants/app/Enums/HTTPRequestEnum.dart';
import '../../../core/managers/network/NetworkManager.dart';

abstract class IHouseService {
  final NetworkManager? manager;

  IHouseService(this.manager);

  Future<HouseModel> fetchHouse(Object? id);

  Future<HouseModel> saveHouse(HouseModel houseModel);

  getHouse(int i) {}
}

class HouseService extends IHouseService {
  HouseService(NetworkManager? manager) : super(manager);

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

  @override
  Future<HouseModel> saveHouse(HouseModel houseModel) async {
    final response = await manager!.coreDio!.send<HouseModel, HouseModel>(
      "http://10.0.2.2:8080/house",
      parseModel: HouseModel(),
      data: houseModel.toJson(),
      type: HttpTypes.POST,
      queryParameters: null,
    );
    print(response);
    return response.data ?? HouseModel();
  }
}
