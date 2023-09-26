CREATE DATABASE clinic;

CREATE TABLE patients (
id INT, 
name VARCHAR(50),
PRIMARY KEY(id)
);

CREATE TABLE medical_histories(
id INT, 
admitted_at TIMESTAMP,
patient_id INT,
status VARCHAR(50),
PRIMARY KEY(id),
CONSTRAINT fk_patients
FOREIGN KEY(patient_id)
REFERENCES patients(id)
);

CREATE TABLE invoices (
id INT, 
total_amount DECIMAL,
generated_at TIMESTAMP,
payed_at TIMESTAMP,
medical_history_id INT,
PRIMARY KEY(id),
CONSTRAINT fk_medical_histories
FOREIGN KEY(medical_history_id)
REFERENCES medical_histories(id)
);



CREATE TABLE invoice_items (
id INT, 
unit_price DECIMAL,
quantity INT,
total_price DECIMAL,
invoice_id INT,
treatment_id INT,
PRIMARY KEY(id),
CONSTRAINT fk_invoices
FOREIGN KEY(invoice_id)
REFERENCES invoices(id),
CONSTRAINT treatments
FOREIGN KEY(treatment_id)
REFERENCES treatments(id)
);

CREATE TABLE treatments(
id INT,
type VARCHAR(50),
name VARCHAR(50),
PRIMARY KEY(id)
);

CREATE TABLE join_med_treat (
medical_history_id INT,
treatment_id INT,
PRIMARY KEY(medical_history_id, treatment_id),
CONSTRAINT fk_medical_histories
FOREIGN KEY (medical_history_id)
REFERENCES medical_histories(id),
CONSTRAINT fk_treatments 
FOREIGN KEY(treatment_id)
REFERENCES treatments(id)
);

CREATE INDEX patient_id ON medical_histories(patient_id ASC);
CREATE INDEX medical_history_id ON invoices(medical_history_id ASC);
CREATE INDEX invoice_id ON invoice_items(invoice_id ASC);
CREATE INDEX treatment_id ON invoice_items(treatment_id ASC);
CREATE INDEX medical_history ON join_med_treat(medical_history_id ASC);
CREATE INDEX treatment ON join_med_treat(treatment_id ASC);