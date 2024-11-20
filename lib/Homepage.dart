import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Homepage extends StatelessWidget {
  final List<Map<String, dynamic>> doctors = [
    {
      "name": "Dr. Marcus Horizon",
      "specialty": "Cardiologist",
      "rating": 4.7,
      "image": "assets/img_5.png",
    },
    {
      "name": "Dr. Maria Elena",
      "specialty": "Psychologist",
      "rating": 4.9,
      "image": "assets/img_6.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Text(
                "Find your desire health solution",
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              TextField(
                decoration: InputDecoration(
                  hintText: "Search doctor, drugs, articles...",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildIcon("Doctor", "assets/img.png"),
                  _buildIcon("Pharmacy", "assets/img_2.png"),
                  _buildIcon("Hospital", "assets/img_3.png"),
                  _buildIcon("Ambulance", "assets/img_4.png"),
                ],
              ),
              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.teal[50],
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Early protection for your family health",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text("Learn more"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 70.r,
                          backgroundColor: Colors.white,
                        ),
                        Image.asset(
                          "assets/img_1.png",
                          height: 155.h,
                          width: 131.w,
                          fit: BoxFit.cover,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Doctor",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(onPressed: () {}, child: Text("See all")),
                ],
              ),
              SizedBox(height: 10.h),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 10.w,
                  childAspectRatio: 0.7,
                ),
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  final doctor = doctors[index];
                  return _buildDoctorCard(
                    name: doctor["name"],
                    specialty: doctor["specialty"],
                    rating: doctor["rating"],
                    image: doctor["image"],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(String label, String imagePath) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30.r,
          backgroundColor: Colors.teal[50],
          child: Image.asset(
            imagePath,
            height: 30.sp,
            width: 30.sp,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 5.h),
        Text(label, style: TextStyle(fontSize: 14.sp)),
      ],
    );
  }

  Widget _buildDoctorCard({
    required String name,
    required String specialty,
    required double rating,
    required String image,
  }) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30.r,
            backgroundImage: AssetImage(image),
          ),
          SizedBox(height: 10.h),
          Text(
            name,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          Text(
            specialty,
            style: TextStyle(fontSize: 14.sp, color: Colors.grey),
          ),
          Spacer(),
          Row(
            children: [
              Icon(Icons.star, color: Colors.orange, size: 16.sp),
              SizedBox(width: 5.w),
              Text("$rating", style: TextStyle(fontSize: 14.sp)),
            ],
          ),
        ],
      ),
    );
  }
}
