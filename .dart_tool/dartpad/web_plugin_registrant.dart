// Flutter web plugin registrant file.
//
// Generated file. Do not edit.
//

// @dart = 2.13
// ignore_for_file: type=lint

import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:package_info_plus/src/package_info_plus_web.dart';
import 'package:permission_handler_html/permission_handler_html.dart';
import 'package:wakelock_plus/src/wakelock_plus_web_plugin.dart';
import 'package:zego_express_engine/zego_express_engine_web.dart';
import 'package:zego_zpns/zego_zpns_web.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void registerPlugins([final Registrar? pluginRegistrar]) {
  final Registrar registrar = pluginRegistrar ?? webPluginRegistrar;
  FilePickerWeb.registerWith(registrar);
  PackageInfoPlusWebPlugin.registerWith(registrar);
  WebPermissionHandler.registerWith(registrar);
  WakelockPlusWebPlugin.registerWith(registrar);
  ZegoExpressEngineWeb.registerWith(registrar);
  ZegoZpnsPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}
