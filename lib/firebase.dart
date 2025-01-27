
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool>signIn(String email ,String password )async{
  try{
    await FirebaseAuth.instance.
    signInWithEmailAndPassword(email: email, password: password);
    return true;
  }catch(e){
    print(e);
    return false;
  }
}


Future<bool>register(String email ,String password )async{
  try{
    await FirebaseAuth.instance.
    createUserWithEmailAndPassword(email: email, password: password);
    return true;
  } on FirebaseAuthException catch (e){
    if(e.code == 'weak-password'){
      Fluttertoast.showToast(msg: 'This password provided is too weak',
          toastLength: Toast.LENGTH_LONG);
    }
    else if(e.code=='email-already-in-use'){
      Fluttertoast.showToast(msg: 'The account already exits for that email.',
          toastLength: Toast.LENGTH_LONG);
    }
    return false;
  } catch(e){
    print(e.toString());
    return false;
  }
}
