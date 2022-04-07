import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truckdelivery/controller/auth_controller.dart';
import 'package:truckdelivery/helper/material_dialog_content.dart';
import 'package:truckdelivery/helper/material_dialog_helper.dart';
import 'package:truckdelivery/helper/snackbar_helper.dart';
import 'package:truckdelivery/model/snackbar_message.dart';

class NewPasswordPage extends StatefulWidget {
  @override
  _NewPasswordPageState createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  final MaterialDialogHelper _dialogHelper = MaterialDialogHelper.instance();

  AuthController _ = Get.put(AuthController());

  void _passwordChanged() async {
    _dialogHelper
      ..injectContext(context)
      ..showProgressDialog('تغيير كلمة المرور....');
    final message = await _.changePassword(oldPasword.text, newPasword.text);
    _dialogHelper.dismissProgress();
    if (message == null) {
      _dialogHelper.showMaterialDialogWithContent(MaterialDialogContent.networkError(), () => _passwordChanged());
      return;
    }
    final snackbarHelper = SnackbarHelper.instance..injectContext(context);
    if (message.isNotEmpty) {
      snackbarHelper.showSnackbar(snackbar: SnackbarMessage.error(message: message));
      return;
    }
    snackbarHelper.showSnackbar(snackbar: SnackbarMessage.success(message: 'تم تغيير كلمة المرور بنجاح'));
  }

  TextEditingController oldPasword = TextEditingController();
  TextEditingController newPasword = TextEditingController();
  TextEditingController confirmPasword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final snackbarHelper = SnackbarHelper.instance..injectContext(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff99DEF8),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(top: 70, right: 10, left: 10, bottom: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white.withOpacity(0.5)),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(0.5),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Image.asset('assets/backButton.png')),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  'كلمة المرور',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff28476E),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'تغير كلمة المرور',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff28476E),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'دخل كلمة المرور القديمة وكلمة المرور',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff28476E),
                                ),
                              ),
                              Text(
                                'لجديدة وتاكيد كلمة المرو',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff28476E),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Card(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: TextFormField(
                                        controller: oldPasword,
                                        textAlign: TextAlign.right,
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.remove_red_eye_outlined,
                                              color: Color(0xff28476E),
                                            ),
                                            border: InputBorder.none,
                                            hintText: 'كلمة المرور القديمة',
                                            hintStyle: TextStyle(color: Color(0xff28476E), fontSize: 13)))),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Card(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: TextFormField(
                                        textAlign: TextAlign.right,
                                        controller: newPasword,
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.visibility_off_outlined,
                                              color: Color(0xff28476E),
                                            ),
                                            border: InputBorder.none,
                                            hintText: 'كلمة المرور الجديدة',
                                            hintStyle: TextStyle(color: Color(0xff28476E), fontSize: 13)))),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Card(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: TextFormField(
                                    controller: confirmPasword,
                                    textAlign: TextAlign.right,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'تأكيد كلمة المرور',
                                      hintStyle: TextStyle(color: Color(0xff28476E), fontSize: 13),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 200,
                              ),
                              InkWell(
                                onTap: () {
                                  if (oldPasword.text.length < 8 ||newPasword.text.length < 8 ) {
                                    snackbarHelper.showSnackbar(
                                        snackbar: SnackbarMessage.error(message: 'مزيج كلمة المرور 8 أحرف'));
                                    return;
                                  } else if (oldPasword.text.isEmpty||newPasword.text.isEmpty||confirmPasword.text.isEmpty) {
                                    snackbarHelper.showSnackbar(
                                        snackbar: SnackbarMessage.error(message: 'حقل كلمة المرور مطلوب'));
                                    return;
                                  }
                                  else if(newPasword.text!=confirmPasword.text){
                                    snackbarHelper.showSnackbar(
                                        snackbar: SnackbarMessage.error(message: 'كلمة السر ليست جيدة'));
                                    return;
                                  }
                                  _passwordChanged();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Card(
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    )),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),
                                      decoration: BoxDecoration(
                                          color: Color(0xff99DEF8),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          )),
                                      child: Center(
                                        child: Text('تحديث',
                                            style: TextStyle(
                                              color: Color(0xff28476E),
                                              fontSize: 18,
                                            )),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              color: Colors.white,
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 40,
              child: Center(
                child: Image.asset('assets/logo.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
