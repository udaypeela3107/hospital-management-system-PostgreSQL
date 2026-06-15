--1. Display all tables available in the hospital database
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';

--2. Verify that all project tables were created successfully
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';

--3. Display all records from the departments table
SELECT * FROM departments;

--4. Display all records from the doctors table
SELECT * FROM doctors;

--5. Display all records from the patients table
SELECT * FROM patients;

-- 6. Display all records from the appointments table
SELECT * FROM appointments;

-- 7. Show all patients
SELECT * FROM patients;

-- 8. Show all doctors with departments
SELECT d.doctor_name, d.specialization, dep.department_name
FROM doctors d
JOIN departments dep ON d.department_id = dep.department_id;

-- 9. Show appointment details
SELECT p.patient_name, d.doctor_name, a.appointment_date, a.status
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id;

-- 10. Doctor with most appointments
SELECT d.doctor_name, COUNT(a.appointment_id) AS total_appointments
FROM doctors d
JOIN appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_name
ORDER BY total_appointments DESC;

-- 11. Total appointments by status
SELECT status, COUNT(*) AS total
FROM appointments
GROUP BY status;

-- 12. Monthly appointment trend
SELECT DATE_TRUNC('month', appointment_date) AS month, COUNT(*) AS total_appointments
FROM appointments
GROUP BY month
ORDER BY month;

-- 13. Total doctors per department
SELECT dep.department_name, COUNT(d.doctor_id) AS total_doctors
FROM departments dep
JOIN doctors d ON dep.department_id = d.department_id
GROUP BY dep.department_name;

-- 14. Patient admission details
SELECT p.patient_name, r.room_type, ad.admit_date, ad.discharge_date
FROM admissions ad
JOIN patients p ON ad.patient_id = p.patient_id
JOIN rooms r ON ad.room_id = r.room_id;

-- 15. Highest bill amount
SELECT *
FROM bills
ORDER BY total_amount DESC
LIMIT 1;

-- 16. Average bill amount
SELECT AVG(total_amount) AS average_bill
FROM bills;

-- 17. Paid vs unpaid bills
SELECT payment_status, COUNT(*) AS total_bills
FROM bills
GROUP BY payment_status;

-- 18. Prescriptions by doctor
SELECT d.doctor_name, COUNT(pr.prescription_id) AS total_prescriptions
FROM prescriptions pr
JOIN doctors d ON pr.doctor_id = d.doctor_id
GROUP BY d.doctor_name;

-- 19. Prescriptions by patient
SELECT p.patient_name, pr.medicine_name, pr.dosage
FROM prescriptions pr
JOIN patients p ON pr.patient_id = p.patient_id;

-- 20. Most used room type
SELECT r.room_type, COUNT(ad.admission_id) AS usage_count
FROM rooms r
JOIN admissions ad ON r.room_id = ad.room_id
GROUP BY r.room_type
ORDER BY usage_count DESC;

-- 21. Patients with bills
SELECT p.patient_name, b.total_amount, b.payment_status
FROM patients p
JOIN admissions ad ON p.patient_id = ad.patient_id
JOIN bills b ON ad.admission_id = b.admission_id;
