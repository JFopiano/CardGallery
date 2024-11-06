import '/flutter_flow/flutter_flow_util.dart';
import 'profile_bio_widget.dart' show ProfileBioWidget;
import 'package:flutter/material.dart';

class ProfileBioModel extends FlutterFlowModel<ProfileBioWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
