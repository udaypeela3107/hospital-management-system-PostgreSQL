CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100)
);
CREATE TABLE doctors (
    doctor_id SERIAL PRIMARY KEY,
    doctor_name VARCHAR(100),
    specialization VARCHAR(100),
    department_id INT REFERENCES departments(department_id)
);
CREATE TABLE patients (
    patient_id SERIAL PRIMARY KEY,
    patient_name VARCHAR(100),
    gender VARCHAR(10),
    phone VARCHAR(15)
);
CREATE TABLE appointments (
    appointment_id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES patients(patient_id),
    doctor_id INT REFERENCES doctors(doctor_id),
    appointment_date DATE,
    status VARCHAR(30)
);
CREATE TABLE rooms (
    room_id SERIAL PRIMARY KEY,
    room_type VARCHAR(50),
    room_charge DECIMAL(10,2)
);
CREATE TABLE admissions (
    admission_id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES patients(patient_id),
    room_id INT REFERENCES rooms(room_id),
    admit_date DATE,
    discharge_date DATE
);
CREATE TABLE bills (
    bill_id SERIAL PRIMARY KEY,
    admission_id INT REFERENCES admissions(admission_id),
    total_amount DECIMAL(10,2),
    payment_status VARCHAR(30)
);
CREATE TABLE prescriptions (
    prescription_id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES patients(patient_id),
    doctor_id INT REFERENCES doctors(doctor_id),
    medicine_name VARCHAR(100),
    dosage VARCHAR(100)
);
