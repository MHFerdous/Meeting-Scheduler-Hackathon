class Urls {
  static const String _facultyBaseUrl = 'http://10.0.2.2:2006/api/teacher';
  static const String _studentBaseUrl = 'http://10.0.2.2:2006/api/student';

  static const String availableFaculty = '$_facultyBaseUrl/AvailableTeachers';
  static const String facultyReg = '$_facultyBaseUrl/Registration';
  static String facultySignIn(email, password) =>
      '$_facultyBaseUrl/Login/$email/$password';
  static const String facultySignup = '$_facultyBaseUrl/ProfileUpdate';
  static String facultyVerifyEmail(String email) =>
      '$_facultyBaseUrl/RecoverVerifyEmail/$email';
  static String facultyVerifyOTP(String email, String otp) =>
      '$_facultyBaseUrl/RecoverVerifyOtp/$email/$otp';
  static const String facultyPasswordChange =
      '$_facultyBaseUrl/RecoverResetPassword';
  static const String facultyList = '$_facultyBaseUrl/availableCourseAndTeacher';
  static String facultyDeleteTodo(String id) => '$_facultyBaseUrl/deleteTeacherTodo/$id';

  static const String facultyAvailable = '$_facultyBaseUrl/AvailableTeachers';

  static String availabilityCheckTeachers(String email) => '$_facultyBaseUrl/AvailityCheckTeachers/$email';
  static String availabilityCheckStudents(String id) => '$_studentBaseUrl/AvailityCheckStudents/$id';
  static const String facultyProfileDetails = '$_facultyBaseUrl/ProfileDetails';
  static const String facultyProfileUpdate = '$_facultyBaseUrl/ProfileUpdate';
  static String facultySubGrpBatchSec = '$_facultyBaseUrl/createSubjectGroupBatchSections';
  static String joinSubjectGroupBatchSections(String groupId) => '$_facultyBaseUrl/joinSubjectGroupBatchSections/$groupId';
  static String chattingGroup(String groupId, String senderId) => '$_facultyBaseUrl/joinSubjectGroupBatchSections/$groupId/$senderId';
  static String showFacultySubGrpBatchSec = '$_facultyBaseUrl/showFacultySubGrpBatchSec';
  static String facultyDeleteGroup(String id) => '$_facultyBaseUrl/deleteGroupsByTeachers/$id';
  static const String facultyAddAnnouncement = '$_facultyBaseUrl/announcement';
  static const String facultyShowAnnouncement = '$_facultyBaseUrl/showAnnouncement';
  static const String resource = '$_facultyBaseUrl/resource';
  static const String showResource = '$_facultyBaseUrl/showResources';
  static String deleteResource(String id) => '$_facultyBaseUrl/deleteTeacherResources/$id';
  static String facAddMyTodo = '$_facultyBaseUrl/facAddMyTodo';
  static String showFacMyTodo = '$_facultyBaseUrl/showFacMyTodo';
  static String getChat(String id) => '$_facultyBaseUrl/showChats/$id';
  static String deleteChat(String groupId, String memberId, String messageId) => '$_facultyBaseUrl/delete-chat/$groupId/$memberId/$messageId';

  static String facultyDeleteAnnouncement(String id) => '$_facultyBaseUrl/deleteTeacherAnnouncement/$id';
  static String facultyAddTask(String batch, section, courseTitle, task) =>
      '$_facultyBaseUrl/teacherAddTask/$batch/$section/$courseTitle/$task';
  //static String facultyAddMyToDo = '$_facultyBaseUrl/facultyMeeting';
  //static String facultyShowMyToDo = '$_facultyBaseUrl/showFacultyMeeting';
  static String facultyDeleteMyToDo(String id) =>
      '$_facultyBaseUrl/deleteFacultyMeeting/$id';
  static String facultyDeleteAnnouncementToDo(String id) =>
      '$_facultyBaseUrl/deleteTeacherAnnouncement/$id';

  static const String availableStudent = '$_studentBaseUrl/AvailableTeachers';
  static const String studentReg = '$_studentBaseUrl/Registration';
  static String studentSignIn(email, password) =>
      '$_studentBaseUrl/Login/$email/$password';
  static const String studentSignup = '$_studentBaseUrl/ProfileUpdate';
  static String studentVerifyEmail(String email) =>
      '$_studentBaseUrl/RecoverVerifyEmail/$email';
  static String studentVerifyOTP(String email, String otp) =>
      '$_studentBaseUrl/RecoverVerifyOtp/$email/$otp';
  static String studentPasswordChange = '$_studentBaseUrl/RecoverResetPassword';

  static String availableCourseBatch = '$_studentBaseUrl/availableCourseBatch';
  static String stuEnrolledCourses(stuName) => '$_studentBaseUrl/enrolledCourse/$stuName';
  static String batchAllAnnouncement(batch) => '$_studentBaseUrl/allAnnouncement2/$batch';
  static String batchAnnouncement(batch, type) => '$_studentBaseUrl/allAnnouncement/$batch/$type';
  static String stuAddMyTodo = '$_studentBaseUrl/stuAddMyTodo';
  static String showStuTodo(String id) => '$_studentBaseUrl/showStudentTodo/$id';
  static String deleteStuTodo(String id) => '$_studentBaseUrl/deleteStudentTodo/$id';
  static String stuAddResources = '$_studentBaseUrl/studentAddResources';
  static String showStuAddResources(batch) => '$_studentBaseUrl/showStudentResources/$batch';
}
