import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomImageViewer {
  CustomImageViewer._();

  static show(
      {required BuildContext context,
      required String url,
      BoxFit? fit,
      double? radius}) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: fit ?? BoxFit.cover,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(radius ?? 12),
            image: DecorationImage(
                image: imageProvider, fit: fit ?? BoxFit.cover)),
      ),
      placeholder: (context, url) => Container(),
      errorWidget: (context, url, error) => Container(
        width: double.infinity,
        child: Center(child: Icon(
          Icons.image,
          size: 60,
        ),),
        decoration: BoxDecoration(
          color: Theme.of(context).dialogBackgroundColor,
          borderRadius: BorderRadius.circular(radius??12)
        ),
      ),
    );
  }
}
