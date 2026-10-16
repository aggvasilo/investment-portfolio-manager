-- Create a new user
INSERT INTO users (username, email)
VALUES ('angelos', 'angelos@example.com');

-- Create a portfolio
INSERT INTO portfolios (user_id, portfolio_name)
VALUES (1, 'Growth Portfolio');

-- Add an asset
INSERT INTO assets (ticker, asset_name, asset_type)
VALUES ('MSFT', 'Microsoft Corporation', 'Stock');

-- Record a purchase transaction
INSERT INTO transactions (
    portfolio_id,
    asset_id,
    transaction_type,
    quantity,
    price,
    transaction_date
)
VALUES (
    1,
    1,
    'BUY',
    10,
    500,
    '2026-10-13'
);

-- View all assets
SELECT *
FROM assets;

-- View portfolio holdings
SELECT
    a.ticker,
    a.asset_name,
    h.quantity,
    h.average_cost
FROM holdings h
JOIN assets a
ON h.asset_id = a.id;

-- View transaction history
SELECT
    transaction_type,
    quantity,
    price,
    transaction_date
FROM transactions
ORDER BY transaction_date DESC;

-- Calculate portfolio cost value
SELECT
    SUM(quantity * average_cost) AS portfolio_value
FROM holdings;

-- Find a specific asset
SELECT *
FROM assets
WHERE ticker = 'MSFT';

-- Update a portfolio name
UPDATE portfolios
SET portfolio_name = 'Long Term Portfolio'
WHERE id = 1;

-- Remove an asset transaction
DELETE FROM transactions
WHERE id = 1;
