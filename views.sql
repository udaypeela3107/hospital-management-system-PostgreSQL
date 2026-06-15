CREATE VIEW appointment_summary AS
SELECT 
    a.appointment_id,
    p.patient_name,
    d.doctor_name,
    a.appointment_date,
    a.status
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id;

