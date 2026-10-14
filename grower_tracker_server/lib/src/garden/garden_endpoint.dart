import 'package:grower_tracker_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class GardenEndpoint extends Endpoint {
  Future<List<PlantModel>> all(Session session) async {
    return PlantModel.db.find(session);
  }

  Future<List<PlantModel>> allByUser(Session session) async {
    var id = session.authenticated?.userIdentifier;
    if (id == null) throw Exception("Invalid id");

    return PlantModel.db.find(
      session,
      where: (t) => t.authUserId.equals(UuidValue.fromString(id)),
    );
  }

  Future<PlantModel> create(Session session, PlantModel plant) async {
    var id = session.authenticated?.userIdentifier;
    if (id == null) throw Exception("Invalid id");

    var withIdPlant = plant.copyWith(authUserId: UuidValue.fromString(id));
    return PlantModel.db.insertRow(session, withIdPlant);
  }

  Future<PlantModel> edit(Session session, PlantModel plant) async {
    return await PlantModel.db.updateRow(session, plant);
  }

  Future<PlantModel> delete(
    Session session,
    PlantModel plant,
  ) async {
    return await PlantModel.db.deleteRow(session, plant);
  }
}
