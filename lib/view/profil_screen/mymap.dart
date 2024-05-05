import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controller/profil_controllers/map_controller.dart';

class MyMap extends StatelessWidget {
  const MyMap({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MapControllerImp());
    return Scaffold(
      body: GetBuilder<MapControllerImp>(
        builder: (mycontroller) => Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              myLocationEnabled: true,
              markers: mycontroller.mymarkers,
              initialCameraPosition: mycontroller.kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                if (!mycontroller.googlecontroller.isCompleted) {
                  mycontroller.googlecontroller.complete(controller);
                }
              },
            ),
            Positioned(
              top: 30,
              left: 2,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                iconSize: 30,
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Color.fromARGB(255, 8, 59, 100),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
