# Fashion Shop - SAP CAPM Project

## 📌 Overview

Fashion Shop is a SAP CAP (Cloud Application Programming Model) based application built on SAP BTP.  
This application allows users to manage fashion items, sections, and fashion types with role-based authorization and Fiori Elements UI.
This project demonstrates hands-on experience with SAP CAP, SAP HANA Cloud, Fiori Elements, and XSUAA Authentication.

---

## 🚀 Features

- Manage Fashion Items
- Manage Sections
- Manage Fashion Types
- Draft Enabled Application
- Role-Based Authorization (Viewer / Admin / Manager)
- Value Help (F4 Help)
- Fiori Elements UI
- SAP CAP Node.js Backend
- SAP HANA Cloud Database

---

## 🛠️ Technologies Used

- SAP CAP (Node.js)
- SAP BTP (Cloud Foundry)
- SAP HANA Cloud
- SAP Fiori Elements
- SAP XSUAA Authentication
- CDS (Core Data Services)
- OData V4

---

## 👥 Role-Based Access

### Viewer
- Read-only access to all data

### Admin
- Create / Update / Delete Fashion Items
- Read access to master data

### Manager
- Full access
- Manage Sections
- Manage Fashion Types
- Manage Fashion Items

## 📂 Project Structure

```
Fashion_Shop_CAPM
│
├── app/            # Fiori UI Application
├── db/             # CDS Data Model
├── srv/            # CAP Service Layer
├── xs-security.json
├── mta.yaml
└── package.json
```

---

## ▶️ Run Locally

Install dependencies

```
npm install
```

Run application

```
cds watch
```

Open in browser

```
http://localhost:4004
```

---

## ☁️ Deployment

This application is deployed using:

- SAP BTP Cloud Foundry
- SAP HANA Cloud
- XSUAA Authentication

Deploy commands:

```
mbt build
cf deploy
```


## 📚 Learning Outcomes

- SAP CAP Development
- Role-Based Authorization
- Fiori Elements UI
- Draft Enabled Applications
- SAP BTP Deployment
- Value Help Implementation

---

## 👩‍💻 Author

Riya  
SAP ABAP | SAP BTP | CAP Developer
---
