DROP SCHEMA IF EXISTS `SpotifyClone`;

CREATE DATABASE IF NOT EXISTS `SpotifyClone`;

USE `SpotifyClone`;

CREATE TABLE `plan`(
    `id_plan` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `type` VARCHAR(50) NOT NULL,
    `value` DECIMAL(3, 2) NOT NULL
);

CREATE TABLE `user`(
    `id_user` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `age` INT NOT NULL,
    `signature_date` DATE NOT NULL,
    `id_plan` INT NOT NULL,
    FOREIGN KEY (`id_plan`) REFERENCES `SpotifyClone`.`plan` (`id_plan`)
);

CREATE TABLE `artist`(
    `id_artist` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL
);

CREATE TABLE `following_artist`(
    `id_user` INT NOT NULL,
    `id_artist` INT NOT NULL,
    PRIMARY KEY (`id_user`, `id_artist`),
    FOREIGN KEY (`id_user`) REFERENCES `SpotifyClone`.`user` (`id_user`),
    FOREIGN KEY (`id_artist`) REFERENCES `SpotifyClone`.`artist` (`id_artist`)
);

CREATE TABLE `album`(
    `id_album` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `release_date` YEAR NOT NULL,
    `id_artist` INT NOT NULL,
    FOREIGN KEY (`id_artist`) REFERENCES `SpotifyClone`.`artist` (`id_artist`)
);

CREATE TABLE `songs`(
    `id_song` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `duration_time` INT NOT NULL,
    `id_album` INT NOT NULL,
    `id_artist` INT NOT NULL,
    FOREIGN KEY (`id_album`) REFERENCES `SpotifyClone`.`album` (`id_album`),
    FOREIGN KEY (`id_artist`) REFERENCES `SpotifyClone`.`artist` (`id_artist`)
);

CREATE TABLE `history`(
    `reproduction_date` DATETIME NOT NULL,
    `id_song` INT NOT NULL,
    `id_user` INT NOT NULL,
    PRIMARY KEY (`id_user`, `id_song`),
    FOREIGN KEY (`id_song`) REFERENCES `SpotifyClone`.`songs` (`id_song`),
    FOREIGN KEY (`id_user`) REFERENCES `SpotifyClone`.`user` (`id_user`)
);

INSERT INTO
    `SpotifyClone`.`plan` (`type`, `value`)
VALUES
    ('gratuito', '0.00'),
    ('familiar', '7.99'),
    ('universitário', '5.99'),
    ('pessoal', '6.99');

INSERT INTO
    `SpotifyClone`.`user` (`name`, `age`, `signature_date`, `id_plan`)
VALUES
    ('Barbara Liskov', 82, '2019-10-20', 1),
    ('Robert Cecil Martin', 58, '2017-01-06', 1),
    ('Ada Lovelace', 37, '2017-12-30', 2),
    ('Martin Fowler', 46, '2017-01-17', 2),
    ('Sandi Metz', 58, '2018-04-29', 2),
    ('Paulo Freire', 19, '2018-02-14', 3),
    ('Bell Hooks', 26, '2018-01-05', 3),
    ('Christopher Alexander', 85, '2019-06-05', 4),
    ('Judith Butler', 45, '2020-05-13', 4),
    ('Jorge Amado', 58, '2017-02-17', 4);

INSERT INTO
    `SpotifyClone`.`artist` (`name`)
VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

INSERT INTO
    `SpotifyClone`.`following_artist` (`id_user`, `id_artist`)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 1),
    (6, 6),
    (7, 6),
    (9, 3),
    (10, 2);

INSERT INTO
    `SpotifyClone`.`album` (`name`, `release_date`, `id_artist`)
VALUES
    ('Renaissance', 2022, 1),
    ('Jazz', 1978, 2),
    ('Hot Space', 1982, 2),
    ('Falso Brilhante', 1998, 3),
    ('Vento de Maio', 2001, 3),
    ('QVVJFA?', 2003, 4),
    ('Somewhere Far Beyond', 2007, 5),
    ('I Put A Spell On You', 2012, 6);

INSERT INTO
    `SpotifyClone`.`songs` (`name`, `duration_time`, `id_album`, `id_artist`)
VALUES
    ('BREAK MY SOUL', 279, 1, 1),
    ('VIRGO’S GROOVE', 369, 1, 1),
    ('ALIEN SUPERSTAR', 116, 1, 1),
    ('Don’t Stop Me Now', 203, 2, 2),
    ('Under Pressure', 152, 3, 2),
    ('Como Nossos Pais', 105, 4, 3),
    (
        'O Medo de Amar é o Medo de Ser Livre',
        207,
        5,
        3
    ),
    ('Samba em Paris', 267, 6, 4),
    ('The Bard’s Song', 244, 7, 5),
    ('Feeling Good', 100, 8, 6);

INSERT INTO
    `SpotifyClone`.`history` (`reproduction_date`, `id_song`, `id_user`)
VALUES
    ('2022-02-28 10:45:55', 8, 1),
    ('2020-05-02 05:30:35', 2, 1),
    ('2020-03-06 11:22:33', 10, 1),
    ('2022-08-05 08:05:17', 10, 2),
    ('2020-01-02 07:40:33', 7, 2),
    ('2020-11-13 16:55:13', 10, 3),
    ('2020-01-02 07:40:33', 2, 3),
    ('2021-08-15 17:10:10', 8, 4),
    ('2022-01-09 01:44:33', 8, 5),
    ('2020-08-06 15:23:43', 5, 5),
    ('2017-01-24 00:31:17', 7, 6),
    ('2017-10-12 12:35:20', 1, 6),
    ('2011-12-15 22:30:49', 4, 7),
    ('2012-03-17 14:56:41', 4, 8),
    ('2022-02-24 21:14:22', 9, 9),
    ('2015-12-13 08:30:22', 3, 10);