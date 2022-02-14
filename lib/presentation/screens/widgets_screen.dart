import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:try_it_out/configs/constants.dart';
import 'package:try_it_out/models/t_widget.dart';
import 'package:try_it_out/presentation/mixins/app_stateless_widget.dart';
import 'package:try_it_out/presentation/widgets/appbar.dart';
import 'package:try_it_out/presentation/widgets/t_neumorphic_text.dart';

// ignore: must_be_immutable
class WidgetsScreen extends StatelessWidget with AppStatelessWidget {
  final String? parent;

  WidgetsScreen(this.parent, {Key? key}) : super(key: key);

  @override
  Widget widgetBuilder(BuildContext context) {
    return Scaffold(
      backgroundColor: themeData.backgroundColor,
      appBar: TAppbar(
        title: TNeumorphicText(
          parent != null ? "$parent's child" : "Starting Point",
          fontSize: 30,
        ),
        parentContext: context,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: wp(100) > 800 ? 3 : 2,
          childAspectRatio: 1.5,
        ),
        itemCount: ConstValues.widgets.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, i) {
          return NeumorphicButton(
            margin: const EdgeInsets.all(8.0),
            onPressed: () async {
              var x = await Navigator.pushNamed(context, ConstValues.widgets[i].route);
              if (x is TWidget) {
                Navigator.pop(context, x);
              }
            },
            style: NeumorphicStyle(
              shape: NeumorphicShape.concave,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(ConstValues.borderRadius)),
              depth: 4,
              lightSource: LightSource.topLeft,
              color: Colors.white,
              oppositeShadowLightSource: true,
              shadowDarkColor: ConstColors.darkGrey,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 0.5,
                    child: SvgPicture.asset(
                      ConstValues.widgets[i].icon,
                      color: Colors.black45,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(ConstValues.widgets[i].name),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
