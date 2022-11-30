DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.plano(
      id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      tipo VARCHAR(100) NOT NULL,
      valor_plano DECIMAL(10,2),
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.usuario(
      id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      nome VARCHAR(100) NOT NULL,
      idade INT NOT NULL,
      plano_id INT NOT NULL,
      FOREIGN KEY (plano_id) REFERENCES plano (id),
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.historico(
      id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      cancoes_id INT NOT NULL,
      usuario_id INT NOT NULL,
      data_reproducao DATETIME NOT NULL,
      FOREIGN KEY (musica_id) REFERENCES musica (id),
      FOREIGN KEY (usuario_id) REFERENCES usuario (id),
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artista(
      id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      nome VARCHAR(100) NOT NULL,
      album_id INT NOT NULL,
      FOREIGN KEY (album_id) REFERENCES album (id),
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.seguindo_artista(
      id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      artista_id INT NOT NULL,
      usuario_id INT NOT NULL,
      FOREIGN KEY (artista_id) REFERENCES artista (id),
      FOREIGN KEY (usuario_id) REFERENCES usuario (id),
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.album(
      id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      nome VARCHAR(100) NOT NULL,
      artista_id INT NOT NULL,
      cancoes_id INT NOT NULL,
      ano_lancamento YEAR(1999) NOT NULL,
      FOREIGN KEY (artista_id) REFERENCES artista (id),
      FOREIGN KEY (cancoes_id) REFERENCES cancoes (id),
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.cancoes(
      id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
      nome VARCHAR(100) NOT NULL,
      artista_id INT NOT NULL,
      album_id INT NOT NULL,
      duracao_minutos VARCHAR(5),
      FOREIGN KEY (artista_id) REFERENCES artista (id),
      FOREIGN KEY (album_id) REFERENCES album (id),
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.tabela1 (coluna1, coluna2)
  VALUES
    ('exemplo de dados 1', 'exemplo de dados A'),
    ('exemplo de dados 2', 'exemplo de dados B'),
    ('exemplo de dados 3', 'exemplo de dados C');

  INSERT INTO SpotifyClone.tabela2 (coluna1, coluna2)
  VALUES
    ('exemplo de dados 1', 'exemplo de dados X'),
    ('exemplo de dados 2', 'exemplo de dados Y');