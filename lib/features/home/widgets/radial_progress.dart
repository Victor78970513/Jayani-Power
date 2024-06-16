import 'dart:math';
import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorSecundario;
  final double grosorPrimario;
  const RadialProgress({
    super.key,
    required this.porcentaje,
    this.colorPrimario = Colors.blue,
    this.colorSecundario = Colors.grey,
    this.grosorSecundario = 4,
    this.grosorPrimario = 10,
  });

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: widget.porcentaje),
        duration: const Duration(milliseconds: 500),
        builder: (context, value, child) {
          return CustomPaint(
            painter: _MiRadialProgress(
              value,
              widget.colorPrimario,
              widget.colorSecundario,
              widget.grosorSecundario,
              widget.grosorPrimario,
            ),
            child: Center(
              child: Text(
                widget.porcentaje.toInt() <= 100
                    ? '${widget.porcentaje.toInt()}%'
                    : "100%",
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// class _MiRadialProgress extends CustomPainter {
//   final double porcentaje;
//   final Color colorPrimario;
//   final Color colorSecundario;
//   final double grosorSecundario;
//   final double grosorPrimario;

//   _MiRadialProgress(
//     this.porcentaje,
//     this.colorPrimario,
//     this.colorSecundario,
//     this.grosorSecundario,
//     this.grosorPrimario,
//   );

//   @override
//   void paint(Canvas canvas, Size size) {
//     final Offset center = Offset(size.width * 0.5, size.height * 0.5);
//     final double radio = min(size.width * 0.5, size.height * 0.5);

//     final double lineLength = grosorPrimario + 5; // Length of each line
//     const double gapSize = 2 * pi / 100; // Gap between lines

//     // Draw only the foreground lines up to the percentage
//     final Paint paintLineForeground = Paint()
//       ..strokeWidth = 3
//       ..color = colorPrimario
//       ..style = PaintingStyle.stroke;

//     for (int i = 0; i < porcentaje; i++) {
//       final double startAngle = -pi / 2 + i * gapSize;
//       final double x1 = center.dx + (radio - lineLength) * cos(startAngle);
//       final double y1 = center.dy + (radio - lineLength) * sin(startAngle);
//       final double x2 = center.dx + radio * cos(startAngle);
//       final double y2 = center.dy + radio * sin(startAngle);
//       canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paintLineForeground);
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }

//? 3

// import 'dart:math';
// import 'package:flutter/material.dart';

// class RadialProgress extends StatefulWidget {
//   final double porcentaje;
//   final Color colorPrimario;
//   final Color colorSecundario;
//   final double grosorSecundario;
//   final double grosorPrimario;
//   const RadialProgress({
//     super.key,
//     required this.porcentaje,
//     this.colorPrimario = Colors.blue,
//     this.colorSecundario = Colors.grey,
//     this.grosorSecundario = 4,
//     this.grosorPrimario = 10,
//   });

//   @override
//   State<RadialProgress> createState() => _RadialProgressState();
// }

// class _RadialProgressState extends State<RadialProgress>
//     with SingleTickerProviderStateMixin {
//   late AnimationController controller;
//   late double porcentajeAnterior;

//   @override
//   void initState() {
//     porcentajeAnterior = widget.porcentaje;

//     controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 200),
//     );

//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     controller.forward(from: 0.0);

//     final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
//     porcentajeAnterior = widget.porcentaje;

//     return AnimatedBuilder(
//       animation: controller,
//       builder: (BuildContext context, Widget? child) {
//         return Container(
//           padding: const EdgeInsets.all(10),
//           width: double.infinity,
//           height: double.infinity,
//           child: CustomPaint(
//             painter: _MiRadialProgress(
//               (widget.porcentaje - diferenciaAnimar) +
//                   (diferenciaAnimar * controller.value),
//               widget.colorPrimario,
//               widget.colorSecundario,
//               widget.grosorSecundario,
//               widget.grosorPrimario,
//             ),
//             child: Center(
//               child: Text(
//                 '${widget.porcentaje.toInt()}°C',
//                 style: const TextStyle(
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class _MiRadialProgress extends CustomPainter {
//   final double porcentaje;
//   final Color colorPrimario;
//   final Color colorSecundario;
//   final double grosorSecundario;
//   final double grosorPrimario;

//   _MiRadialProgress(
//     this.porcentaje,
//     this.colorPrimario,
//     this.colorSecundario,
//     this.grosorSecundario,
//     this.grosorPrimario,
//   );

//   @override
//   void paint(Canvas canvas, Size size) {
//     final Offset center = Offset(size.width, size.height);
//     final double radio = min(size.width, size.height);

//     final double lineLength = grosorPrimario; // Length of each line
//     const double gapSize = 2 * pi / 100; // Gap between lines

//     // Draw only the foreground lines up to the percentage
//     final Paint paintLineForeground = Paint()
//       ..strokeWidth = 2
//       ..color = colorPrimario
//       ..style = PaintingStyle.stroke;

//     for (int i = 0; i < porcentaje; i++) {
//       final double startAngle = -pi / 2 + i * gapSize;
//       final double x1 = center.dx + (radio - lineLength) * cos(startAngle);
//       final double y1 = center.dy + (radio - lineLength) * sin(startAngle);
//       final double x2 = center.dx + radio * cos(startAngle);
//       final double y2 = center.dy + radio * sin(startAngle);
//       canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paintLineForeground);
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }

//? 2

// import 'dart:math';
// import 'package:flutter/material.dart';

// class RadialProgress extends StatefulWidget {
//   final double porcentaje;
//   final Color colorPrimario;
//   final Color colorSecundario;
//   final double grosorSecundario;
//   final double grosorPrimario;
//   const RadialProgress({
//     super.key,
//     required this.porcentaje,
//     this.colorPrimario = Colors.blue,
//     this.colorSecundario = Colors.grey,
//     this.grosorSecundario = 4,
//     this.grosorPrimario = 10,
//   });

//   @override
//   State<RadialProgress> createState() => _RadialProgressState();
// }

// class _RadialProgressState extends State<RadialProgress>
//     with SingleTickerProviderStateMixin {
//   late AnimationController controller;
//   late double porcentajeAnterior;

//   @override
//   void initState() {
//     porcentajeAnterior = widget.porcentaje;

//     controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 200),
//     );

//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     controller.forward(from: 0.0);

//     final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
//     porcentajeAnterior = widget.porcentaje;

//     return AnimatedBuilder(
//       animation: controller,
//       builder: (BuildContext context, Widget? child) {
//         return Container(
//           padding: const EdgeInsets.all(10),
//           width: double.infinity,
//           height: double.infinity,
//           child: CustomPaint(
//             painter: _MiRadialProgress(
//               (widget.porcentaje - diferenciaAnimar) +
//                   (diferenciaAnimar * controller.value),
//               widget.colorPrimario,
//               widget.colorSecundario,
//               widget.grosorSecundario,
//               widget.grosorPrimario,
//             ),
//             child: Center(
//               child: Text(
//                 '${widget.porcentaje.toInt()}°C',
//                 style: const TextStyle(
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class _MiRadialProgress extends CustomPainter {
//   final double porcentaje;
//   final Color colorPrimario;
//   final Color colorSecundario;
//   final double grosorSecundario;
//   final double grosorPrimario;

//   _MiRadialProgress(
//     this.porcentaje,
//     this.colorPrimario,
//     this.colorSecundario,
//     this.grosorSecundario,
//     this.grosorPrimario,
//   );

//   @override
//   void paint(Canvas canvas, Size size) {
//     final Offset center = Offset(size.width * 0.5, size.height * 0.5);
//     final double radio = min(size.width * 0.5, size.height * 0.5);

//     // Draw background circle with lines
//     final double lineLength = grosorPrimario; // Length of each line
//     final double gapSize = 2 * pi / 100; // Gap between lines
//     final Paint paintLine = Paint()
//       ..strokeWidth = 2
//       ..color = colorSecundario
//       ..style = PaintingStyle.stroke;

//     for (int i = 0; i < 100; i++) {
//       final double startAngle = -pi / 2 + i * gapSize;
//       final double x1 = center.dx + (radio - lineLength) * cos(startAngle);
//       final double y1 = center.dy + (radio - lineLength) * sin(startAngle);
//       final double x2 = center.dx + radio * cos(startAngle);
//       final double y2 = center.dy + radio * sin(startAngle);
//       canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paintLine);
//     }

//     // Draw foreground lines to indicate percentage
//     final Paint paintLineForeground = Paint()
//       ..strokeWidth = 2
//       ..color = colorPrimario
//       ..style = PaintingStyle.stroke;

//     for (int i = 0; i < porcentaje; i++) {
//       final double startAngle = -pi / 2 + i * gapSize;
//       final double x1 = center.dx + (radio - lineLength) * cos(startAngle);
//       final double y1 = center.dy + (radio - lineLength) * sin(startAngle);
//       final double x2 = center.dx + radio * cos(startAngle);
//       final double y2 = center.dy + radio * sin(startAngle);
//       canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paintLineForeground);
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }

//? 1

// import 'dart:math';

// import 'package:flutter/material.dart';

// class RadialProgress extends StatefulWidget {
//   final double porcentaje;
//   final Color colorPrimario;
//   final Color colorSecundario;
//   final double grosorSecundario;
//   final double grosorPrimario;
//   const RadialProgress({
//     super.key,
//     required this.porcentaje,
//     this.colorPrimario = Colors.blue,
//     this.colorSecundario = Colors.grey,
//     this.grosorSecundario = 4,
//     this.grosorPrimario = 10,
//   });

//   @override
//   State<RadialProgress> createState() => _RadialProgressState();
// }

// class _RadialProgressState extends State<RadialProgress>
//     with SingleTickerProviderStateMixin {
//   late AnimationController controller;
//   late double porcentajeAnterior;

//   @override
//   void initState() {
//     porcentajeAnterior = widget.porcentaje;

//     controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 200),
//     );

//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     controller.forward(from: 0.0);

//     final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
//     porcentajeAnterior = widget.porcentaje;

//     return AnimatedBuilder(
//       animation: controller,
//       // child: child,
//       builder: (BuildContext context, Widget? child) {
//         return Container(
//           padding: const EdgeInsets.all(10),
//           width: double.infinity,
//           height: double.infinity,
//           child: CustomPaint(
//             painter: _MiRadialProgress(
//               (widget.porcentaje - diferenciaAnimar) +
//                   (diferenciaAnimar * controller.value),
//               widget.colorPrimario,
//               widget.colorSecundario,
//               widget.grosorSecundario,
//               widget.grosorPrimario,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

class _MiRadialProgress extends CustomPainter {
  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorSecundario;
  final double grosorPrimario;

  _MiRadialProgress(
    this.porcentaje,
    this.colorPrimario,
    this.colorSecundario,
    this.grosorSecundario,
    this.grosorPrimario,
  );
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCircle(center: const Offset(0, 0), radius: 100);

    const Gradient gradiente = LinearGradient(
      colors: [
        Color(0xffC012FF),
        Color(0xff6D05E8),
        Color(0xffFF004D),
      ],
    );

    final Offset center = Offset(size.width * 0.5, size.height * 0.5);
    final double radio = min(size.width * 0.5, size.height * 0.5);

    // arco
    final lapizArco = Paint()
      ..strokeWidth = grosorPrimario
      ..shader = gradiente.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Parte que se debera ir llenando
    double arcAngle = 2 * pi * (porcentaje / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio),
      -pi / 2,
      arcAngle,
      false,
      lapizArco,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
