-- MySQL Script generated by MySQL Workbench
-- Sat Jun  1 12:23:00 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema projeto
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema projeto
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `projeto` ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`genero` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;

insert into genero (codigo, nome) values 
(1, 'Action|Comedy|Sci-Fi'),
(2, 'Suspense'),
(3, 'Horror|Sci-Fi'),
(4, 'Comedy'),
(5, 'Drama');

-- -----------------------------------------------------
-- Table `mydb`.`editora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`editora` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `cidade` VARCHAR(255) NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;

insert into editora (codigo, nome, cidade) values 
(1, 'Iteris, Inc.', 'Nyimba'),
(2, 'Alliance Resource Partners, L.P.', 'Aourir'),
(3, 'Ceragon Networks Ltd.', 'Căuşeni');


-- -----------------------------------------------------
-- Table `mydb`.`autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`autor` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;

insert into autor (codigo, nome) values 
(1, 'Sara Beton'),
(2, 'Akim Jannasch'),
(3, 'Amery Minithorpe'),
(4, 'Mickie Westcot'),
(5, 'Dorthy Krinks'),
(6, 'Findley Dowson'),
(7, 'Brooke Meeking'),
(8, 'Grete Milmith'),
(9, 'Lorilyn McNeish'),
(10, 'Cecil Odam'),
(11, 'Glenden Shermar'),
(12, 'Fiorenze Rearden'),
(13, 'Moritz Fallon'),
(14, 'Chlo Woodrough'),
(15, 'Corney Comer');

-- -----------------------------------------------------
-- Table `projeto`.`livro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto`.`livro` (
  `isbn` VARCHAR(45) NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `edicao` INT NULL,
  `quantidade` INT NOT NULL,
  `autor_codigo` INT NOT NULL,
  `editora_codigo` INT NOT NULL,
  `genero_codigo` INT NOT NULL,
  PRIMARY KEY (`isbn`),
  INDEX `fk_livro_autor_idx` (`autor_codigo` ASC) VISIBLE,
  INDEX `fk_livro_editora1_idx` (`editora_codigo` ASC) VISIBLE,
  INDEX `fk_livro_genero1_idx` (`genero_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_livro_autor`
    FOREIGN KEY (`autor_codigo`)
    REFERENCES `mydb`.`autor` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_livro_editora1`
    FOREIGN KEY (`editora_codigo`)
    REFERENCES `mydb`.`editora` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_livro_genero1`
    FOREIGN KEY (`genero_codigo`)
    REFERENCES `mydb`.`genero` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

insert into livro (isbn, titulo, edicao, quantidade, autor_codigo, editora_codigo, genero_codigo) values 
('839409050-8', 'Nightmaster (Watch the Shadows Dance)', 6, 6, 2, 1, 2),
('735668789-5', 'Devil''s Own, The', 4, 11, 1, 1, 1),
('015892118-6', 'Machine, The', 5, 16, 11, 2, 5),
('660075361-7', 'Divorce, Le', 8, 5, 9, 3, 1),
('432136518-X', 'Turistas', 2, 12, 10, 2, 4),
('931767911-0', 'Great War, The (Grande guerra, La)', 9, 10, 9, 2, 5),
('159461711-2', 'Nancy Goes to Rio', 8, 4, 3, 3, 2),
('955533843-4', 'Romasanta: The Werewolf Hunt', 3, 12, 7, 1, 5),
('331421450-2', 'Gnomeo & Juliet', 6, 14, 14, 1, 5),
('402963045-6', 'The Miracle of Our Lady of Fatima', 3, 2, 12, 3, 5),
('496875166-4', 'Katie Tippel (Keetje Tippel)', 9, 4, 12, 1, 3),
('373776246-5', 'Winged Migration (Peuple migrateur, Le)', 4, 10, 9, 2, 4),
('984782817-2', 'I Am Number Four', 9, 17, 8, 1, 4),
('250336557-4', 'Kagemusha', 9, 14, 1, 2, 3),
('868365772-8', 'Schlussmacher', 4, 14, 10, 2, 2),
('505768704-2', 'Parents', 1, 8, 1, 3, 4),
('883849248-4', 'Princess Diaries, The', 9, 11, 13, 2, 4),
('120132983-3', 'Sorcerer', 8, 1, 11, 2, 1),
('478597316-1', 'Blue Is the Warmest Color (La vie d''Adèle)', 3, 10, 13, 2, 3),
('313699194-X', 'Crippled Masters (Tian can di que)', 1, 12, 7, 3, 4),
('033238369-5', 'Texas Chainsaw Massacre: The Next Generation (a.k.a. The Return of the Texas Chainsaw Massacre)', 7, 9, 13, 1, 5),
('810569798-X', 'Godzilla and Mothra: The Battle for Earth (Gojira vs. Mosura)', 6, 4, 9, 3, 5),
('909986323-3', 'Adventures of Huckleberry Finn, The', 7, 20, 6, 1, 1),
('066732098-9', 'Dragon Hunter', 6, 16, 1, 3, 3),
('609561509-7', 'Great Directors', 4, 3, 15, 2, 1),
('259947992-4', 'Stars Look Down, The', 9, 20, 9, 1, 3),
('744932801-1', 'Merchants of Doubt', 9, 4, 13, 1, 2),
('030588153-1', 'Diamond Dogs', 2, 19, 11, 3, 3),
('567270190-6', 'Welcome to the Jungle', 4, 5, 9, 1, 2),
('689457680-7', 'Saint in London, The', 9, 10, 12, 3, 1),
('440769776-8', 'Good News', 9, 13, 8, 2, 1),
('131857613-X', 'Inspector Gadget', 7, 8, 4, 1, 1),
('151517742-4', 'Mrs. Parkington', 2, 5, 6, 3, 4),
('290414967-8', 'Dread', 3, 14, 8, 2, 3),
('078942931-4', 'White Irish Drinkers', 4, 6, 15, 2, 2),
('051076394-4', 'Presenting Lily Mars', 2, 15, 11, 1, 2),
('123568200-5', 'Turtle Diary', 8, 1, 15, 2, 2),
('473711174-0', 'Tokio Baby', 5, 12, 11, 3, 1),
('720962490-2', 'Carne de gallina (Chicken Skin)', 4, 5, 2, 3, 4),
('218671103-6', 'Deadly Tower, The', 6, 3, 4, 3, 4),
('903508380-6', 'R', 4, 12, 4, 3, 4),
('558515616-0', 'Making Mr. Right', 8, 8, 3, 3, 3),
('051678629-6', 'Cabinet of Caligari, The', 1, 15, 8, 1, 4),
('357394720-4', 'Max Manus', 8, 17, 7, 3, 3),
('666870411-5', 'Kentucky Fried Movie, The', 3, 3, 5, 3, 2),
('384054092-5', 'Confidentially Yours (Vivement dimanche!)', 5, 2, 9, 3, 2),
('989034842-X', 'Paid', 6, 8, 5, 2, 4),
('161584905-X', 'Love Simple', 7, 8, 6, 1, 2),
('233236834-5', 'Robin Hood: Men in Tights', 9, 16, 3, 1, 4),
('473220461-9', 'Indian Summer', 1, 13, 2, 3, 1);




-- -----------------------------------------------------
-- Table `mydb`.`exemplar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`exemplar` (
  `livro_isbn` VARCHAR(45) NOT NULL,
  `codigo` INT NOT NULL,
  `status` ENUM('0', '1') NOT NULL,
  PRIMARY KEY (`livro_isbn`, `codigo`),
  INDEX `fk_exemplar_livro1_idx` (`livro_isbn` ASC) VISIBLE,
  CONSTRAINT `fk_exemplar_livro1`
    FOREIGN KEY (`livro_isbn`)
    REFERENCES `projeto`.`livro` (`isbn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO exemplar (livro_isbn, codigo, status) VALUES
('839409050-8', 1, 0),
('839409050-8', 2, 0),
('839409050-8', 3, 0),
('839409050-8', 4, 0),
('839409050-8', 5, 0),
('839409050-8', 6, 0),
('735668789-5', 7, 0),
('735668789-5', 8, 0),
('735668789-5', 9, 0),
('735668789-5', 10, 0),
('015892118-6', 11, 0),
('015892118-6', 12, 0),
('015892118-6', 13, 0),
('015892118-6', 14, 0),
('015892118-6', 15, 0),
('660075361-7', 16, 0),
('660075361-7', 17, 0),
('660075361-7', 18, 0),
('660075361-7', 19, 0),
('660075361-7', 20, 0),
('660075361-7', 21, 0),
('660075361-7', 22, 0),
('660075361-7', 23, 0),
('432136518-X', 24, 0),
('432136518-X', 25, 0),
('931767911-0', 26, 0),
('931767911-0', 27, 0),
('931767911-0', 28, 0),
('931767911-0', 29, 0),
('931767911-0', 30, 0),
('931767911-0', 31, 0),
('931767911-0', 32, 0),
('931767911-0', 33, 0),
('931767911-0', 34, 0),
('159461711-2', 35, 0),
('159461711-2', 36, 0),
('159461711-2', 37, 0),
('159461711-2', 38, 0),
('159461711-2', 39, 0),
('159461711-2', 40, 0),
('159461711-2', 41, 0),
('159461711-2', 42, 0),
('955533843-4', 43, 0),
('955533843-4', 44, 0),
('955533843-4', 45, 0),
('331421450-2', 46, 0),
('331421450-2', 47, 0),
('331421450-2', 48, 0),
('331421450-2', 49, 0),
('331421450-2', 50, 0),
('331421450-2', 51, 0),
('402963045-6', 52, 0),
('402963045-6', 53, 0),
('402963045-6', 54, 0),
('496875166-4', 55, 0),
('496875166-4', 56, 0),
('496875166-4', 57, 0),
('373776246-5', 58, 0),
('373776246-5', 59, 0),
('373776246-5', 60, 0),
('373776246-5', 61, 0),
('984782817-2', 62, 0),
('984782817-2', 63, 0),
('984782817-2', 64, 0),
('984782817-2', 65, 0),
('984782817-2', 66, 0),
('984782817-2', 67, 0),
('984782817-2', 68, 0),
('984782817-2', 69, 0),
('984782817-2', 70, 0),
('250336557-4', 71, 0),
('250336557-4', 72, 0),
('250336557-4', 73, 0),
('250336557-4', 74, 0),
('250336557-4', 75, 0),
('250336557-4', 76, 0),
('250336557-4', 77, 0),
('250336557-4', 78, 0),
('250336557-4', 79, 0),
('868365772-8', 80, 0),
('868365772-8', 81, 0),
('868365772-8', 82, 0),
('868365772-8', 83, 0),
('505768704-2', 84, 0),
('883849248-4', 85, 0),
('883849248-4', 86, 0),
('883849248-4', 87, 0),
('883849248-4', 88, 0),
('120132983-3', 89, 0),
('120132983-3', 90, 0),
('478597316-1', 91, 0),
('478597316-1', 92, 0),
('478597316-1', 93, 0),
('313699194-X', 94, 0),
('033238369-5', 95, 0),
('033238369-5', 96, 0),
('033238369-5', 97, 0),
('033238369-5', 98, 0),
('033238369-5', 99, 0),
('033238369-5', 100, 0),
('033238369-5', 101, 0),
('810569798-X', 102, 0),
('810569798-X', 103, 0),
('810569798-X', 104, 0),
('909986323-3', 105, 0),
('909986323-3', 106, 0),
('909986323-3', 107, 0),
('909986323-3', 108, 0),
('909986323-3', 109, 0),
('909986323-3', 110, 0),
('909986323-3', 111, 0),
('066732098-9', 112, 0),
('066732098-9', 113, 0),
('066732098-9', 114, 0),
('066732098-9', 115, 0),
('066732098-9', 116, 0),
('066732098-9', 117, 0),
('609561509-7', 118, 0),
('609561509-7', 119, 0),
('609561509-7', 120, 0),
('609561509-7', 121, 0),
('259947992-4', 122, 0),
('259947992-4', 123, 0),
('259947992-4', 124, 0),
('259947992-4', 125, 0),
('259947992-4', 126, 0),
('259947992-4', 127, 0),
('259947992-4', 128, 0),
('259947992-4', 129, 0),
('259947992-4', 130, 0),
('744932801-1', 131, 0),
('744932801-1', 132, 0),
('030588153-1', 133, 0),
('030588153-1', 134, 0),
('567270190-6', 135, 0),
('567270190-6', 136, 0),
('567270190-6', 137, 0),
('567270190-6', 138, 0),
('689457680-7', 139, 0),
('440769776-8', 140, 0),
('131857613-X', 141, 0),
('151517742-4', 142, 0),
('151517742-4', 143, 0),
('290414967-8', 144, 0),
('078942931-4', 145, 0),
('078942931-4', 146, 0),
('078942931-4', 147, 0),
('078942931-4', 148, 0),
('078942931-4', 149, 0),
('076263244-7', 150, 0),
('076263244-7', 151, 0),
('076263244-7', 152, 0),
('280027259-1', 153, 0),
('093496388-0', 154, 0),
('068970468-1', 155, 0),
('640049410-0', 156, 0),
('640049410-0', 157, 0),
('224793059-2', 158, 0),
('224793059-2', 159, 0),
('224793059-2', 160, 0),
('224793059-2', 161, 0),
('727329511-7', 162, 0),
('727329511-7', 163, 0),
('727329511-7', 164, 0),
('727329511-7', 165, 0),
('727329511-7', 166, 0),
('727329511-7', 167, 0),
('727329511-7', 168, 0),
('280004529-6', 169, 0),
('244973139-5', 170, 0),
('781053769-7', 171, 0),
('781053769-7', 172, 0),
('781053769-7', 173, 0),
('781053769-7', 174, 0),
('614809128-6', 175, 0),
('614809128-6', 176, 0),
('614809128-6', 177, 0),
('614809128-6', 178, 0),
('646291344-4', 179, 0),
('314383535-1', 180, 0),
('314383535-1', 181, 0),
('317083090-6', 182, 0),
('140848658-8', 183, 0),
('153621669-5', 184, 0),
('153621669-5', 185, 0),
('292856452-1', 186, 0),
('136182921-5', 187, 0),
('031639381-6', 188, 0),
('261286401-5', 189, 0),
('261286401-5', 190, 0),
('250942853-3', 191, 0),
('543116263-7', 192, 0),
('264788914-7', 193, 0),
('264788914-7', 194, 0),
('264788914-7', 195, 0),
('183983312-0', 196, 0),
('882805781-2', 197, 0),
('882805781-2', 198, 0),
('882805781-2', 199, 0),

('388093099-2', 200, 0);
-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
  `cpf` VARCHAR(11) NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  `endereco` VARCHAR(255) NULL,
  `telefone` VARCHAR(255) NULL,
  `email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`cpf`))
ENGINE = InnoDB;

insert into usuario (cpf, nome, endereco, telefone, email) values 
('464-98-8906', 'Justino Phelan', '360 Shoshone Alley', '333-877-7113', 'jphelan0@army.mil'),
('706-74-5858', 'Elia Clemerson', '481 Briar Crest Avenue', '617-214-1607', 'eclemerson1@github.io'),
('728-31-8221', 'Victoria Readwin', '314 Londonderry Road', '306-832-6239', 'vreadwin2@wikia.com'),
('146-52-1591', 'Mara Schultz', '158 Pond Point', '278-837-7127', 'mschultz3@eventbrite.com'),
('887-11-0665', 'Ely Brookes', '5563 Norway Maple Street', '196-814-4773', 'ebrookes4@1688.com'),
('756-74-0168', 'Robinia Nail', '3 Menomonie Road', '952-551-9800', 'rnail5@unesco.org'),
('782-91-0123', 'Tommy Aldren', '1537 Briar Crest Park', '992-524-6360', 'taldren6@g.co'),
('831-53-8254', 'Decca Chiese', '9763 Laurel Street', '837-295-3860', 'dchiese7@github.io'),
('180-26-8944', 'Natalya Snoxall', '5060 East Parkway', '619-505-9243', 'nsnoxall8@ftc.gov'),
('153-77-6549', 'Aggy Birckmann', '802 Spenser Way', '184-987-7869', 'abirckmann9@mail.ru'),
('715-78-7638', 'Aristotle Gatling', '538 Anhalt Court', '457-280-4967', 'agatlinga@wikimedia.org'),
('150-19-5004', 'Myranda Labbett', '1 Thompson Center', '889-549-8141', 'mlabbettb@google.com.hk'),
('247-46-1798', 'Corliss Cullingford', '12669 Marquette Place', '720-640-4573', 'ccullingfordc@discovery.com'),
('216-59-0003', 'Catharina Pepall', '0222 Tennyson Junction', '222-578-1505', 'cpepalld@pinterest.com'),
('616-19-0207', 'Stefanie Plaistowe', '632 Old Shore Terrace', '554-859-8192', 'splaistowee@indiegogo.com'),
('404-67-2595', 'Vergil Ralphs', '98 Kenwood Point', '996-474-0168', 'vralphsf@cnbc.com'),
('224-58-3357', 'Bartel Arnison', '314 Utah Pass', '444-878-6200', 'barnisong@photobucket.com'),
('381-73-6887', 'Rachel Brobeck', '938 Darwin Pass', '850-860-7158', 'rbrobeckh@about.com'),
('141-36-5510', 'Johannah Thewles', '6 Dawn Park', '163-271-6850', 'jthewlesi@constantcontact.com'),
('336-26-5004', 'Heriberto Packer', '1 Graceland Park', '183-255-2290', 'hpackerj@reference.com');

-- -----------------------------------------------------
-- Table `mydb`.`emprestimo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`emprestimo` (
  `exemplar_livro_isbn` VARCHAR(45) NOT NULL,
  `exemplar_codigo` INT NOT NULL,
  `usuario_cpf` VARCHAR(11) NOT NULL,
  `data_emprestimo` DATE NOT NULL,
  `data_entrega` DATE NULL,
  `prazo` INT NULL,
  PRIMARY KEY (`exemplar_livro_isbn`, `exemplar_codigo`, `usuario_cpf`, `data_emprestimo`),
  INDEX `fk_emprestimo_usuario1_idx` (`usuario_cpf` ASC) VISIBLE,
  INDEX `fk_emprestimo_exemplar1_idx` (`exemplar_livro_isbn` ASC, `exemplar_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_emprestimo_usuario1`
    FOREIGN KEY (`usuario_cpf`)
    REFERENCES `mydb`.`usuario` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_emprestimo_exemplar1`
    FOREIGN KEY (`exemplar_livro_isbn` , `exemplar_codigo`)
    REFERENCES `mydb`.`exemplar` (`livro_isbn` , `codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `projeto` ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;