# 💿 Sakila DVD Rental Store Analysis Project Excel, SQL & Power Bi

Sakila DVD Rental Store Analysis Project using Excel, SQL & Power Bi to uncover insights releated to customer behaviour, movie rental distribution, customer retention and content preference trend. The goal is to optimize film inventory, enhance customer satisfaction, improve staff performance, and streamline store operations. The dashboard will provide actionable recommendations for targeted marketing campaigns, film collection enhancements, and staff training initiatives to improve business performance. This project involves Customers Analysis, Staff & Operation analysis, Film & inventory analysis.

> [!NOTE]
> Click the dropdown list below for more information on SQL or Power BI.

---

<details>
<summary>SQL 📊</summary>

# 💿 Sakila DVD Rental Store Analysis SQL Project

## 📂 Introduction to the Database

This project involves analyzing the Sakila DVD Rental Store Database using Power BI to uncover insights related to customer behaviour, movie rental distribution, film inventory,staff,store,country, film category, etc. The dataset described is a comprehensive database that appears to represent a video rental store or movie rental service. It comprises multiple tables, each representing different entities and their relationships.

### 🛠️ How the Database Works

- **📊 Tables**: The database is primarily focused on the `movie_rental` , which contains the following key tables:

- `Actor`: The actor table lists information for all the actors, including first name and last name of actors.
- `Address`: The address table contains address information for customers, staff, and stores.
- `Category`: The category table lists the categories that can be assigned to films.
- `City`: The city table contains a list of cities.
- `Country`: The country table contains a list of countries or regions.
- `Customer`: The customer table contains a list of all customers.
- `Film`: The film table lists all the films that may be in stock in the store.
- `Film_text`: The content of the film_text table is kept in synchrony with the film table by means of triggers on the film table INSERT, UPDATE, and DELETE operations.
- `Film_actor`: The film_actor table is used to support many-to-many relationships between films and actors.
- `Film_category`: The film_category table is used to support many-to-many relationships between films and categories.
- `Inventory`: A row in the inventory table represents a copy of a given film in a given store.
- `Language`: The language table lists all possible values for the film language and original language.
- `Payment`: The payment table records every payment made by the customer, including information such as the amount and rent paid.
- `Rental`: The rental table contains a row for each rental of each inventory item, which contains information about who rented what, when it rented it, and when it was returned.
- `Staff`: The staff table lists all staff information, including email addresses, login information, and pictures.
- `Store`: The store table lists all stores in the system.

- **📈 Key Insights**: Using SQL, we retrieve data that helps us answer questions such as:
  - Repeat customers generate a significantly higher share of total revenue compared to new customers.
  - Certain films consistently show high rental demand, indicating strong customer preferences.
  - Both staff members handle a similar volume of rentals, indicating balanced workload distribution
  - Peak periods can be targeted for promotions and marketing campaigns.
  - English-language films dominate overall rental demand.
  - Repeat customers consistently contribute a higher share of revenue over time.

---

## 🏗️ Database Setup


```sql
CREATE DATABASE movie_rental;
USE movie_rental;
```

## 📂 Importing Data into MySQL Workbench

To work with the database, we first need to import the data from the `movie_rental` file into MySQL Workbench. Follow these steps:

1. **Open MySQL Workbench**:

   - Launch MySQL Workbench and connect to your database server.

2. **Select the Database**:

   - Use the `movie_rental` database by running:
     ```sql
     USE movie_rental;
     ```

3. **Go to the Import Section**:

   - Click on the "Server" menu and select "Data Import."

4. **Choose the CSV File**:

   - In the "Import" tab, choose the `actor.csv` file as the source.
   - Ensure the "Import Data from File" option is selected.


5. **Map the Table**:

   - Select the destination table (`actor`).
   - Map the CSV columns to the corresponding table columns.

6. **Run the Import**:

   - Click on "Start Import."

7. **Verify the Data**:
   - After importing, verify the data using:
     ```sql
     SELECT * FROM  actor;
     ```

Same process for all the other tables as well.

---
  
## 📜 SQL Queries & Answers

### 1️⃣ What are the purchasing patterns of new customers versus repeat customers?

**📝 Query:**

```sql
SELECT 
customer_id,
COUNT(rental_id) AS total_rentals
FROM rental
GROUP BY customer_id
order by total_rentals desc;
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-2/blob/main/Images/SQL%20Images/EDA%20Q1.png)

---

### 2️⃣ Which films have the highest rental rates and are most in demand?

**📝 Query:**

```sql
SELECT 
film.title,
COUNT(rental.rental_id) AS rental_count,
film.rental_rate
FROM rental
JOIN inventory USING (inventory_id)
JOIN film USING (film_id)
GROUP BY film.title, film.rental_rate
ORDER BY rental_count DESC;
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-2/blob/main/Images/SQL%20Images/EDA%20Q2.png)

---

### 3️⃣ Are there correlations between staff performance and customer satisfaction?

**📝 Query:**

```sql
SELECT 
staff.staff_id,
COUNT(rental.rental_id) AS total_rentals,
SUM(payment.amount) AS total_revenue,
AVG(DATEDIFF(return_date, rental_date)) AS avg_duration
FROM rental
JOIN payment ON rental.rental_id = payment.rental_id
JOIN staff ON rental.staff_id = staff.staff_id
GROUP BY staff.staff_id
ORDER BY staff.staff_id asc;
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-2/blob/main/Images/SQL%20Images/EDA%20Q3.png)

---

### 4️⃣ Are there seasonal trends in customer behavior across different locations?

**📝 Query:**

```sql
SELECT 
MONTH(payment_date) AS month,
ROUND(SUM(amount),2) AS total_revenue
FROM payment
GROUP BY MONTH(payment_date)
ORDER BY month;
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-2/blob/main/Images/SQL%20Images/EDA%20Q4.png)

---

### 5️⃣ Are certain language films more popular among specific customer segments?

**📝 Query:**

```sql
SELECT 
language.name,
COUNT(rental.rental_id) AS rental_count
FROM rental
JOIN inventory USING (inventory_id)
JOIN film USING (film_id)
JOIN language USING (language_id)
GROUP BY language.name
ORDER BY rental_count DESC;
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-2/blob/main/Images/SQL%20Images/EDA%20Q5.png)

---

### 6️⃣ How does customer loyalty impact sales revenue over time?

**📝 Query:**

```sql
 SELECT 
customer_id,
ROUND(SUM(amount),2) AS total_revenue
FROM payment
GROUP BY customer_id
ORDER BY total_revenue DESC;
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-2/blob/main/Images/SQL%20Images/EDA%20Q6.png)

---

### 7️⃣ Are certain film categories more popular in specific locations?

**📝 Query:**

```sql
SELECT 
country.country,
category.name,
COUNT(rental.rental_id) AS rental_count
FROM rental
JOIN inventory USING (inventory_id)
JOIN film USING (film_id)
JOIN film_category USING (film_id)
JOIN category USING (category_id)
JOIN customer USING (customer_id)
JOIN address USING (address_id)
JOIN city USING (city_id)
JOIN country USING (country_id)
GROUP BY country.country, category.name
ORDER BY rental_count DESC;
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-2/blob/main/Images/SQL%20Images/EDA%20Q7.png)

---

### 8️⃣ How does the availability and knowledge of staff affect customer ratings?

**📝 Query:**

```sql
SELECT 
staff.staff_id,
COUNT(rental.rental_id) AS rentals,
AVG(DATEDIFF(return_date, rental_date)) AS avg_duration
FROM rental
JOIN staff USING (staff_id)
GROUP BY staff.staff_id;
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-2/blob/main/Images/SQL%20Images/EDA%20Q8.png)

---

### 9️⃣ How does the proximity of stores to customers impact rental frequency?

**📝 Query:**

```sql
SELECT 
CASE 
WHEN customer.store_id = inventory.store_id THEN 'Close'
ELSE 'Far'
END AS proximity,
COUNT(rental.rental_id) AS rental_count
FROM rental
JOIN customer USING (customer_id)
JOIN inventory USING (inventory_id)
GROUP BY proximity;
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-2/blob/main/Images/SQL%20Images/EDA%20Q9.png)

---

### 🔟 Do specific film categories attract different age groups of customers?

**📝 Query:**

```sql
SELECT 
category.name,
COUNT(rental.rental_id) AS rental_count
FROM rental
JOIN inventory USING (inventory_id)
JOIN film USING (film_id)
JOIN film_category USING (film_id)
JOIN category USING (category_id)
GROUP BY category.name
ORDER BY rental_count DESC;
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-2/blob/main/Images/SQL%20Images/EDA%20Q10.png)

---

### 1️⃣1️⃣ What are the demographics and preferences of the highest-spending customers?

**📝 Query:**

```sql
SELECT 
customer_id,
ROUND(SUM(amount),2) AS total_spent
FROM payment
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-2/blob/main/Images/SQL%20Images/EDA%20Q11.png)

---

### 1️⃣2️⃣ How does the availability of inventory impact customer satisfaction and repeat business?

**📝 Query:**

```sql
SELECT 
film_id,
COUNT(inventory_id) AS inventory_count
FROM inventory
GROUP BY film_id;
```

**📊 Answer:**

![Description of the screenshot](http://github.com/Pradipjagi99/Capstone-project-2/blob/main/Images/SQL%20Images/EDA%20Q12.png)

---

### 1️⃣3️⃣ What are the busiest hours or days for each store location, and how does it impact staffing requirements?

**📝 Query:**

```sql
SELECT 
HOUR(rental_date) AS hour,
COUNT(rental_id) AS rental_count
FROM rental
GROUP BY hour
ORDER BY rental_count DESC;
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-2/blob/main/Images/SQL%20Images/EDA%20Q13.png)

---

### 1️⃣4️⃣ What are the cultural or demographic factors that influence customer preferences in different locations?

**📝 Query:**

```sql
SELECT 
country.country,
category.name,
COUNT(rental.rental_id) AS rental_count
FROM rental
JOIN inventory USING (inventory_id)
JOIN film USING (film_id)
JOIN film_category USING (film_id)
JOIN category USING (category_id)
JOIN customer USING (customer_id)
JOIN address USING (address_id)
JOIN city USING (city_id)
JOIN country USING (country_id)
GROUP BY country.country, category.name
ORDER BY rental_count desc;
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-2/blob/main/Images/SQL%20Images/EDA%20Q14.png)

---

### 1️⃣5️⃣ How does the availability of films in different languages impact customer satisfaction and rental frequency?

**📝 Query:**

```sql
SELECT 
language.name,
COUNT(rental.rental_id) AS rental_count,
AVG(DATEDIFF(return_date, rental_date)) AS avg_duration
FROM rental
JOIN inventory USING (inventory_id)
JOIN film USING (film_id)
JOIN language USING (language_id)
GROUP BY language.name;
```

**📊 Answer:**

![Description of the screenshot](https://github.com/Pradipjagi99/Capstone-project-2/blob/main/Images/SQL%20Images/EDA%20Q15.png)

---

</details>

---

<details>
    <summary>Power BI 📈</summary>

# 💿 Sakila DVD Rental StoreAnalysis in Power BI 📊

The Power BI dashboard will offer insights into customer segmentation, sales trends, film performance, staff productivity, and store revenue. The Power BI dashboard will serve as a valuable tool for rental store owners to make informed decisions and achieve success in the competitive DVD rental market.

## ✨ Key Features

📌 **Customer Analysis**: Repeat customers are approximately 96%. Few customers contribute highest revenue (pareto principle 80/20 rule). Customers spread globally.

📌 **Film Inventory analysis**: Top film are zorro ark, Ventilation, etc. English dominates rentals. Customer preference is language-driven. Sports, Comedy, Sci-Fi. Revenue concentrated in few genres.

📌 **Staff & Operation Analysis**: Staff ID 2 generates slightly higher revenue. Rentals are consistent throughout the day. Slight peak at early hours (0–2). Store ID 2 performs better than Store 1. Average rental duration ≈ 5 days.

---

![App Screenshot](https://github.com/Pradipjagi99/Capstone-project-2/blob/main/Images/Power%20Bi%20Images/overview.png)

---

## 🛠️ Tools Used:

**Power BI**: For creating dashboards, visualizations, and interactive reports.

**SQL**: For querying, aggregating, and preparing data for analysis.

**Excel/CSV**: For preprocessing and cleaning raw data.

## 🚀 Steps in Project

✔️ Requirement Gathering / Business Requirements

✔️ Data Extraction

✔️ Data Walkthrough

✔️ Data Cleaning

✔️ Data Modeling

✔️ DAX Calculations

✔️ Dashboard Layout Design

✔️ Chart Development and Formatting

✔️ Dashboard / Report Development

✔️ Insights Generation

✔️ Report Presentation

## 🧑‍💼 Business Requirement

The objective of this project is to create a comprehensive Power BI dashboard using the Sakila DVD Rental Store Database, providing valuable insights into the rental store business. The analysis will focus on customer behavior, film inventory management, staff performance, and store operations. The goal is to enable data-driven decision-making and improve overall business performance. The Power BI dashboard will offer insights into customer segmentation, sales trends, film performance, staff productivity, and store revenue. The primary aim is to optimize film inventory, enhance customer satisfaction, improve staff performance, and streamline store operations. The dashboard will provide actionable recommendations for targeted marketing campaigns, film collection enhancements, and staff training initiatives to improve business performance. The final deliverables will include a report and presentation showcasing the dashboard's findings and recommendations. The Power BI dashboard will serve as a valuable tool for rental store owners to make informed decisions and achieve success in the competitive DVD rental market.

## 📈 KPI’s Requirements

**1. Total Customer**: The total number of customer.

**2. Total Rental**: The total number of movies which are rented.

**3. Total Revenue**: The total revenue generated is around 68k.

**4. Avg Rental Duration**: The avg number of day which a movie is rented.

## 📊 Chart’s Requirements

<ol>  
<h3><li>  overview 📅</li></h3>  
<ul>  
 <li> Total Revenue is 67.41k showing overall business strength</li>  
  <li> 96.28% customers are repeat customers showing strong customer retention.</li>  
<br>
<div style="display: flex; justify-content: center; align-items: center; gap: 20px;">
   <img src="https://github.com/Pradipjagi99/Capstone-project-2/blob/main/Images/Power%20Bi%20Images/overview.png"  />
</div>
</ul>

<h3><li> Customer Analysis 📈</li></h3>  
<ul>  
  <li> Repeat customers are approximately 96%. </li>
  <li> Few customers contribute highest revenue (pareto principle 80/20 rule). </li> 
  <br> 
<div style="display: flex; justify-content: center; align-items: center; gap: 20px;">
   <img src="https://github.com/Pradipjagi99/Capstone-project-2/blob/main/Images/Power%20Bi%20Images/customer%20analysis.png"  />
</div>
</ul>

<h3><li> Flim Inventory Analysis 💿</li></h3>  
<ul>  
  <li> Top film are zorro ark, Ventilation, etc. </li>
  <li> English dominates rentals. Customer preference is language-driven </li> 
  <br> 
<div style="display: flex; justify-content: center; align-items: center; gap: 20px;">
   <img src="https://github.com/Pradipjagi99/Capstone-project-2/blob/main/Images/Power%20Bi%20Images/film%20inventory%20analysis.png"  />
</div>
</ul>

<h3><li> Staff & Operation Analysis 📈</li></h3>  
<ul>  
  <li> Rentals are consistent throughout the day. Slight peak at early hours (0–2) </li>
  <li> Average rental duration ≈ 5 days.</li> 
  <br> 
<div style="display: flex; justify-content: center; align-items: center; gap: 20px;">
   <img src="https://github.com/Pradipjagi99/Capstone-project-2/blob/main/Images/Power%20Bi%20Images/staff%20%26%20operation%20analysis.png"  />
</div>
</ul>

## Dashboard Insights

### Key Insights 🔑: 

- New customers contribute less initially, indicating an opportunity to improve onboarding and engagement strategies
- Repeat customers have higher lifetime value (CLV), making them more valuable than one-time customers
- Popular films should be stocked more in inventory to avoid stockouts and maximize revenue
- Certain films consistently show high rental demand, indicating strong customer preferences
- There is a positive relationship between staff efficiency and revenue generation
- Even with similar workloads, more efficient staff members generate higher revenue, highlighting the importance of operational efficiency
- Rental activity varies across different months, indicating clear seasonal trends
- Seasonal patterns can be leveraged to optimize staffing, inventory, and marketing strategies.
- Repeat customers show stronger language preferences, which can be leveraged for personalized recommendations
- Certain film languages are more popular among repeat customers, indicating established preferences
- Staff members handling more rentals tend to generate higher revenue.
- Expanding store locations strategically can increase customer reach and revenue

### 🎛 Interactive Features:

- Drill-through options to explore details at multiple levels.
- Custom slicers for dynamic filtering.
- KPIs displayed in real-time visuals.

## How to Use 📋

1. Download the Power BI file: `movie_rental.pbix`
2. Open the file in **Power BI Desktop**.
3. Explore the dashboards and insights interactively.

## File Details 📁

- **File Name**: `movie_rental.pbix` [Download File](https://github.com/Pradipjagi99/Capstone-project-2/blob/main/Dashboard/movie_rental.pbix)

</details>

---

## Contact 📱

For any queries or feedback, feel free to reach out:

- **Name 👤**: Jagi Pradip Rao
- **Email 📩**: pradip.jagi@gmail.com

## 🙌 Acknowledgments

A big shoutout to ACCIO JOB mentors for their helpful tutorial that guided this project.








 



















