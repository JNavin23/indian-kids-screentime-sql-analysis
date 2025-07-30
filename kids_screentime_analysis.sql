-- Indian Kids Screentime 2025 Project

CREATE DATABASE IF NOT EXISTS kids_screentime_db;
USE kids_screentime_db;

-- Average Screen Time by Age and Gender
SELECT Age, Gender,
     ROUND(AVG(Avg_Daily_Screen_Time_hr), 2) AS avg_screen_time_hr
FROM kids_screentime
GROUP BY Age, Gender
ORDER BY Age, Gender;

-- Device Popularity Count by Gender
SELECT Primary_Device, Gender,
      COUNT(*) AS device_count
FROM kids_screentime
GROUP BY Primary_Device, Gender
ORDER BY device_count DESC;

-- Health Impact Distribution Among Kids With High Screen Time
SELECT Health_Impacts, COUNT(*) AS impact_count
FROM kids_screentime
WHERE Avg_Daily_Screen_Time_hr >= 5
GROUP BY Health_Impacts
ORDER BY impact_count DESC;

-- Average Educational to Recreational Ratio by Age
SELECT Age, ROUND(AVG(Educational_to_Recreational_Ratio), 2) AS avg_edu_rec_ratio
FROM kids_screentime
GROUP BY Age
ORDER BY Age;

-- Top Devices Used Most in Urban vs. Rural Areas
SELECT Urban_or_Rural, Primary_Device, COUNT(*) AS device_use_count
FROM kids_screentime
GROUP BY Urban_or_Rural, Primary_Device
ORDER BY Urban_or_Rural, device_use_count DESC;

-- Average Screen Time Among Kids Reporting Specific Health Impacts
SELECT Health_Impacts,
   ROUND(AVG(Avg_Daily_Screen_Time_hr), 2) AS avg_screen_time
FROM kids_screentime
GROUP BY Health_Impacts
ORDER BY avg_screen_time DESC;

-- Count of Kids with No Health Impacts
SELECT COUNT(*) AS count_no_health_impact
FROM kids_screentime
WHERE Health_Impacts = 'None' OR Health_Impacts IS NULL;


