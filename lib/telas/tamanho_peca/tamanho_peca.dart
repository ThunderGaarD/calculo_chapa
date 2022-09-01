// import 'package:flutter/material.dart';

// class TamanhoPeca extends StatefulWidget {
//   const TamanhoPeca({Key? key}) : super(key: key);

//   @override
//   State<TamanhoPeca> createState() => _TamanhoPecaState();
// }

// class _TamanhoPecaState extends State<TamanhoPeca> {
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: ((context, constraints) {
//         child:
//         Column(
//           children: [
//             Row(
//               children: [
//                 Container(
//                   width: constraints.maxWidth * .5,
//                   child: Center(
//                     child: Text(
//                       "Por quantidade:",
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: constraints.maxWidth * .5,
//                   child: TextFormField(
//                     keyboardType: TextInputType.number,
//                     controller: null,
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 Container(
//                   width: constraints.maxWidth * .5,
//                   child: Center(
//                     child: Text(
//                       r"Adicional: R$",
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: constraints.maxWidth * .5,
//                   child: TextFormField(
//                     keyboardType: TextInputType.number,
//                     controller: null,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             ElevatedButton(
//               onPressed: null,
//               child: Text('Calcular o total'),
//             ),
//           ],
//         );
//       }),
//     );
//   }
// }
