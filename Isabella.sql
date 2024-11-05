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
CONSTRAINT fk_hospede FOREIGN KEY (id_hospede) REFERENCES hospedes(id_hospede),
CONSTRAINT fk_quarto FOREIGN KEY (id_quarto) REFERENCES quartos(id_quarto)
);