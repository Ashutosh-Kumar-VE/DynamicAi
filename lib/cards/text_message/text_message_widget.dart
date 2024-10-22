import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'text_message_model.dart';
export 'text_message_model.dart';

class TextMessageWidget extends StatefulWidget {
  const TextMessageWidget({
    super.key,
    required this.sender,
    required this.text,
    required this.time,
    bool? isUser,
    required this.image,
  }) : isUser = isUser ?? false;

  final String? sender;
  final String? text;
  final DateTime? time;
  final bool isUser;
  final String? image;

  @override
  State<TextMessageWidget> createState() => _TextMessageWidgetState();
}

class _TextMessageWidgetState extends State<TextMessageWidget>
    with TickerProviderStateMixin {
  late TextMessageModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextMessageModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOutQuint,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            color: FlutterFlowTheme.of(context).accent1,
            angle: 0.524,
          ),
        ],
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
    return Align(
      alignment: AlignmentDirectional(
          valueOrDefault<double>(
            widget.isUser ? 1.0 : -1.0,
            -1.0,
          ),
          -1.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!valueOrDefault<bool>(
            widget.isUser,
            true,
          ))
            Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                shape: BoxShape.circle,
              ),
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    width: 120.0,
                    height: 120.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: CachedNetworkImage(
                      fadeInDuration: const Duration(milliseconds: 100),
                      fadeOutDuration: const Duration(milliseconds: 100),
                      imageUrl: widget.image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          Expanded(
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 400.0,
              ),
              decoration: const BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: AlignmentDirectional(
                        valueOrDefault<double>(
                          widget.isUser ? 1.0 : -1.0,
                          -1.0,
                        ),
                        -1.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget.sender,
                        'Loading sender',
                      ),
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).info,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1.0, -1.0),
                    child: Builder(
                      builder: (context) {
                        if (valueOrDefault<bool>(
                          (widget.text != null && widget.text != '') &&
                              (widget.text != 'null'),
                          false,
                        )) {
                          return Align(
                            alignment: AlignmentDirectional(
                                valueOrDefault<double>(
                                  widget.isUser ? 1.0 : -1.0,
                                  -1.0,
                                ),
                                0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Container(
                                constraints: const BoxConstraints(
                                  maxWidth: 400.0,
                                ),
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    widget.isUser
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        decoration: const BoxDecoration(),
                                        child: Builder(
                                          builder: (context) {
                                            if (widget.isUser) {
                                              return Text(
                                                widget.text!,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      letterSpacing: 0.0,
                                                    ),
                                              );
                                            } else {
                                              return MarkdownBody(
                                                data: widget.text!,
                                                selectable: true,
                                                onTapLink: (_, url, __) =>
                                                    launchURL(url!),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Align(
                            alignment: AlignmentDirectional(
                                valueOrDefault<double>(
                                  widget.isUser ? 1.0 : -1.0,
                                  -1.0,
                                ),
                                0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Container(
                                width: double.infinity,
                                height: 45.0,
                                constraints: const BoxConstraints(
                                  maxWidth: 400.0,
                                ),
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    widget.isUser
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ).animateOnPageLoad(
                                animationsMap['containerOnPageLoadAnimation']!),
                          );
                        }
                      },
                    ),
                  ),
                ].divide(const SizedBox(height: 5.0)),
              ),
            ),
          ),
          if (valueOrDefault<bool>(
            widget.isUser,
            false,
          ))
            Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                shape: BoxShape.circle,
              ),
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    width: 120.0,
                    height: 120.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: CachedNetworkImage(
                      fadeInDuration: const Duration(milliseconds: 100),
                      fadeOutDuration: const Duration(milliseconds: 100),
                      imageUrl: valueOrDefault<String>(
                        widget.image,
                        'https://firebasestorage.googleapis.com/v0/b/g-p-t-4o-gwizk5.appspot.com/o/Screenshot%202024-09-20%20at%201.53.48%E2%80%AFPM.png?alt=media&token=0db1da2e-7e31-48a5-8d92-e78582a0f79d',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
        ].divide(const SizedBox(width: 5.0)),
      ),
    );
  }
}
