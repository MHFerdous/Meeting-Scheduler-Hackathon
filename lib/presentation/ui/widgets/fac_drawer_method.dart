import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Drawer customisedFacultyDrawer(BuildContext context) {
  TextEditingController batchController = TextEditingController();
  TextEditingController sectionController = TextEditingController();
  return Drawer(
    width: 286.w,
    backgroundColor: const Color(0xFFE0FFF1),
    child: Column(
      children: [
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                title: Center(
                  child: Text(
                    'My Profile',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 21.sp),
                  ),
                ),
                hoverColor: Colors.grey,
                onTap: () {},
              ),
              divider(),
              ListTile(
                title: Center(
                  child: Text(
                    'My Todo',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 21.sp),
                  ),
                ),
                hoverColor: Colors.grey,
                onTap: () {},
              ),
              divider(),
              ListTile(
                title: Center(
                  child: Text(
                    "Departments' Faculty",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 21.sp),
                  ),
                ),
                hoverColor: Colors.grey,
                onTap: () {},
              ),
              divider(),
              ListTile(
                title: Center(
                  child: Text(
                    "Batch Routine",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 21.sp),
                  ),
                ),
                hoverColor: Colors.grey,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Write Batch'),
                        content: SizedBox(
                          height: 150.h,
                          width: 150.w,
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextFormField(
                                controller: batchController,
                                decoration:
                                    const InputDecoration(hintText: 'Batch'),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              TextFormField(
                                controller: sectionController,
                                decoration:
                                    const InputDecoration(hintText: 'Section'),
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.black),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              divider(),
              ListTile(
                title: Center(
                  child: Text(
                    'Bus Schedule',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 21.sp),
                  ),
                ),
                hoverColor: Colors.grey,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        height: 500,
                        child: AlertDialog(
                          title: Center(
                            child: Column(
                              children: [
                                Text(
                                  "Bus Schedule",
                                  style: TextStyle(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          content: Image.asset(
                            'assets/images/bus.jpg',
                            height: 300.h,
                            width: 500.w,
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              divider(),
            ],
          ),
        ),
      ],
    ),
  );
}

Divider divider() {
  return Divider(
    color: const Color(0xFF0D6858),
    height: 3.h,
    thickness: 1.w,
  );
}
