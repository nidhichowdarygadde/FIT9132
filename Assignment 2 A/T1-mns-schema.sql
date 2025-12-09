--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T1-mns-schema.sql

--Student ID: 34228683
--Student Name: Nidhi Chowdary Gadde
--Unit Code: FIT9132
--Applied Class No:01

/* Comments for your marker:




*/

-- Task 1 Add Create table statements for the white TABLES below
-- Ensure all column comments, and constraints (other than FK's)
-- are included. FK constraints are to be added at the end of this script

-- TABLE: APPOINTMENT




-- TABLE: EMERGENCY_CONTACT
CREATE TABLE emergency_contact (
    ec_id    NUMERIC(4) NOT NULL,
    ec_fname VARCHAR(30),
    ec_lname VARCHAR(30),
    ec_phone CHAR(10) NOT NULL
);

ALTER TABLE emergency_contact ADD (
    CONSTRAINT emergency_contact_pk PRIMARY KEY ( ec_id ),
    CONSTRAINT emergency_contact_uq UNIQUE ( ec_phone )
);

COMMENT ON COLUMN emergency_contact.ec_id IS
    'Emergency contact identifier';

COMMENT ON COLUMN emergency_contact.ec_fname IS
    'Emergency contact first name';

COMMENT ON COLUMN emergency_contact.ec_lname IS
    'Emergency contact last name';

COMMENT ON COLUMN emergency_contact.ec_phone IS
    'Emergency contact phone number';

-- TABLE: PATIENT
CREATE TABLE patient (
    patient_no            NUMERIC(4) NOT NULL,
    patient_fname         VARCHAR(30),
    patient_lname         VARCHAR(30),
    patient_street        VARCHAR(50) NOT NULL,
    patient_city          VARCHAR(20) NOT NULL,
    patient_state         VARCHAR(3) NOT NULL,
    patient_postcode      CHAR(4) NOT NULL,
    patient_dob           DATE NOT NULL,
    patient_contactmobile CHAR(10) NOT NULL,
    patient_contactemail  VARCHAR(25) NOT NULL,
    ec_id                 NUMERIC(4) NOT NULL
);

ALTER TABLE patient ADD (
    CONSTRAINT patient_pk PRIMARY KEY ( patient_no )
);

COMMENT ON COLUMN patient.patient_no IS
    'Patient  number (unique for each patient)';

COMMENT ON COLUMN patient.patient_fname IS
    'Patient first name';

COMMENT ON COLUMN patient.patient_lname IS
    'Patient last name';

COMMENT ON COLUMN patient.patient_street IS
    'Patient residential street address';

COMMENT ON COLUMN patient.patient_city IS
    'Patient residential city';

COMMENT ON COLUMN patient.patient_state IS
    'Patient residential state - NT, QLD, NSW, ACT, VIC, TAS, SA, or WA';

COMMENT ON COLUMN patient.patient_postcode IS
    'Patient residential postcode';

COMMENT ON COLUMN patient.patient_dob IS
    'Patient date of birth';

COMMENT ON COLUMN patient.patient_contactmobile IS
    'Patient contact mobile number';

COMMENT ON COLUMN patient.patient_contactemail IS
    'Patient contact email address';

COMMENT ON COLUMN patient.ec_id IS
    'Patient emergency contact identifier';


--TABLE : APPOINTMENT
CREATE TABLE appointment (
    appt_no            NUMERIC(7) NOT NULL,
    appt_datetime      DATE NOT NULL,
    appt_roomno        NUMERIC(2) NOT NULL,
    appt_length        CHAR(1) NOT NULL,
    patient_no         NUMERIC(4) NOT NULL,
    provider_code      CHAR(6) NOT NULL,
    nurse_no           NUMERIC(3) NOT NULL,
    appt_prior_appt_no NUMERIC(7)
);

ALTER TABLE appointment ADD (
    CONSTRAINT appointment_pk PRIMARY KEY ( appt_no ),
    CONSTRAINT appt_datetime_uq UNIQUE ( appt_datetime,
                                         appt_roomno,
                                         patient_no,
                                         provider_code,
                                         appt_prior_appt_no )
);

COMMENT ON COLUMN appointment.appt_no IS
    'Appointment nuumber (identifier)';

COMMENT ON COLUMN appointment.appt_datetime IS
    'Date and time of the appointment';

COMMENT ON COLUMN appointment.appt_roomno IS
    'Room in which appointment is scheduled to take place';

COMMENT ON COLUMN appointment.appt_length IS
    'Length of appointment - Short, Standard or Long (S, T or L)';

COMMENT ON COLUMN appointment.patient_no IS
    'Patient who books the appointment';

COMMENT ON COLUMN appointment.provider_code IS
    'Provider who is assigned to the appointment';

COMMENT ON COLUMN appointment.nurse_no IS
    'Nurse who is assigned to the appointment';

COMMENT ON COLUMN appointment.appt_prior_appt_no IS
    'Prior appointment number which leads to this appointment (this is required to be unique)'
    ;


-- Add all missing FK Constraints below here

--ec_id is the FK in patient table from emergency_contact table
ALTER TABLE patient ADD (
    CONSTRAINT emergency_contact_patient FOREIGN KEY ( ec_id )
        REFERENCES emergency_contact ( ec_id )
);

--patient_no is the FK in appointment table from patient table
ALTER TABLE appointment ADD (
    CONSTRAINT patient_appointment FOREIGN KEY ( patient_no )
        REFERENCES patient ( patient_no )
);

--provider_code is the FK in appointment table from provider table
ALTER TABLE appointment ADD (
    CONSTRAINT provider_appointment FOREIGN KEY ( provider_code )
        REFERENCES provider ( provider_code )
);

--nurse_no is the FK in appointment table from nurse table
ALTER TABLE appointment ADD (
    CONSTRAINT nurse_appointment FOREIGN KEY ( nurse_no )
        REFERENCES nurse ( nurse_no )
);

--appt_prior_appt_no is the FK in appointment table from appointment table itself
ALTER TABLE appointment ADD (
    CONSTRAINT appointment_appointment FOREIGN KEY ( appt_prior_appt_no )
        REFERENCES appointment ( appt_no )
);