CREATE TABLE make (
    id SERIAL,
    name VARCHAR(128) UNIQUE,
    PRIMARY KEY(id)
);

CREATE TABLE model (
  id SERIAL,
  name VARCHAR(128),
  make_id INTEGER REFERENCES make(id) ON DELETE CASCADE,
  PRIMARY KEY(id)
);

INSERT INTO make (name) VALUES ('Chevrolet');
INSERT INTO make (name) VALUES ('Toyota');

INSERT INTO model (name, make_id) VALUES ('Captiva AWD', 1);
INSERT INTO model (name, make_id) VALUES ('Captiva FWD', 1);
INSERT INTO model (name, make_id) VALUES ('Cavalier', 1);

INSERT INTO model (name, make_id) VALUES ('Camry Hybrid LE', 2);
INSERT INTO model (name, make_id) VALUES ('Camry Hybrid XLE', 2);

SELECT make.name, model.name
    FROM model
    JOIN make ON model.make_id = make.id
    ORDER BY make.name LIMIT 5;
