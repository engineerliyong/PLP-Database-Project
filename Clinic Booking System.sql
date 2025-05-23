CREATE DATABASE MYCLINIC;
USE MYCLINIC;
-- 1. Table: patients
CREATE TABLE patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    phone VARCHAR(15) UNIQUE,
    email VARCHAR(100) UNIQUE
);

-- 2. Table: doctors
CREATE TABLE doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE,
    email VARCHAR(100) UNIQUE
);

-- 3. Table: appointments
CREATE TABLE appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- 4. Table: treatments
CREATE TABLE treatments (
    treatment_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    description TEXT NOT NULL,
    cost DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);



CREATE TABLE bills (
    bill_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    treatment_id INT NOT NULL,
    amount_paid DECIMAL(10, 2) NOT NULL,
    payment_date DATE NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(treatment_id)
);

