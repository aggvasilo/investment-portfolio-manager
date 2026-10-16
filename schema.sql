-- Store application users
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    username TEXT NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE
);

-- Store user portfolios
CREATE TABLE portfolios (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    portfolio_name TEXT NOT NULL,
    FOREIGN KEY (user_id)
        REFERENCES users(id)
);

-- Store financial assets
CREATE TABLE assets (
    id INTEGER PRIMARY KEY,
    ticker TEXT NOT NULL UNIQUE,
    asset_name TEXT NOT NULL,
    asset_type TEXT NOT NULL
);

-- Store portfolio holdings
CREATE TABLE holdings (
    id INTEGER PRIMARY KEY,
    portfolio_id INTEGER NOT NULL,
    asset_id INTEGER NOT NULL,
    quantity REAL NOT NULL,
    average_cost REAL NOT NULL,
    FOREIGN KEY (portfolio_id)
        REFERENCES portfolios(id),
    FOREIGN KEY (asset_id)
        REFERENCES assets(id)
);

-- Store transactions
CREATE TABLE transactions (
    id INTEGER PRIMARY KEY,
    portfolio_id INTEGER NOT NULL,
    asset_id INTEGER NOT NULL,
    transaction_type TEXT NOT NULL,
    quantity REAL NOT NULL,
    price REAL NOT NULL,
    transaction_date DATE NOT NULL,
    FOREIGN KEY (portfolio_id)
        REFERENCES portfolios(id),
    FOREIGN KEY (asset_id)
        REFERENCES assets(id)
);

CREATE INDEX idx_ticker
ON assets(ticker);

CREATE INDEX idx_holdings_portfolio
ON holdings(portfolio_id);

CREATE INDEX idx_transactions_portfolio
ON transactions(portfolio_id);
