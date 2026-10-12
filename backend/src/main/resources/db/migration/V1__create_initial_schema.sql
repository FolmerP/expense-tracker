CREATE TABLE categories (
    id              BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name            TEXT NOT NULL UNIQUE,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE transactions (
    id                  BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    booking_date        DATE NOT NULL,
    description         TEXT NOT NULL,
    amount_dkk_ore      BIGINT NOT NULL,
    original_amount     BIGINT,
    original_currency   CHAR(3),
    category_id         BIGINT REFERENCES categories(id),
    created_at          TIMESTAMPTZ NOT NULL DEFAULT now()

    CONSTRAINT original_amount_and_currency_together
        CHECK ((original_amount IS NULL) = (original_currency IS NULL))
);

CREATE INDEX idx_transactions_booking_date ON transactions (booking_date);
CREATE INDEX idx_transactions_category_id  ON transactions (category_id);

CREATE TABLE budgets (
    id                  BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    category_id         BIGINT      NOT NULL UNIQUE REFERENCES categories (id),
    monthly_limit_ore   BIGINT      NOT NULL CHECK (monthly_limit_ore > 0),
    created_at          TIMESTAMPTZ NOT NULL DEFAULT now()
);