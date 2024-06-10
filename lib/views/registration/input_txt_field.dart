import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class InputTxtField extends StatelessWidget {
   InputTxtField({super.key, this.keyboardType, this.txtController, this.iconName, this.hintText,this.callback});
final TextInputType? keyboardType;
final TextEditingController? txtController;
void Function(String)? callback;
  final IconData? iconName;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.txtFieldBGColor.withOpacity(0.08),
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextField(keyboardType: keyboardType,
                      controller: txtController,
                      onChanged: callback,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon:  Icon(iconName),
                        hintText: hintText,
                        hintStyle:  TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: "BeVietnam",
                            color: Colors.black.withOpacity(0.3)),
                      ),
                    ),
                  ),
                );
  }
}