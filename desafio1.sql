DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.plano(
      id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      tipo VARCHAR(100) NOT NULL,
      valor_plano DECIMAL(10,2)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.usuario(
      id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      nome VARCHAR(100) NOT NULL,
      idade INT NOT NULL,
      plano_id INT NOT NULL,
      FOREIGN KEY (plano_id) REFERENCES plano (id)
  ) engine = InnoDB;
  
  CREATE TABLE SpotifyClone.artista(
      id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      nome VARCHAR(100) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.seguindo_artista(
      artista_id INT NOT NULL,
      usuario_id INT NOT NULL,
      PRIMARY KEY (usuario_id, artista_id),
      FOREIGN KEY (artista_id) REFERENCES artista (id),
      FOREIGN KEY (usuario_id) REFERENCES usuario (id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.album(
      id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      nome VARCHAR(100) NOT NULL,
      artista_id INT NOT NULL,
      ano_lancamento YEAR(4) NOT NULL,
      FOREIGN KEY (artista_id) REFERENCES artista (id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.cancoes(
      id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      nome VARCHAR(100) NOT NULL,
      artista_id INT NOT NULL,
      album_id INT NOT NULL,
      duracao_segundos INT,
      FOREIGN KEY (artista_id) REFERENCES artista (id),
      FOREIGN KEY (album_id) REFERENCES album (id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.historico(
      cancoes_id INT NOT NULL,
      usuario_id INT NOT NULL,
      data_reproducao DATETIME NOT NULL,
      PRIMARY KEY (usuario_id, cancoes_id),
      FOREIGN KEY (cancoes_id) REFERENCES cancoes (id),
      FOREIGN KEY (usuario_id) REFERENCES usuario (id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.plano (tipo, valor_plano)
VALUES
  ('gratuito', '0.00'),
  ('familiar', '7.99'),
  ('universitário', '5.99'),
  ('pessoal', '6.99');

  INSERT INTO SpotifyClone.usuario (nome, idade, plano_id)
VALUES
  ('Barbara Liskov', '82', '1'),
  ('Robert Cecil Martin', '58', '1'),
  ('Ada Lovelace', '37', '2'),
  ('Martin Fowler', '46', '2'),
  ('Sandi Metz', '58', '2'),
  ('Paulo Freire', '19', '3'),
  ('Bell Hooks', '26', '3'),
  ('Christopher Alexander', '85', '4'),
  ('Judith Butler', '45', '4'),
  ('Jorge Amado', '58', '4');

   INSERT INTO SpotifyClone.artista (nome)
VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');

  INSERT INTO SpotifyClone.album (nome, artista_id, ano_lancamento)
VALUES
  ('Renaissance', '1', '2022' ),
  ('Jazz', '2', '1978' ),
  ('Hot Space', '2', '1982' ),
  ('Falso Brilhante', '3', '1998' ),
  ('Vento de Maio', '3', '2001' ),
  ('QVVJFA?', '4', '2003' ),
  ('Somewhere Far Beyond', '5', '2007' ),
  ('I Put A Spell On You', '6', '2012' );

  INSERT INTO SpotifyClone.cancoes (nome, artista_id, album_id, duracao_segundos)
VALUES
  ('Break My Soul', '1', '1', '279'),
  ('Virgos’s Groove', '1', '1', '369'),
  ('Alien Superstar', '1', '1', '116'),
  ('Don’t Stop Me Now', '2', '2', '203'),
  ('Under Pressure', '2', '3', '152'),
  ('Como Nossos Pais', '3', '4', '105'),
  ('O Medo de Amar é o Medo de Ser Livre', '3', '5', '207'),
  ('Samba em Paris', '4', '6', '267'),
  ('The Bard’s Song', '5', '7', '244'),
  ('Feeling Good', '6', '8', '100');

   INSERT INTO SpotifyClone.historico (cancoes_id, usuario_id, data_reproducao)
VALUES
  ('8', '1', '2022-02-28 10:45:55'),
  ('2', '1', '2020-05-02 05:30:35'),
  ('10', '1', '2020-03-06 11:22:33'),
  ('10', '2', '2022-08-05 08:05:17'),
  ('7', '2', '2020-01-02 07:40:33'),
  ('10', '3', '2020-11-13 16:55:13'),
  ('2', '3', '2020-12-05 18:38:30'),
  ('8', '4', '2021-08-15 17:10:10'),
  ('8', '5', '2022-01-09 01:44:33'),
  ('5', '5', '2020-08-06 15:23:43'),
  ('7', '6', '2017-01-24 00:31:17'),
  ('1', '6', '2017-10-12 12:35:20'),
  ('4', '7', '2011-12-15 22:30:49'),
  ('4', '8', '2012-03-17 14:56:41'),
  ('9', '9', '2022-02-24 21:14:22'),
  ('3', '10', '2015-12-13 08:30:22');

  INSERT INTO SpotifyClone.seguindo_artista (artista_id, usuario_id)
VALUES
  ('1', '1'),
  ('2', '1'),
  ('3', '1'),
  ('1', '2'),
  ('3', '2'),
  ('2', '3'),
  ('4', '4'),
  ('5', '5'),
  ('6', '5'),
  ('6', '6'),
  ('1', '6'),
  ('6', '7'),
  ('3', '9'),
  ('2', '10');