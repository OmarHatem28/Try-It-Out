import 'package:flutter/material.dart';
import 'package:try_it_out/configs/constants.dart';
import 'package:try_it_out/presentation/mixins/app_stateless_widget.dart';

// ignore: must_be_immutable
class FailureScreen extends StatelessWidget with AppStatelessWidget {
  final void Function()? refresh;

  final String? errorMessage;

  FailureScreen({Key? key, required this.refresh, this.errorMessage}) : super(key: key);

  @override
  widgetBuilder(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.warning, color: Colors.yellow, size: hp(5)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: wp(2)),
            child: Text(
              errorMessage ?? ConstStrings.somethingWentWrong,
              style: textTheme.headline6?.copyWith(fontSize: hp(2.35)),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: refresh,
              child: const Text(ConstStrings.refresh),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: ConstColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(ConstValues.borderRadius),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
