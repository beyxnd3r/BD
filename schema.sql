CREATE TABLE subscribers (
    subscriber_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    registration_date DATE DEFAULT CURRENT_DATE,
    balance NUMERIC(10,2) CHECK (balance >= 0),
    status VARCHAR(20)
        CHECK (status IN ('active', 'blocked'))
);

CREATE TABLE tariff_plans (
    plan_id SERIAL PRIMARY KEY,
    plan_name VARCHAR(50) UNIQUE NOT NULL,
    speed_mbps INT CHECK (speed_mbps > 0),
    monthly_fee NUMERIC(10,2) CHECK (monthly_fee >= 0),
    traffic_limit_gb INT CHECK (traffic_limit_gb >= 0)
);

CREATE TABLE subscriber_plans (
    subscription_id SERIAL PRIMARY KEY,
    subscriber_id INT REFERENCES subscribers(subscriber_id),
    plan_id INT REFERENCES tariff_plans(plan_id),
    start_date DATE NOT NULL,
    end_date DATE,
    is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE devices (
    device_id SERIAL PRIMARY KEY,
    subscriber_id INT REFERENCES subscribers(subscriber_id),
    device_name VARCHAR(100) NOT NULL,
    mac_address VARCHAR(50) UNIQUE NOT NULL,
    device_type VARCHAR(50)
        CHECK (device_type IN ('router', 'phone', 'laptop', 'tablet'))
);

CREATE TABLE internet_sessions (
    session_id SERIAL PRIMARY KEY,
    subscriber_id INT REFERENCES subscribers(subscriber_id),
    device_id INT REFERENCES devices(device_id),
    session_start TIMESTAMP NOT NULL,
    session_end TIMESTAMP,
    traffic_used_mb BIGINT CHECK (traffic_used_mb >= 0)
);

CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    subscriber_id INT REFERENCES subscribers(subscriber_id),
    amount NUMERIC(10,2) CHECK (amount > 0),
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(30)
);

CREATE TABLE traffic_alerts (
    alert_id SERIAL PRIMARY KEY,
    subscriber_id INT REFERENCES subscribers(subscriber_id),
    alert_type VARCHAR(30),
    message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE support_tickets (
    ticket_id SERIAL PRIMARY KEY,
    subscriber_id INT REFERENCES subscribers(subscriber_id),
    issue_text TEXT NOT NULL,
    status VARCHAR(20)
        CHECK (status IN ('open', 'closed', 'in_progress')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_subscribers_phone
ON subscribers(phone_number);

CREATE INDEX idx_sessions_subscriber
ON internet_sessions(subscriber_id);

CREATE INDEX idx_payments_subscriber
ON payments(subscriber_id);