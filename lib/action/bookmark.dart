part of use_widgets;

class Bookmark extends HookWidget {
  final bool marked;
  final Color? color;
  final Duration duration;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Alignment? alignment;

  const Bookmark({
    required this.marked,
    this.color,
    this.duration = const Duration(milliseconds: 1000),
    this.width,
    this.height,
    this.fit,
    this.alignment,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
        duration: duration, initialValue: marked ? 1 : 0);

    useEffect(() {
      if (marked) {
        controller.forward();
      } else {
        controller.reverse();
      }

      return null;
    }, [marked]);

    final lottie = Lottie.asset(
      'assets/bookmark.json',
      controller: controller,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      key: key,
    );

    if (color != null) {
      return ColorFiltered(
        colorFilter: ColorFilter.mode(color!, BlendMode.srcATop),
        child: lottie,
      );
    }

    return lottie;
  }
}
