// import 'package:flutter/material.dart';
// import 'package:sama/models/subsciption_model/subscription.dart';
// import 'package:sama/utils/size_helpers.dart';

// class CustomTextFormField extends StatefulWidget {
//   final  formName, labelText, readRight, selectOption,
//       field;
//       final Subscription subsc;
//   const CustomTextFormField({super.key, required this.formName, required this.labelText, required this.readRight, required this.selectOption, required this.field, required this.subsc});

//   @override
//   State<CustomTextFormField> createState() => _CustomTextFormFieldState();
// }

// class _CustomTextFormFieldState extends State<CustomTextFormField> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.fromLTRB(
//         displayWidth(context) * 0.02,
//         displayHeight(context) * 0,
//         displayWidth(context) * 0.02,
//         displayHeight(context) * 0.02,
//       ),
//       child: TextFormField(
//         onChanged: (value) {
//           widget.labelText == "Numéro de la carte"
//               ? setState(() {
//                   widget.subsc.cardNumber = value;
//                   print(cardNumber.text);
//                 })
//               : null;
//         },
//         keyboardType:
//             widget.formName == 'le numéro' ? TextInputType.number : TextInputType.text,
//         style: const TextStyle(
//             color: Color.fromARGB(255, 5, 38, 105),
//             fontWeight: FontWeight.bold),
//         controller: widget.field,
//         onTap: widget.selectOption,
//         readOnly: widget.readRight,
//         decoration: InputDecoration(
//           errorText: _submitted == false ? null : _errorText(widget.field, widget.formName),
//           suffixIcon: widget.labelText == 'Numéro de la carte'
//               ? null
//               : Icon(
//                   Icons.arrow_drop_down,
//                   color: Colors.red,
//                 ),
//           filled: true,
//           contentPadding: EdgeInsets.symmetric(
//             vertical: 0.0,
//             horizontal: displayWidth(context) * 0.02,
//           ),
//           hintText: widget.labelText.toString(),
//           fillColor: const Color.fromARGB(255, 230, 238, 245),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.0),
//             borderSide: const BorderSide(
//               style: BorderStyle.none,
//             ),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.0),
//             borderSide: const BorderSide(
//               style: BorderStyle.none,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//     Widget customTextFormField(formName, labelText, readRight, selectOption,
//       field, BuildContext context) {
//     return 
//   }
// }