-- Day 17_( Partition By clause)

--  Determine the total number of followers gained and the average engagement rate by each influencer across different social media platforms and countries
SELECT 
	influencer_name, 
    social_media_platform, 
    country, 
    followers_count, 
    engagement_rate,
	SUM(followers_count) OVER (PARTITION BY influencer_name, social_media_platform) AS total_followers_per_platform,
	AVG(engagement_rate) OVER (PARTITION BY influencer_name, country) AS avg_engagement_rate_per_country
FROM 
	influencer_followers;
   
-- Calculate the average performance rating of athletes within each sport category and country 
SELECT 
	sport_category, 
	country, 
	athlete_name, 
	Performance_rating,
	AVG(performance_rating) OVER (PARTITION BY sport_category, country) AS avg_performance_rating_per_country
FROM 
	athlete_performance;


-- Analyze the average number of new technology products launched and the maximum launch date by each company within the tech industry 
SELECT 
	company_name, 
	product_name, 
	launch_date,
	AVG(COUNT(product_name)) OVER (PARTITION BY company_name) AS avg_tech_products_launched,
	MAX(launch_date) OVER (PARTITION BY company_name) AS latest_launch_date
FROM 
	tech_products;