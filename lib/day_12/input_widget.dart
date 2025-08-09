import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputWidget extends StatefulWidget {
  const InputWidget({super.key});

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  bool isCheck = false;
  bool isCheckSwitch = false;
  String? dropdownSelect;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: isCheckSwitch == true ? Colors.black : Colors.white,
      child: Column(
        children: [
          Text(
            "CheckBox",
            style: TextStyle(
              color: isCheckSwitch == true ? Colors.white : Colors.black,
            ),
          ),
          Row(
            children: [
              Checkbox(
                activeColor: Colors.red,
                value: isCheck,
                onChanged: (value) {
                  setState(() {
                    isCheck = value!;
                  });
                },
              ),
              Text(isCheck == true ? "Setuju" : "Tidak Setuju"),
            ],
          ),
          Text("Switch"),
          Row(
            children: [
              Switch(
                activeColor: Colors.red,
                value: isCheckSwitch,
                onChanged: (value) {
                  setState(() {
                    isCheckSwitch = value;
                  });
                },
              ),
              Text(isCheckSwitch == true ? "Hidup" : "Tidak Hidup"),
            ],
          ),
          Text("DropdownButton"),
          DropdownButton(
            value: dropdownSelect,
            hint: Text("Pilih Warna"),
            items: ["Merah", "Hijau", "Biru"].map((String value) {
              return DropdownMenuItem(value: value, child: Text(value));
            }).toList(),
            onChanged: (value) {
              setState(() {});
              dropdownSelect = value;
            },
          ),
          Text("Date Picker"),
          ElevatedButton(
            child: Text("Pilih Tanggal"),
            onPressed: () async {
              final DateTime? pickerDate = await showDatePicker(
                context: context,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (pickerDate != null) {
                setState(() {});
                selectedDate = pickerDate;
              }
            },
          ),
          Text(selectedDate.toString()),
          Text(
            selectedDate == null
                ? "Pilih tanggal dulu"
                : DateFormat('EEEE').format(selectedDate!),
          ),
          Text(
            selectedDate == null
                ? "Pilih tanggal dulu"
                : DateFormat('yyyy').format(selectedDate!),
          ),
          Text(
            selectedDate == null
                ? "Pilih tanggal dulu"
                : DateFormat('MMM').format(selectedDate!),
          ),
          Text(
            selectedDate == null
                ? "Pilih tanggal dulu"
                : DateFormat(
                    'EEEE, dd MMMM yyyy',
                    "id_ID",
                  ).format(selectedDate!),
          ),
          SizedBox(height: 24),
          Text("Time Picker"),
          ElevatedButton(
            child: Text("Pilih Jam"),
            onPressed: () async {
              final TimeOfDay? pickerDate = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
                // firstDate: DateTime(2000),
                // lastDate: DateTime(2100),
              );
              if (pickerDate != null) {
                setState(() {});
                selectedTime = pickerDate;
              }
            },
          ),
          Text(
            selectedTime == null
                ? "Pilih jam dulu"
                : "${selectedTime!.hour.toString()} : ${selectedTime!.minute.toString()}",
          ),
        ],
      ),
    );
  }
}
