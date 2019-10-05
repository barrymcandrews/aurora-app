import 'package:aurora_flutter/models/preset.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

class PresetWidget extends StatelessWidget {
	const PresetWidget({ Key key, this.preset }) : super(key: key);

	final Preset preset;

	bool isPlaceholder() {
		return preset == null;
	}

	Color getColor() {
		if (isPlaceholder() || preset.type != "levels") {
			return Colors.white;
		} else {
			return preset.flatColor;
		}
	}

	List<Widget> buildChildren(){
		List<Preset> firstSix = preset.children.sublist(0, [preset.children.length, 6].reduce(min));

		return firstSix.map((childPreset) => Container(
			margin: EdgeInsets.all(3),
			decoration: BoxDecoration(
				color: (childPreset.flatColor != null) ? childPreset.flatColor : Colors.white,
				borderRadius: BorderRadius.all(const Radius.circular(9.0)),
				boxShadow: [
					BoxShadow(
						color: Color.fromARGB(40, 0, 0, 0),
						blurRadius: 1.0,
						spreadRadius: 0.5,
						offset: Offset.zero,
					)
				]
			))).toList();
	}

	Widget buildBody() {
		if (isPlaceholder() || preset.type == "levels") return Text("");

		return Column(
			crossAxisAlignment: CrossAxisAlignment.stretch,
			children: <Widget>[
				Container(
					decoration: BoxDecoration(
						border: Border(bottom: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.08))),
					),
					child: Container(
						margin: EdgeInsets.fromLTRB(5, 5, 0, 2.5),
						child: Text(preset.name, style: TextStyle(color: Color.fromRGBO(88, 88, 88, 1.0)))
					),
				),
				Container(
				  child: GridView.count(
				  	crossAxisCount: 3,
				  	shrinkWrap: true,
				  	physics: NeverScrollableScrollPhysics(),
				  	padding: EdgeInsets.fromLTRB(0, 2.5, 0, 0),
				  	children: buildChildren()
				  ),
				),
			],
		);
	}

	@override
	Widget build(BuildContext context) {
		return GestureDetector(
			onTap: () async {
				if (preset != null) {
					await preset.send("Ceiling");
				}
			},
			child: Container(
				margin: EdgeInsets.all(12),
				decoration: BoxDecoration(
					color: getColor(),
					borderRadius: BorderRadius.all(const Radius.circular(9.0)),
					boxShadow: [
						BoxShadow(
							color: Color.fromARGB(40, 0, 0, 0),
							blurRadius: 5.0,
							spreadRadius: 1.0,
							offset: Offset.zero,
						)
					],
				),
				child: buildBody()
			)
		);
	}
}
