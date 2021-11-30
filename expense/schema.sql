CREATE TABLE expenses (
	id int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	amount numeric(6, 2) NOT NULL CHECK (amount > 0),
	memo text NOT NULL,
	created_on date NOT NULL DEFAULT CURRENT_DATE
);