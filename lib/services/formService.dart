
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveBills({
    String name, Timestamp date, String street ,int postalCode, String province,
    String observations, int overflowing, int skimmer, int size, int stairs,
    int preInstalation, int colors, int coverPVC, int coverPolicarbonate
  })async {
    try{
      CollectionReference forms = _firestore.collection('forms');
      forms.add({
        'name' : name,
        'date' : date,
        'street' : street,
        'postalCode' : postalCode,
        'province' : province,
        'overflowing' : overflowing,
        'skimmer' : skimmer,
        'size' : size,
        'stairs' : stairs,
        'preInstalation' : preInstalation,
        'colors' : colors,
        'coverPVC' : coverPVC,
        'coverPolicarbonate' : coverPolicarbonate,
        'observations' : observations,
      });
    }catch(e){
      e.toString();
    }
  }
}