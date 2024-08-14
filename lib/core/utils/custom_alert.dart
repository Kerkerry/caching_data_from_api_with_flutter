import 'package:alert_banner/types/enums.dart';
import 'package:alert_banner/widgets/alert.dart';
import 'package:flutter/material.dart';

class CustomAlert {
  CustomAlert._();

  static show(BuildContext context, String msg) {
    return showAlertBanner(
        context,
        () {},
        Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 54, 146, 64),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Text(
              msg,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
        alertBannerLocation: AlertBannerLocation.top,
        safeAreaTopEnabled:true
        );
  }
}
