import 'package:aurora_flutter/models/preset.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

Future<List<Preset>> loadPresets() async {
	var jsonAssets= [
		await rootBundle.loadString('assets/presets/color-presets.json'),
		await rootBundle.loadString('assets/presets/pattern-presets.json'),
		await rootBundle.loadString('assets/presets/music-presets.json')
	];
	var jsonMaps = jsonAssets.map(jsonDecode).toList();
	return jsonMaps.expand((p) => p).map((p) => Preset(p)).toList();
}
