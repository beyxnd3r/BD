-- 1. Вывести всех абонентов
SELECT * FROM subscribers;

-- 2. Вывести все тарифные планы
SELECT * FROM tariff_plans;

-- 3. Вывести все устройства
SELECT * FROM devices;

-- 4. Абоненты с балансом меньше 500
SELECT *
FROM subscribers
WHERE balance < 500;

-- 5. Открытые обращения в поддержку
SELECT *
FROM support_tickets
WHERE status = 'open';

-- 6. JOIN: абоненты и их тарифы
SELECT s.full_name,
       t.plan_name
FROM subscribers s
JOIN subscriber_plans sp
ON s.subscriber_id = sp.subscriber_id
JOIN tariff_plans t
ON sp.plan_id = t.plan_id;

-- 7. JOIN: интернет-сессии и устройства
SELECT s.full_name,
       d.device_name,
       i.traffic_used_mb
FROM internet_sessions i
JOIN subscribers s
ON i.subscriber_id = s.subscriber_id
JOIN devices d
ON i.device_id = d.device_id;

-- 8. GROUP BY: общий трафик каждого абонента
SELECT subscriber_id,
       SUM(traffic_used_mb) AS total_traffic
FROM internet_sessions
GROUP BY subscriber_id;

-- 9. HAVING: абоненты с трафиком больше 2000 МБ
SELECT subscriber_id,
       SUM(traffic_used_mb) AS total_traffic
FROM internet_sessions
GROUP BY subscriber_id
HAVING SUM(traffic_used_mb) > 2000;

-- 10. CTE + ORDER BY + LIMIT
WITH traffic_stats AS (
    SELECT subscriber_id,
           SUM(traffic_used_mb) AS total_traffic
    FROM internet_sessions
    GROUP BY subscriber_id
)
SELECT *
FROM traffic_stats
ORDER BY total_traffic DESC
LIMIT 3;