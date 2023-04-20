part of "../sd_utility.dart";

class SDRichText extends StatelessWidget {
  final List<SDTextSpan> text;
  final TextAlign textAlign;
  final TextDirection? textDirection;
  final bool softWrap;
  final TextOverflow overflow;
  final double textScaleFactor;
  final int? maxLines;
  final Locale? locale;
  final StrutStyle? strutStyle;
  final TextWidthBasis textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final SelectionRegistrar? selectionRegistrar;
  final Color? selectionColor;

  const SDRichText({
    required this.text,
    this.textAlign = TextAlign.start,
    this.textDirection,
    this.softWrap = true,
    this.overflow = TextOverflow.clip,
    this.textScaleFactor = 1.0,
    this.maxLines,
    this.locale,
    this.strutStyle,
    this.textWidthBasis = TextWidthBasis.parent,
    this.textHeightBehavior,
    this.selectionRegistrar,
    this.selectionColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: generate(text),
      textAlign: textAlign,
      textDirection: textDirection,
      softWrap: softWrap,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      locale: locale,
      strutStyle: strutStyle,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      selectionRegistrar: selectionRegistrar,
      selectionColor: selectionColor,
    );
  }

  InlineSpan generate(List<SDTextSpan> text) {
    if (text.isEmpty) {
      return const TextSpan(text: "");
    }

    if (text.length == 1) {
      final txt = text[0];
      return getSpan(txt);
    }
    return TextSpan(text: "", children: [...text.map((e) => getSpan(e)).toList()]);
  }

  InlineSpan getSpan(SDTextSpan sp) {
    return WidgetSpan(
        child: MouseRegion(
      cursor: sp.mouseCursor ?? MouseCursor.defer,
      child: GestureDetector(
          onTap: sp.onTap,
          onDoubleTap: sp.onDoubleTap,
          onLongPress: sp.onLongPress,
          child: SDText(
            sp.text,
            inherit: sp.inherit,
            color: sp.color,
            backgroundColor: sp.backgroundColor,
            fontSize: sp.fontSize,
            fontWeight: sp.fontWeight,
            fontStyle: sp.fontStyle,
            letterSpacing: sp.letterSpacing,
            wordSpacing: sp.wordSpacing,
            textBaseline: sp.textBaseline,
            height: sp.height,
            leadingDistribution: sp.leadingDistribution,
            foreground: sp.foreground,
            background: sp.background,
            shadows: sp.shadows,
            fontFeatures: sp.fontFeatures,
            fontVariations: sp.fontVariations,
            decoration: sp.decoration,
            decorationColor: sp.decorationColor,
            decorationStyle: sp.decorationStyle,
            decorationThickness: sp.decorationThickness,
            debugLabel: sp.debugLabel,
            fontFamily: sp.fontFamily,
            fontFamilyFallback: sp.fontFamilyFallback,
            package: sp.package,
            locale: sp.locale,
            semanticsLabel: sp.semanticsLabel,
          )),
    ));
  }
}
