import 'package:chain_pi/Models/logo_request_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final CollectionReference logoRequestCollection =
    Firestore.instance.collection("LogoRequest");

class FirebaseServiceForLogoRequest {
  static final FirebaseServiceForLogoRequest _instance =
      FirebaseServiceForLogoRequest.internal();

  factory FirebaseServiceForLogoRequest() => _instance;

  FirebaseServiceForLogoRequest.internal();

  Future<LogoRequestModel> createLogoRequest(String logoName, String logoColor,
      String logoDescription, String logoDurationDay) async {
    final TransactionHandler createTransaction = (Transaction txt) async {
      final DocumentSnapshot documentSnapshot =
          await txt.get(logoRequestCollection.document());
      final LogoRequestModel logoRequestModel = LogoRequestModel(
          logoName, logoColor, logoDescription, logoDurationDay);
      final Map<String, dynamic> logoRequestData = logoRequestModel.toMap();
      await txt.set(documentSnapshot.reference, logoRequestData);
      return logoRequestData;
    };

        return Firestore.instance.runTransaction(createTransaction).then((mapdata){
        return LogoRequestModel.fromMap(mapdata);



      }).catchError((error){
        print('error: $error');

        return null;
      });

  }
}
