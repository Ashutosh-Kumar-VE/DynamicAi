import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'image_card_model.dart';
export 'image_card_model.dart';

class ImageCardWidget extends StatefulWidget {
  const ImageCardWidget({
    super.key,
    required this.images,
  });

  final List<String>? images;

  @override
  State<ImageCardWidget> createState() => _ImageCardWidgetState();
}

class _ImageCardWidgetState extends State<ImageCardWidget>
    with TickerProviderStateMixin {
  late ImageCardModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageCardModel());

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: null,
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 300.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Builder(
        builder: (context) {
          if (widget.images!.length > 1) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Builder(
                builder: (context) {
                  final image = widget.images!.toList();

                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 1.0,
                    ),
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: image.length,
                    itemBuilder: (context, imageIndex) {
                      final imageItem = image[imageIndex];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: CachedNetworkImage(
                          fadeInDuration: const Duration(milliseconds: 100),
                          fadeOutDuration: const Duration(milliseconds: 100),
                          imageUrl: imageItem,
                          width: 80.0,
                          height: 80.0,
                          fit: BoxFit.cover,
                        ),
                      ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation']!,
                        effects: [
                          FadeEffect(
                            curve: Curves.easeInOutQuint,
                            delay: (imageIndex * 100).ms,
                            duration: 600.0.ms,
                            begin: 0.0,
                            end: 1.0,
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            );
          } else {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImage(
                      fadeInDuration: const Duration(milliseconds: 100),
                      fadeOutDuration: const Duration(milliseconds: 100),
                      imageUrl: widget.images!.first,
                      width: 200.0,
                      height: 300.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
