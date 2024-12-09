# **Meeting Scheduler**

**This project was developed for the Divisional Hackathon by Team 'confused_coders'.**

### **Team Members**
1. Md Mahmud Hossain Ferdous  
2. Hasibur Rahman Khurasani Jawad  
3. Hasan Ahmed  

---

## **Goal**

The **Meeting Scheduler** project aims to design and develop a user-friendly application that facilitates **seamless scheduling, booking, and management of meetings**. The project tackles common challenges like **time zone differences**, **booking conflicts**, and **user preferences**, while enhancing **time efficiency**, **collaboration**, and **organization** for Hosts and Guests alike.

---

## **Primary Objectives**
1. **Simplify Scheduling**  
   - Hosts can create time slots, and Guests can easily book them.  
   - Automate repetitive tasks like recurring meetings and time slot updates.  

2. **Address Time Zone Differences**  
   - Allow users to set preferred time zones and display meeting times in their local zones.  
   - Provide accurate time zone conversions for global collaboration.  

3. **Prevent Booking Conflicts**  
   - Avoid overlapping or double bookings using a conflict detection system.  
   - Use a **priority-based booking algorithm** to resolve conflicts.  

4. **Support Role-Based Functionality**  
   - Hosts: Manage, edit, and oversee time slots and bookings.  
   - Guests: Search, book, and manage their schedules effortlessly.  

5. **Enhance User Experience**  
   - Intuitive, responsive, and timezone-aware interface.  
   - Real-time notifications for booking confirmations, updates, and reminders.  

6. **Facilitate Collaboration**  
   - Support recurring meetings, group bookings, and integrated meeting links (e.g., Zoom, Google Meet).  

7. **Ensure Reliability and Scalability**  
   - Robust backend for large-scale scheduling.  
   - High-quality, maintainable, and scalable codebase.  

8. **Implement Advanced Features**  
   - Push notifications, analytics, and custom scheduling preferences for a competitive edge.  

---

## **Features**

### **1. User Authentication and Roles**
- Secure login/registration with JWT.  
- **Roles:**  
  - **Hosts:** Create, edit, delete, and manage time slots.  
  - **Guests:** Search and book available slots.  

### **2. Timezone and Localization**
- Set preferred time zones during registration.  
- Automatically convert and display times in local zones.  

### **3. Multi-User Slot Management**
#### **Host Features**  
- Create recurring or one-time slots.  
- Edit or delete time slots.  
- View slot statuses (booked, available, canceled).  
- Manage multiple Hosts.  
#### **Guest Features**  
- Book available slots from multiple Hosts.  

### **4. Advanced Slot Booking Algorithm**
- Prioritize bookings based on:  
  - User preferences.  
  - Conflict resolution for overlapping bookings.  

### **5. Push Notifications**
- Real-time alerts for:  
  - Booking confirmations.  
  - Meeting reminders.  
  - Cancellations or updates.  

### **6. Analytics (Optional Advanced Feature)**
- Insights into:  
  - Booking patterns and peak times.  
  - User engagement to optimize scheduling strategies.  

### **7. Frontend UI/UX**
- Intuitive, responsive, and easy-to-navigate design.  
- Ensures timezone awareness and user-friendliness.  

---

## **Key Benefits**
1. **Increased Productivity:** Automates scheduling, saving time.  
2. **Global Accessibility:** Supports users across different time zones.  
3. **Improved Organization:** Provides a centralized system to manage meetings.  
4. **Scalability:** Suitable for various domains, such as education and corporate settings.  

---

## **Tech Stack**

- **Framework:** Flutter  
- **Backend:** Node.js  
- **Database:** MongoDB  
- **Architecture:**  
  - MVVM (Frontend)  
  - MVC (Backend)  

---

## **Setup Instructions**

1. **Clone the Repository:**  
   ```bash
   git clone https://github.com/username/meeting-scheduler.git
   ```

   ```bash
   cd meeting-scheduler
   ```
   ```bash
   flutter pub get
   flutter run
   ```
