import 'package:aurora_flutter/components/presetgrid.dart';
import 'package:aurora_flutter/models/preset.dart';
import 'package:aurora_flutter/services/presets.dart';
import 'package:aurora_flutter/services/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  Widget futureGrid() {
    return FutureBuilder<List<Preset>>(
      future: loadPresets(),
      builder: (context, snapshot) => PresetGrid(presets: snapshot.data),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "A U R O R A",
          style: TextStyle(fontFamily: "Anurati", fontSize: 30),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: AColors.mainGradient),
        ),
      ),
      body: futureGrid(),
    );
  }
}
