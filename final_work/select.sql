SELECT 
	CONCAT(firstname, ' ', lastname) AS user_name,
    IF(gender = 'w', 'Жен', IF(gender = 'm', 'Муж', 'NULL')) AS if_gender,
	birthdate,
	TIMESTAMPDIFF(YEAR, birthdate, NOW()) AS year
FROM online_store.profile
HAVING `year` BETWEEN '20' AND '25';

--
SELECT 
    lastname,
    firstname,
    gender,
    birthdate,
    address,
    (SELECT COUNT(*) FROM online_store.order WHERE user_id = profile.user_id) AS orders
FROM online_store.profile
WHERE address LIKE '%Москва%' AND gender = 'w'
ORDER BY lastname;

--
SELECT 
firstname,
lastname,
gender,
birthdate,
address,
`order`.id AS order_number,
`name` AS order_status,
`order`.created_at,
total_cost
FROM online_store.order
JOIN `statuse` ON `statuse`.id = statuse_id
LEFT JOIN `profile` ON `profile`.user_id = `order`.user_id;
