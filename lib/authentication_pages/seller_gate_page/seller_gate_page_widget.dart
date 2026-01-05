import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'seller_gate_page_model.dart';
export 'seller_gate_page_model.dart';

class SellerGatePageWidget extends StatefulWidget {
  const SellerGatePageWidget({super.key});

  static String routeName = 'Seller_Gate_Page';
  static String routePath = '/sellerGatePage';

  @override
  State<SellerGatePageWidget> createState() => _SellerGatePageWidgetState();
}

class _SellerGatePageWidgetState extends State<SellerGatePageWidget>
    with TickerProviderStateMixin {
  late SellerGatePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SellerGatePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (currentUserUid == '') {
        context.goNamed(SellerLoginWidget.routeName);
      } else {
        _model.sellerStoreRecord = await queryStoresRecordOnce(
          queryBuilder: (storesRecord) => storesRecord.where(
            'owner_uid',
            isEqualTo: currentUserUid,
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        if (_model.sellerStoreRecord?.reference != null) {
          context.goNamed(SellerDashboardWidget.routeName);
        } else {
          context.goNamed(ShopRegistrationWidget.routeName);
        }
      }
    });

    animationsMap.addAll({
      'iconOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: PopScope(
        canPop: false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 60.0),
                  child: Icon(
                    Icons.storefront,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 60.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                  child: Icon(
                    Icons.refresh,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 40.0,
                  ).animateOnPageLoad(
                      animationsMap['iconOnPageLoadAnimation']!),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 64.0),
                          child: Text(
                            'Verifying Store Access...',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.2,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
