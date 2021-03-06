import 'package:flutter_driver/flutter_driver.dart';
import 'package:servertium_flutter/climate_api.dart';
import 'package:servirtium/servirtium.dart';
import 'package:test/test.dart';

void main() {
  group('Climate App Recording', () {
    final averageTextFinder = find.byValueKey('average');

    FlutterDriver driver;
    ServirtiumHandler handler;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
      final String address = 'localhost';
      final int port = 8080;
      handler = await Servirtium.runHttpServer(
        address: address,
        port: port,
        listener: RecordingHttpListener(
          mocksPath: 'test_driver/mocks',
          originUrl: ClimateApi.climateApiUrl,
        ),
      );
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
        await handler?.stop();
      }
    });

    test('average is empty at the begginning', () async {
      expect(await driver.getText(averageTextFinder), '');
    });

    test('pressing the button returns the average rainfall', () async {
      handler
          ?.changeMethod('averageRainfallForGreatBritainFrom1980to1999Exists');
      await driver.tap(find.byValueKey('fromYear'));
      await driver.enterText('1980');
      await driver.tap(find.byValueKey('toYear'));
      await driver.enterText('1999');
      await driver.tap(find.byValueKey('countryISOs'));
      await driver.enterText('gbr');
      await driver.tap(find.byValueKey('getAverageRainfall'));
      await driver.waitFor(find.text('988.8454972331015'));
      expect(await driver.getText(averageTextFinder), '988.8454972331015');
    }, timeout: Timeout(Duration(seconds: 30)));
  });
}
