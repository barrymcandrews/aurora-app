import 'package:aurora_flutter/components/presetblock.dart';
import 'package:aurora_flutter/models/preset.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PresetGrid extends StatelessWidget {
	const PresetGrid({ Key key, this.presets }) : super(key: key);

	final List<Preset> presets;

	List<Widget> placeholder() {
		return List.generate(20, (i) {
			return PresetWidget();
		});
	}

	List<PresetWidget> presetWidgets() {
		return presets.map((preset) => PresetWidget(preset: preset)).toList();
	}

	@override
	Widget build(BuildContext context) {
		return ListView(
			physics: (presets == null) ? const NeverScrollableScrollPhysics() : null,
			children: <Widget> [
				Container(
//					child: Text("Colors", style: TextStyle(fontSize: 34, color: Color.fromARGB(255, 88, 88, 88))),
					child: DropdownButton(

						items: <DropdownMenuItem> [
							DropdownMenuItem(child: Text("Ceiling")),
							DropdownMenuItem(child: Text("Backlight")),
							DropdownMenuItem(child: Text("All Lights")),
						],
						onChanged: (dynamic) {},
						),
					padding: EdgeInsets.fromLTRB(24, 24, 0, 0),
				),
				GridView.count(
					crossAxisCount: 3,
					padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
					children: (presets == null) ? placeholder() : presetWidgets(),
					physics: const NeverScrollableScrollPhysics(),
					shrinkWrap: true,
				)
			]
		);
	}
}
