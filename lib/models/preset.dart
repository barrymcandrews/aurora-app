import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var client = new http.Client();
var url = 'http://192.168.1.11:5000/api/v2/presets';


class Preset {
	String name;
	String type;
	Color color;
	Color flatColor;
	Map<String, dynamic> map;
	List<Preset> children = [];

	Preset(Map<String, dynamic> data) {
		try { name = data['name']; } catch(err) {}
		type = data['type'];
		try { color = _colorFromHex(data['ui']['color']); } catch(err) {}
		try { flatColor = _colorFromHex(data['ui']['flatColor']); } catch(err) {}
		try {
			var c = data['children'].cast<Map<String, dynamic>>();
			c.forEach((e) => children.add(Preset(e)));
		} catch(err) {}
		map = data;
	}

	Future<http.Response> send(String deviceName) async {
		print("Sending " + name);
		try {
			var wrapper = {
				"name": name,
				"devices": [ deviceName ],
				"payload": map
			};
			return await client.post(url, body: json.encode(wrapper));
		} catch(err) {
			print(err);
			return null;
		}
	}
	Color _colorFromHex(String hexColor) {
		hexColor = hexColor.replaceAll("#", "");
		return Color(int.parse('FF' + hexColor, radix: 16));
	}
}
