// Copyright (c) 2020, the Servirtium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:servertium_flutter/climate_api.dart';
import 'package:servirtium/servirtium.dart';
import 'package:test/test.dart';

import 'climate_api_test.dart' as climateApiTest;
import 'config.dart';

void main() {
  group('Climate Api Playback Tests', () {
    ClimateApi climateApi;

    ServirtiumHandler handler;

    setUpAll(() async {
      final String address = 'localhost';
      final int port = 61417;

      climateApi = ClimateApi(apiUrl: 'http://$address:$port');

      handler = await Servirtium.runHttpServer(
        address: address,
        port: port,
        listener: PlaybackHttpListener(mocksPath: 'test/mocks'),
      );
    });

    test(
      AVERAGE_RAINFALL_FOR_GREAT_BRITAIN_FROM_1980_TO_1999_EXISTS,
      () async {
        handler.changeMethod(
          AVERAGE_RAINFALL_FOR_GREAT_BRITAIN_FROM_1980_TO_1999_EXISTS,
        );

        await climateApiTest
            .averageRainfallForGreatBritainFrom1980To1999Exists(climateApi);
      },
    );

    test(
      AVERAGE_RAINFALL_FOR_FRANCE_FROM_1980_TO_1999_EXISTS,
      () async {
        handler
            .changeMethod(AVERAGE_RAINFALL_FOR_FRANCE_FROM_1980_TO_1999_EXISTS);

        await climateApiTest
            .averageRainfallForFranceFrom1980To1999Exists(climateApi);
      },
    );

    test(
      AVERAGE_RAINFALL_FOR_EGYPT_FROM_1980_TO_1999_EXISTS,
      () async {
        handler
            .changeMethod(AVERAGE_RAINFALL_FOR_EGYPT_FROM_1980_TO_1999_EXISTS);

        await climateApiTest
            .averageRainfallForEgyptFrom1980To1999Exists(climateApi);
      },
    );

    test(
      AVERAGE_RAINFALL_FOR_GREAT_BRITAIN_FROM_1985_TO_1995_DOES_NOT_EXIST,
      () async {
        handler.changeMethod(
          AVERAGE_RAINFALL_FOR_GREAT_BRITAIN_FROM_1985_TO_1995_DOES_NOT_EXIST,
        );

        await climateApiTest
            .averageRainfallForGreatBritainFrom1985To1995DoesNotExist(
                climateApi);
      },
    );

    test(
      AVERAGE_RAINFALL_FOR_MIDDLE_EARTH_FROM_1980_TO_1999_DOES_NOT_EXIST,
      () async {
        handler.changeMethod(
          AVERAGE_RAINFALL_FOR_MIDDLE_EARTH_FROM_1980_TO_1999_DOES_NOT_EXIST,
        );
        await climateApiTest
            .averageRainfallForMiddleEarthFrom1980To1999DoesNotExist(
                climateApi);
      },
    );

    test(
      AVERAGE_RAINFALL_FOR_GREAT_BRITAIN_AND_FRANCE_FROM_1980_TO_1999_CAN_BE_CALCULATED_FROM_TWO_REQUESTS,
      () async {
        handler.changeMethod(
          AVERAGE_RAINFALL_FOR_GREAT_BRITAIN_AND_FRANCE_FROM_1980_TO_1999_CAN_BE_CALCULATED_FROM_TWO_REQUESTS,
        );

        await climateApiTest
            .averageRainfallForGreatBritainAndFranceFrom1980T01999CanBeCalculatedFromTwoRequests(
                climateApi);
      },
    );

    tearDownAll(() async {
      await handler?.stop();
    });
  });
}
