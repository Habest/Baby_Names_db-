-- Questions 1 : Exploring the data

SELECT * FROM regions;
SELECT * FROM names;

SELECT Name, SUM(Births) as Total_Births
FROM names
GROUP BY Name
ORDER BY Total_Births DESC
LIMIT 10;

---Answer 
--- The Top 10 most popular names overall

SELECT Gender, Name, SUM(Births) as Total_Births
FROM names
GROUP BY Gender, Name
ORDER BY Gender, Total_Births DESC
LIMIT 10;

--- Answer 
--- The Top 10 most popular names by Genders 

SELECT COUNT(DISTINCT Name) AS number_of_names
FROM names;

-- Answer: 16654 unique Name

SELECT COUNT(DISTINCT Region) AS number_of_Region
FROM regions;

-- Answer 
-- There are 8 unique regions

SELECT name, COUNT(*) as common_names 
FROM names 
GROUP BY name 
ORDER BY common_names DESC 
LIMIT 10;

--Answer 
-- Top 10 common names

SELECT r.Region, n.Name, SUM(n.Births) as Total_Births
FROM names n
JOIN regions r ON n.State = r.State
GROUP BY r.Region, n.Name
ORDER BY r.Region, Total_Births DESC;

--Top 10 most popular names by region

--Key question

-- For each state, count the number of names
SELECT regions.State AS State, COUNT(names.Name) AS No_of_names
FROM regions
LEFT JOIN names
ON regions.State = names.State
GROUP BY regions.State
ORDER BY No_of_names DESC;

-- Answer: (i) The indicate that CA 67733 has the most unique names follows by Tx 57463, Ny 44838 and so on 
--         (ii) The last on the list is VT with 2779 unique names

--Trends in baby name popularity over time
SELECT Year, Name, SUM(Births) as Total_Births
FROM names
GROUP BY Year, Name
ORDER BY Year, Total_Births DESC;

--Answer: This result shows trending in the total number of births for each name in each year, and ranking them by popularity within each year.

--How have birth rates changed over time by region?
SELECT r.Region, n.Year, SUM(n.Births) as Total_Births
FROM names n
JOIN regions r ON n.State = r.State
GROUP BY r.Region, n.Year
ORDER BY r.Region, n.Year;

---Answer: This shows the report of hoe the birth rate has been control in past years
   --- from 2000 to 2009 in the region. Birth rate for each region in each years are within same rate

---What are the most popular names for each gender in each region?
SELECT r.Region, n.Gender, n.Name, SUM(n.Births) as Total_Births
FROM names n
JOIN regions r ON n.State = r.State
GROUP BY r.Region, n.Gender, n.Name
ORDER BY r.Region, n.Gender, Total_Births DESC;  

--answer: This are result for the unique names Emily 30697, Olivia 23998, Madison 23345, Isabella 22511

-- What is the distribution of male and female births by region?
SELECT r.Region, n.Gender, SUM(n.Births) as Total_Births
FROM names n
JOIN regions r ON n.State = r.State
GROUP BY r.Region, n.Gender
ORDER BY r.Region, n.Gender;
---Answer This give us a breakdown of the number
-----of male and female births in each region.
   --- 