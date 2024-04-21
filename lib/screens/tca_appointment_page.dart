import 'package:flutter/material.dart';
import 'package:kmrapp/screens/tca_appointment_review.dart';
import 'package:table_calendar/table_calendar.dart';

class TCAAppointmentPage extends StatefulWidget {
  const TCAAppointmentPage({Key? key}) : super(key: key);

  @override
  _TCAAppointmentPageState createState() => _TCAAppointmentPageState();
}

class _TCAAppointmentPageState extends State<TCAAppointmentPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  String? _selectedTimeSlot;

  // Dummy time slots for the sake of example.
  final List<String> _timeSlots = [
    '1:00 pm - 2:00 pm',
    '2:00 pm - 3:00 pm',
    '3:00 pm - 4:00 pm',
    '4:00 pm - 5:00 pm',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        titleSpacing: 0,
        centerTitle: true,
        title: _buildAppBarTitle(),
      ),
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 20)
      ,child: Column(
        children: [
          Text("Schedule your appointment with", style: TextStyle(fontSize: 20),),
          Text("Dr. Hannah Ng", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          
                              SizedBox(
                                height: 30,
                              ),
        _buildTableCalendar(),
        _buildTimeSlots(),
        SizedBox(height: 100),
              _buildBookAppointmentButton(),
        ],
      ),)
    );
  }

  Widget _buildAppBarTitle() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 40),
      width: double.infinity,
      height: 80,
      decoration: const BoxDecoration(
        color: Color(0xffDFCEFA),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 24,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 24.0,
                  color: Color.fromARGB(255, 150, 111, 214),
                ),
              ),
            ),
            const Text(
              'TCA / BSSK',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff966FD6),
              ),
            ),
            const SizedBox(width: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildTableCalendar() {
    return Column(
      children: [
        TableCalendar(
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: _focusedDay,
      calendarFormat: _calendarFormat,
      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
      onPageChanged: (focusedDay) => setState(() => _focusedDay = focusedDay),
      headerStyle: HeaderStyle(
  formatButtonVisible: false,
  titleCentered: true,
  leftChevronVisible: true,
  rightChevronVisible: true,
  headerMargin: EdgeInsets.only(bottom: 20), // Creates a gap between the header title and the calendar grid
  leftChevronPadding: EdgeInsets.only(left: 16), // Adds padding to the left chevron
  rightChevronPadding: EdgeInsets.only(right: 16), // Adds padding to the right chevron
  titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  decoration: BoxDecoration(
    color: Colors.grey[200],
    borderRadius: BorderRadius.circular(20.0),
  ),
),
      calendarStyle: CalendarStyle(
        selectedDecoration: BoxDecoration(
          color: Colors.deepPurple,
          shape: BoxShape.circle,
        ),
        todayDecoration: BoxDecoration(
          color: Colors.deepPurple.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
      ),
    ),
      ],
    );
  }

Widget _buildTimeSlots() {
  return LayoutBuilder(
    builder: (context, constraints) {
      // Calculate the width of the buttons based on the screen width and desired padding
      double buttonWidth = (constraints.maxWidth - 10) / 2; // Subtracting the spacing between the buttons

      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: buttonWidth / 48, // Adjust based on your button's height
        ),
        itemCount: _timeSlots.length,
        itemBuilder: (context, index) {
          bool isSelected = _selectedTimeSlot == _timeSlots[index];
          return ElevatedButton(
            onPressed: () {
              setState(() {
                _selectedTimeSlot = _timeSlots[index];
              });
            },
            child: Text(
              _timeSlots[index],
              style: TextStyle(
                fontSize: 16, // This is your font size
              ),
            ),
            style: ElevatedButton.styleFrom(
              foregroundColor: isSelected ? Colors.white : Colors.black, backgroundColor: isSelected ? Colors.deepPurple : Colors.grey[300],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              padding: EdgeInsets.symmetric(vertical: 15),
            ),
          );
        },
        padding: EdgeInsets.zero, // No additional padding
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
      );
    },
  );
}





  Widget _buildBookAppointmentButton() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    width: double.infinity, // Ensure the button takes the full width available
    child: ElevatedButton(
       onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TCAAppointmentReview()),
                                        );
                                      },
      child: const Text('Book Appointment', style: TextStyle(fontSize: 17),),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.deepPurple,
        padding: const EdgeInsets.symmetric(vertical: 35.0,), // Add more vertical padding for height
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0), // Match the border radius as per design
        ),
      ),
    ),
  );
}


}
