import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/navigation/chat_thread_tile/chat_thread_tile_widget.dart';
import 'package:flutter/material.dart';
import 'drawer_model.dart';
export 'drawer_model.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  late DrawerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DrawerModel());

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
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1.0, -1.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/FlutterFlow_Logo_-_Light.png',
                      width: 100.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Text(
                  'AI',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).secondary,
                        letterSpacing: 0.0,
                      ),
                ),
              ].divide(const SizedBox(width: 4.0)),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.chatThreadTileModel1,
                        updateCallback: () => safeSetState(() {}),
                        child: ChatThreadTileWidget(
                          label: 'now',
                          title: 'German Expat Advice',
                          excerpt:
                              'Navigating life as an expat in Germany can be both challenging and rewarding',
                          active: true,
                          tapAction: () async {},
                        ),
                      ),
                      wrapWithModel(
                        model: _model.chatThreadTileModel2,
                        updateCallback: () => safeSetState(() {}),
                        child: ChatThreadTileWidget(
                          label: '5 minutes ago',
                          title: 'How to Prep for a Talk',
                          excerpt:
                              'Follow these tips to help prepare to give a talk on AI',
                          active: false,
                          tapAction: () async {},
                        ),
                      ),
                      wrapWithModel(
                        model: _model.chatThreadTileModel3,
                        updateCallback: () => safeSetState(() {}),
                        child: ChatThreadTileWidget(
                          label: '2 days ago',
                          title: 'Airbnb Review Advice',
                          excerpt:
                              'Writing an honest and accurate review can sometimes be challenging,',
                          active: false,
                          tapAction: () async {},
                        ),
                      ),
                    ].divide(const SizedBox(height: 20.0)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
