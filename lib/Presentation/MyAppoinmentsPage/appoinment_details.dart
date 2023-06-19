import 'package:flutter/material.dart';
import 'package:medicare/Core/colorScheme.dart';
import 'package:medicare/Core/storage.dart';
import 'package:medicare/Presentation/MyAppoinmentsPage/submittedAppointments.dart';
import 'package:medicare/booking_form_textfield.widget.dart';

class AppointmentPage extends StatefulWidget {

  final String docName, date, month, slot, time;
  const AppointmentPage({Key? key, required this.docName, required this.slot, required this.month, required this.date, required this.time}) : super(key: key);

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {


  final TextEditingController NameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  bool itemVisibility = false;
  late int token;

  @override
  void dispose() {
    super.dispose();
    NameController.dispose();
    emailController.dispose();
    addressController.dispose();
    phoneController.dispose();
    detailsController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Appointment",
          style: TextStyle(
              fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: MediaQuery
                .of(context)
                .size
                .height,
            child: CustomPaint(
              painter: pathPainter(),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                margin: EdgeInsets.only(left: 5.0, right: 5.0),
                child: Column(
                  children: [
                    if(itemVisibility == false)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                        child: Text("Available Tokens",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    if(itemVisibility == false)
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 9,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              itemVisibility = true;
                              token = index+1;
                            });
                          },
                          child: Card(
                            child: Center(
                              child: Text("${index+1}", style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              )),
                            ),
                          ),
                        );
                      },
                    ),
                    if(itemVisibility == true)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                        child: Text("Name",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                    ),
                    if(itemVisibility == true)
                    BookingFormTextFields(
                      hint: "Name",
                      maxLines: 1,
                      controller: NameController,
                    ),
                    if(itemVisibility == true)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                        child: Text("Email",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                    ),
                    if(itemVisibility == true)
                    BookingFormTextFields(
                      hint: "Email",
                      controller: emailController,
                    ),
                    if(itemVisibility == true)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                        child: Text("Address",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                    ),
                    if(itemVisibility == true)
                    BookingFormTextFields(
                      hint: "Address",
                      controller: addressController,
                    ),
                    if(itemVisibility == true)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                        child: Text("Phone",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                    ),
                    if(itemVisibility == true)
                    BookingFormTextFields(
                      hint: "Phone",
                      maxLines: 1,
                      keyboardType: TextInputType.number,
                      controller: phoneController,
                    ),
                    if(itemVisibility == true)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                        child: Text("Details",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                    ),
                    if(itemVisibility == true)
                    BookingFormTextFields(
                      hint: "Details",
                      maxLines: 1,
                      controller: detailsController,
                    ),
                    if(itemVisibility == true)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 20.0, top: 10.0),
                          child: Text("Selected token : $token",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
          height: kBottomNavigationBarHeight - 5,
          child: MaterialButton(
            onPressed: () async {
                if (NameController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.red,
                      content: Text("Please enter name."),
                    ),
                  );
                } if (emailController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.red,
                      content: Text("Please enter email."),
                    ),
                  );
                } else if (addressController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.red,
                      content: Text("Please enter address."),
                    ),
                  );
                } else if (phoneController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.red,
                      content: Text("Please enter phone."),
                    ),
                  );
                } else if (detailsController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.red,
                      content: Text("Please enter details."),
                    ),
                  );
                } else {

                  LocalStorage localStorage = LocalStorage();
                  await localStorage.setDoctorName(widget.docName);
                  await localStorage.setDate("${widget.month+" "+widget.date+" "+widget.time+" "+widget.slot}");
                  await localStorage.setName(NameController.text);
                  await localStorage.setEmail(emailController.text);
                  await localStorage.setAddress(addressController.text);
                  await localStorage.setPhone(phoneController.text);
                  await localStorage.setDetails(detailsController.text);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  SubmittedAppointments(docName: widget.docName,
                      slot: widget.slot,
                      month: widget.month,
                      date: widget.date,
                      time: widget.time,
                      name: NameController.text,
                      email: emailController.text,
                      address: addressController.text,
                      phone: phoneController.text,
                      details: detailsController.text,
                    ),
                    ),
                  );
                }
            },
            color: Colors.black,
            child: Text(
              "Add",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2),
            ),
          ),
        ),
    );
  }
}

class pathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = path2Color;
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.3, 0);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.03,
        size.width * 0.42, size.height * 0.17);
    path.quadraticBezierTo(
        size.width * 0.35, size.height * 0.32, 0, size.height * 0.29);
    path.close();
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
