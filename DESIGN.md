# Design Document

By Angelos Vasilopoulos

Video overview: <https://youtube.com/shorts/vqZ2d-41AnU?is=CTnrgJpSZ9JfOHcw>

# Investment Portfolio Manager

## Scope

The purpose of this database is to provide a structured system for managing investment portfolios. The database allows users to create portfolios, store investment assets, record transactions, and monitor portfolio holdings over time.

The scope of the database includes users, portfolios, assets, holdings, and transactions. The database is intended to represent the core data required for portfolio management and investment tracking.

The database does not include real-time market data, dividend tracking, tax reporting, foreign exchange calculations, options trading, cryptocurrency wallets, or automated brokerage integrations. These features are considered outside the scope of this project.

## Functional Requirements

The database must allow users to:

- Create investment portfolios.
- Store financial assets such as stocks and ETFs.
- Record buy and sell transactions.
- Track asset quantities and average acquisition costs.
- Retrieve portfolio holdings.
- Query transaction history.
- Calculate portfolio values using stored cost information.

The database is not designed to provide investment advice, perform automatic trades, calculate taxes, or retrieve live market prices.

## Representation

### Entities

The database includes the following entities:

#### Users

The `users` table represents investors using the application.

Attributes:

- `id`
- `username`
- `email`

The `id` column serves as the primary key. The `username` and `email` columns are defined as unique values to prevent duplicate records.

#### Portfolios

The `portfolios` table represents investment portfolios owned by users.

Attributes:

- `id`
- `user_id`
- `portfolio_name`

The `user_id` column is a foreign key that references the `users` table.

#### Assets

The `assets` table stores information about financial securities.
Attributes:

- `id`
- `ticker`
- `asset_name`
- `asset_type`

Examples include stocks and ETFs.

`ticker` is defined as UNIQUE because each security should appear only once in the database.

#### Holdings

The `holdings` table stores current investment positions.

Attributes:

- `id`
- `portfolio_id`
- `asset_id`
- `quantity`
- `average_cost`

The table connects portfolios with assets and records how many units of an asset are currently owned.

#### Transactions

The `transactions` table stores investment activity.

Attributes:

- `id`
- `portfolio_id`
- `asset_id`
- `transaction_type`
- `quantity`
- `price`
- `transaction_date`

Transaction types include BUY and SELL operations.

INTEGER was selected for keys because identifiers are numeric values and support efficient indexing.

TEXT was selected for descriptive information such as usernames, ticker symbols, asset names, and transaction categories.

REAL was selected for quantities and prices because investment data often requires decimal precision.

Primary keys provide entity integrity.

Foreign keys provide referential integrity between related entities.

UNIQUE constraints prevent duplicate usernames, emails, and ticker symbols.

### Relationships

The database implements the following relationships:

- One user can own multiple portfolios.
- One portfolio belongs to one user.
- One portfolio can contain multiple holdings.
- One asset can appear in multiple holdings.
- One portfolio can contain multiple transactions.
- One asset can be referenced in multiple transactions.

Entity Relationship Diagram:
users ||--o{ portfolios : owns
portfolios ||--o{ holdings : contains
assets ||--o{ holdings : stored_in
portfolios ||--o{ transactions : records
assets ||--o{ transactions : traded
