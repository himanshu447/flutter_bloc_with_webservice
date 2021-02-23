import 'package:flutter/material.dart';
import 'package:flutter_bloc_practice/features/get/login/presentation/controller/login_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateUserView extends GetView<LoginController> {
	
	final _formKey = GlobalKey<FormState>();
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: Colors.white,
			appBar: AppBar(
				title: Text(
					'GetX Create User',
				),
			),
			body: Stack(
				children: [
					Container(
						padding: EdgeInsets.all(16),
						child: Form(
							key: _formKey,
							child: Column(
								children: <Widget>[
									TextFormField(
										controller: controller.emailTextController,
										keyboardType: TextInputType.emailAddress,
										decoration: InputDecoration(
											fillColor: Colors.grey[200],
											filled: true,
											hintText: 'Email',
											hintStyle: GoogleFonts.exo2(
												fontSize: 16,
												color: Colors.grey,
												fontWeight: FontWeight.normal,
											),
											border: OutlineInputBorder(
												borderRadius: BorderRadius.circular(10),
												borderSide: BorderSide(
													color: Colors.transparent,
													width: 0,
												),
											),
											enabledBorder: OutlineInputBorder(
												borderRadius: BorderRadius.circular(10),
												borderSide: BorderSide(
													color: Colors.transparent,
													width: 0,
												),
											),
										),
										style: GoogleFonts.exo2(
											fontSize: 16,
											color: Colors.black,
											fontWeight: FontWeight.normal,
										),
										validator: (value) =>
										value.trim().isEmpty ? 'Email required' : null,
									),
									SizedBox(height: 16),
									TextFormField(
										controller: controller.passwordTextController,
										keyboardType: TextInputType.text,
										obscureText: true,
										decoration: InputDecoration(
											fillColor: Colors.grey[200],
											filled: true,
											hintText: 'Password',
											hintStyle: GoogleFonts.exo2(
												fontSize: 16,
												color: Colors.grey,
												fontWeight: FontWeight.normal,
											),
											border: OutlineInputBorder(
												borderRadius: BorderRadius.circular(10),
												borderSide: BorderSide(
													color: Colors.transparent,
													width: 0,
												),
											),
											enabledBorder: OutlineInputBorder(
												borderRadius: BorderRadius.circular(10),
												borderSide: BorderSide(
													color: Colors.transparent,
													width: 0,
												),
											),
										),
										validator: (value) =>
										value.trim().isEmpty ? 'Password required' : null,
										style: GoogleFonts.exo2(
											fontSize: 16,
											color: Colors.black,
											fontWeight: FontWeight.normal,
										),
									),
									SizedBox(height: 16),
									MaterialButton(
											color: Colors.deepOrangeAccent,
											splashColor: Colors.white,
											height: 45,
											minWidth: Get.width / 2,
											shape: RoundedRectangleBorder(
												borderRadius: BorderRadius.circular(10),
											),
											child: Text(
												'LOGIN',
												style: GoogleFonts.exo2(
													fontSize: 20,
													color: Colors.white,
													fontWeight: FontWeight.bold,
												),
											),
											onPressed: () {
												if (_formKey.currentState.validate()) {
													controller.apiLogin();
												}
											})
								],
							),
						),
					),
					Obx(() => Visibility(
						visible: controller.isDataLoading,
						child: Center(
							child: CircularProgressIndicator(),
						),
					),),
				
				],
			),
		);
	}
}
