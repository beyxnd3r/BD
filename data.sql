INSERT INTO subscribers
(full_name, phone_number, email, registration_date, balance, status)
VALUES
('Hughie Campbell', '+79991112233', 'ue@mail.com', '2025-01-10', 500.00, 'active'),
('William Butcher', '+79994445566', 'butcher@mail.com', '2025-02-15', 150.00, 'active'),
('Mark Grayson', '+79997778899', 'mark@mail.com', '2025-03-01', 0.00, 'blocked'),
('Samatha Walkins', '+79990001122', 'samantha@mail.com', '2025-03-20', 1200.00, 'active'),
('Chloe Parker', '+79993334455', 'chloe@mail.com', '2025-04-01', 300.00, 'active');

INSERT INTO tariff_plans
(plan_name, speed_mbps, monthly_fee, traffic_limit_gb)
VALUES
('Start', 100, 400.00, 100),
('Standard', 300, 700.00, 300),dd
('Premium', 500, 1200.00, 1000);

INSERT INTO subscriber_plans
(subscriber_id, plan_id, start_date, end_date, is_active)
VALUES
(1, 1, '2025-01-10', NULL, TRUE),
(2, 2, '2025-02-15', NULL, TRUE),
(3, 1, '2025-03-01', NULL, TRUE),
(4, 3, '2025-03-20', NULL, TRUE),
(5, 2, '2025-04-01', NULL, TRUE);

INSERT INTO devices
(subscriber_id, device_name, mac_address, device_type)
VALUES
(1, 'TP-Link Router', 'AA:BB:CC:DD:EE:01', 'router'),
(2, 'iPhone 14', 'AA:BB:CC:DD:EE:02', 'phone'),
(3, 'Lenovo Laptop', 'AA:BB:CC:DD:EE:03', 'laptop'),
(4, 'Samsung Tablet', 'AA:BB:CC:DD:EE:04', 'tablet'),
(5, 'Xiaomi Router', 'AA:BB:CC:DD:EE:05', 'router');

INSERT INTO internet_sessions
(subscriber_id, device_id, session_start, session_end, traffic_used_mb)
VALUES
(1, 1, '2025-05-01 10:00', '2025-05-01 12:00', 1500),
(2, 2, '2025-05-02 09:00', '2025-05-02 11:30', 3200),
(3, 3, '2025-05-03 14:00', '2025-05-03 16:00', 800),
(4, 4, '2025-05-04 18:00', '2025-05-04 20:00', 6400),
(5, 5, '2025-05-05 08:00', '2025-05-05 09:30', 2100);

INSERT INTO payments
(subscriber_id, amount, payment_date, payment_method)
VALUES
(1, 500.00, '2025-05-01 10:00', 'card'),
(2, 700.00, '2025-05-02 11:00', 'cash'),
(3, 400.00, '2025-05-03 12:00', 'online'),
(4, 1200.00, '2025-05-04 13:00', 'card'),
(5, 700.00, '2025-05-05 14:00', 'online');

INSERT INTO traffic_alerts
(subscriber_id, alert_type, message)
VALUES
(1, 'warning', '80% of traffic limit used'),
(2, 'critical', 'Traffic limit exceeded'),
(3, 'warning', 'Low balance detected'),
(4, 'info', 'New tariff available'),
(5, 'warning', 'High internet usage');

INSERT INTO support_tickets
(subscriber_id, issue_text, status)
VALUES
(1, 'Internet speed is too low', 'open'),
(2, 'Cannot connect router', 'closed'),
(3, 'Payment not received', 'in_progress'),
(4, 'Frequent disconnects', 'open'),
(5, 'Need tariff change', 'closed');