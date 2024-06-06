/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/blue_blob.png
  AssetGenImage get blueBlob =>
      const AssetGenImage('assets/images/blue_blob.png');

  /// File path: assets/images/first_page.png
  AssetGenImage get firstPage =>
      const AssetGenImage('assets/images/first_page.png');

  /// File path: assets/images/login_blob.png
  AssetGenImage get loginBlob =>
      const AssetGenImage('assets/images/login_blob.png');

  /// File path: assets/images/login_blob2.png
  AssetGenImage get loginBlob2 =>
      const AssetGenImage('assets/images/login_blob2.png');

  /// File path: assets/images/purple_blob.png
  AssetGenImage get purpleBlob =>
      const AssetGenImage('assets/images/purple_blob.png');

  /// File path: assets/images/round_blob.png
  AssetGenImage get roundBlob =>
      const AssetGenImage('assets/images/round_blob.png');

  /// File path: assets/images/second_page.png
  AssetGenImage get secondPage =>
      const AssetGenImage('assets/images/second_page.png');

  /// File path: assets/images/superman.png
  AssetGenImage get superman =>
      const AssetGenImage('assets/images/superman.png');

  /// File path: assets/images/yellow_blob.png
  AssetGenImage get yellowBlob =>
      const AssetGenImage('assets/images/yellow_blob.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        blueBlob,
        firstPage,
        loginBlob,
        loginBlob2,
        purpleBlob,
        roundBlob,
        secondPage,
        superman,
        yellowBlob
      ];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/amico.svg
  SvgGenImage get amico => const SvgGenImage('assets/svg/amico.svg');

  /// File path: assets/svg/blog_align_center.svg
  SvgGenImage get blogAlignCenter =>
      const SvgGenImage('assets/svg/blog_align_center.svg');

  /// File path: assets/svg/blog_align_left.svg
  SvgGenImage get blogAlignLeft =>
      const SvgGenImage('assets/svg/blog_align_left.svg');

  /// File path: assets/svg/blog_align_right.svg
  SvgGenImage get blogAlignRight =>
      const SvgGenImage('assets/svg/blog_align_right.svg');

  /// File path: assets/svg/blog_bold.svg
  SvgGenImage get blogBold => const SvgGenImage('assets/svg/blog_bold.svg');

  /// File path: assets/svg/blog_bullet_list.svg
  SvgGenImage get blogBulletList =>
      const SvgGenImage('assets/svg/blog_bullet_list.svg');

  /// File path: assets/svg/blog_bullet_numbered.svg
  SvgGenImage get blogBulletNumbered =>
      const SvgGenImage('assets/svg/blog_bullet_numbered.svg');

  /// File path: assets/svg/blog_cloud_upload.svg
  SvgGenImage get blogCloudUpload =>
      const SvgGenImage('assets/svg/blog_cloud_upload.svg');

  /// File path: assets/svg/blog_edit.svg
  SvgGenImage get blogEdit => const SvgGenImage('assets/svg/blog_edit.svg');

  /// File path: assets/svg/blog_fill_color.svg
  SvgGenImage get blogFillColor =>
      const SvgGenImage('assets/svg/blog_fill_color.svg');

  /// File path: assets/svg/blog_format_color.svg
  SvgGenImage get blogFormatColor =>
      const SvgGenImage('assets/svg/blog_format_color.svg');

  /// File path: assets/svg/blog_header.svg
  SvgGenImage get blogHeader => const SvgGenImage('assets/svg/blog_header.svg');

  /// File path: assets/svg/blog_image.svg
  SvgGenImage get blogImage => const SvgGenImage('assets/svg/blog_image.svg');

  /// File path: assets/svg/blog_italic.svg
  SvgGenImage get blogItalic => const SvgGenImage('assets/svg/blog_italic.svg');

  /// File path: assets/svg/blog_link.svg
  SvgGenImage get blogLink => const SvgGenImage('assets/svg/blog_link.svg');

  /// File path: assets/svg/blog_strikethrough.svg
  SvgGenImage get blogStrikethrough =>
      const SvgGenImage('assets/svg/blog_strikethrough.svg');

  /// File path: assets/svg/blog_subscript.svg
  SvgGenImage get blogSubscript =>
      const SvgGenImage('assets/svg/blog_subscript.svg');

  /// File path: assets/svg/blog_superscript.svg
  SvgGenImage get blogSuperscript =>
      const SvgGenImage('assets/svg/blog_superscript.svg');

  /// File path: assets/svg/blog_tag.svg
  SvgGenImage get blogTag => const SvgGenImage('assets/svg/blog_tag.svg');

  /// File path: assets/svg/blog_underline.svg
  SvgGenImage get blogUnderline =>
      const SvgGenImage('assets/svg/blog_underline.svg');

  /// File path: assets/svg/cuate.svg
  SvgGenImage get cuate => const SvgGenImage('assets/svg/cuate.svg');

  /// File path: assets/svg/email_prefix_icon.svg
  SvgGenImage get emailPrefixIcon =>
      const SvgGenImage('assets/svg/email_prefix_icon.svg');

  /// File path: assets/svg/password_prefix_icon.svg
  SvgGenImage get passwordPrefixIcon =>
      const SvgGenImage('assets/svg/password_prefix_icon.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        amico,
        blogAlignCenter,
        blogAlignLeft,
        blogAlignRight,
        blogBold,
        blogBulletList,
        blogBulletNumbered,
        blogCloudUpload,
        blogEdit,
        blogFillColor,
        blogFormatColor,
        blogHeader,
        blogImage,
        blogItalic,
        blogLink,
        blogStrikethrough,
        blogSubscript,
        blogSuperscript,
        blogTag,
        blogUnderline,
        cuate,
        emailPrefixIcon,
        passwordPrefixIcon
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  final Size? size;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = true;

  final String _assetName;

  final Size? size;
  final bool _isVecFormat;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture(
      _isVecFormat
          ? AssetBytesLoader(_assetName,
              assetBundle: bundle, packageName: package)
          : SvgAssetLoader(_assetName,
              assetBundle: bundle, packageName: package),
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
