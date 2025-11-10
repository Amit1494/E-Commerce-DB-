# 🛍️ E-Commerce Database Management System (MySQL Project)

## 📖 Project Overview
The **E-Commerce Database Management System** is a SQL-based project designed to model and manage data for an online shopping platform. It demonstrates how to organize, maintain, and automate various database operations such as customer management, product listings, order processing, payments, shipments, and product reviews using **MySQL**.

This project is a perfect example for students and developers learning **Database Management Systems (DBMS)**, **SQL**, and **real-world relational database design**. It includes stored procedures, triggers, and functions to automate calculations and maintain data consistency.

---

## 🧩 Key Features
- **Customer Management** – Maintain customer information including name, contact, and location.  
- **Product & Category Management** – Manage multiple product categories with details like price and stock.  
- **Order & Order Details** – Supports multiple products per order and automatically updates total amounts.  
- **Payment Records** – Tracks payment modes, dates, and amounts securely.  
- **Shipment Tracking** – Stores delivery address and current shipment status.  
- **Customer Reviews** – Allows customers to review and rate products.  
- **Automation Using Triggers & Procedures** –  
  - Automatically update stock after order placement.  
  - Recalculate total order amount dynamically.  
- **Stored Function for Discounts** – Calculates discounts based on purchase amount.  

---

## 🗄️ Database Structure
### **Main Tables**
1. **Customer** – Stores user details.  
2. **Category** – Defines product categories.  
3. **Product** – Holds product data including category, price, and stock.  
4. **Order_Master** – Stores main order information.  
5. **Order_Detail** – Maintains items in each order.  
6. **Payment** – Records payment transactions.  
7. **Shipment** – Tracks delivery details.  
8. **Review** – Contains customer feedback and ratings.

---

## ⚙️ Technologies Used
| Component | Technology |
|------------|-------------|
| **Database** | MySQL |
| **Language** | SQL |
| **Tools** | MySQL Workbench / phpMyAdmin |
| **Concepts** | DDL, DML, Joins, Views, Stored Procedures, Triggers, Functions |

---

## 🚀 How to Use
1. **Clone this repository**
   ```bash
   git clone https://github.com/yourusername/ecommerce-db-project.git
