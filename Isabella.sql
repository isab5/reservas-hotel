CREATE DATABASE reservahotel;

CREATE TABLE hospedes (
id_hospede SERIAL PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
telefone BIGINT NOT NULL,
email VARCHAR(200) NOT NULL
);

CREATE TABLE quartos (
id_quarto SERIAL PRIMARY KEY,
numero_quarto INT NOT NULL,
valor_diaria DECIMAL(8,2) NOT NULL
);

CREATE TABLE reservas (
id_reserva SERIAL PRIMARY KEY,
id_hospede INT NOT NULL,
id_quarto INT NOT NULL, 
data_entrada DATE NOT NULL,
data_saida DATE NOT NULL,
reserva_ativa BOOLEAN NOT NULL,
CONSTRAINT fk_hospede FOREIGN KEY (id_hospede) REFERENCES hospedes(id_hospede),
CONSTRAINT fk_quarto FOREIGN KEY (id_quarto) REFERENCES quartos(id_quarto)
);

INSERT INTO hospedes (nome, telefone, email)
VALUES 
('Ana Beatriz', 19988667745, 'patenha@gmail.com'),
('Pedro Ulisses', 11998765432, 'galaodeagua@gmail.com'),
('João Othavio', 19996435902, 'jojo@gmail.com'),
('Isabel Mamede', 19904566732, 'bebel@gmail.com'),
('Eduardo Schneider', 48954795638, 'dududomal@gmail.com');

SELECT * FROM hospedes;

INSERT INTO quartos (numero_quarto, valor_diaria)
VALUES 
(103, 499.99),
(302, 659.90),
(810, 1120.59),
(505, 595.90),
(1504, 2500.00);

SELECT * FROM quartos;

INSERT INTO reservas (id_hospede, id_quarto, data_entrada, data_saida, reserva_ativa)
VALUES
(1, 5, '2024-11-05', '2024-11-15', 'true'),
(2, 1, '2024-10-03', '2024-10-09', 'false'),
(3, 2, '2024-11-05', '2024-11-10', 'true'),
(4, 4, '2024-10-31', '2024-11-04', 'false'),
(5, 3, '2024-11-01', '2024-11-10', 'true');

SELECT * FROM reservas;

SELECT r.id_reserva, h.nome AS hospede, q.numero_quarto AS quarto, r.data_entrada, r.data_saida
FROM reservas r
INNER JOIN hospedes h ON r.id_hospede = h.id_hospede
INNER JOIN quartos q ON  r.id_quarto = q.id_quarto
WHERE r.data_saida < CURRENT_DATE;

SELECT r.id_reserva, h.nome AS hospede, q.numero_quarto AS quarto, r.data_entrada, r.data_saida
FROM reservas r
INNER JOIN hospedes h ON r.id_hospede = h.id_hospede
INNER JOIN quartos q ON  r.id_quarto = q.id_quarto;

SELECT r.id_reserva, q.numero_quarto AS quarto_sem_reserva
FROM reservas r
JOIN quartos q ON r.id_quarto = q.id_quarto
WHERE r.data_saida < CURRENT_DATE;

-- ou --

SELECT r.id_reserva, q.numero_quarto AS quarto_sem_reserva, r.reserva_ativa
FROM reservas r
JOIN quartos q ON r.id_quarto = q.id_quarto 
WHERE r.reserva_ativa = false; 