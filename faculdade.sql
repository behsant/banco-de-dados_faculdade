CREATE DATABASE faculdade;

CREATE TABLE tab_aluno (
  `id` INT NOT NULL,
  `nome` VARCHAR(100) NULL,
  `data_nascimento` DATE NULL,
  `cpf` VARCHAR(11) NULL,
  `endereco_aluno_id` INT NOT NULL,
  `contato_aluno_id` INT NOT NULL,
  `tab_curso_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE,
  INDEX `fk_aluno_endereco_aluno_idx` (`endereco_aluno_id` ASC) VISIBLE,
  INDEX `fk_aluno_contato_aluno1_idx` (`contato_aluno_id` ASC) VISIBLE,
  INDEX `fk_aluno_tab_curso1_idx` (`tab_curso_id` ASC) VISIBLE,
  CONSTRAINT `fk_aluno_endereco_aluno`
    FOREIGN KEY (`endereco_aluno_id`)
    REFERENCES `mydb`.`tab_endereco_aluno` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_aluno_contato_aluno1`
    FOREIGN KEY (`contato_aluno_id`)
    REFERENCES `mydb`.`tab_contato_aluno` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_aluno_tab_curso1`
    FOREIGN KEY (`tab_curso_id`)
    REFERENCES `mydb`.`tab_curso` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE tab_endereco_aluno (
  `id` INT NOT NULL,
  `bairro` VARCHAR(45) NULL,
  `cidade` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE tab_contato_aluno (
  `id` INT NOT NULL,
  `email` TEXT NULL,
  `telefone` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE tab_curso (
  `id` INT NOT NULL,
  `carga_horaria` INT NULL,
  `duracao` INT NULL,
  `nome` VARCHAR(45) NULL,
  `cordenadorr` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE tab_nota (
  `id` INT NOT NULL,
  `nota` INT NULL,
  `semestre` DECIMAL(5,2) NULL,
  `aluno_id` INT NOT NULL,
  `tab_disciplina_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tab_nota_aluno1_idx` (`aluno_id` ASC) VISIBLE,
  INDEX `fk_tab_nota_tab_disciplina1_idx` (`tab_disciplina_id` ASC) VISIBLE,
  CONSTRAINT `fk_tab_nota_aluno1`
    FOREIGN KEY (`aluno_id`)
    REFERENCES `mydb`.`tab_aluno` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tab_nota_tab_disciplina1`
    FOREIGN KEY (`tab_disciplina_id`)
    REFERENCES `mydb`.`tab_disciplina` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE tab_turmas (
  `id` INT NOT NULL,
  `codigo_turma` VARCHAR(10) NULL,
  `ano` INT NULL,
  `semestre` INT NULL,
  `tab_disciplina_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `codigo_turma_UNIQUE` (`codigo_turma` ASC) VISIBLE,
  INDEX `fk_tab_turmas_tab_disciplina1_idx` (`tab_disciplina_id` ASC) VISIBLE,
  CONSTRAINT `fk_tab_turmas_tab_disciplina1`
    FOREIGN KEY (`tab_disciplina_id`)
    REFERENCES `mydb`.`tab_disciplina` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE tab_disciplina (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `carga_horaria` INT NULL,
  `professores_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tab_disciplina_professores1_idx` (`professores_id` ASC) VISIBLE,
  CONSTRAINT `fk_tab_disciplina_professores1`
    FOREIGN KEY (`professores_id`)
    REFERENCES `mydb`.`tab_professores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE tab_professores (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `cpf` VARCHAR(11) NULL,
  `endereco_professor_id` INT NOT NULL,
  `contato_professor_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE,
  INDEX `fk_professores_endereco_professor1_idx` (`endereco_professor_id` ASC) VISIBLE,
  INDEX `fk_professores_contato_professor1_idx` (`contato_professor_id` ASC) VISIBLE,
  CONSTRAINT `fk_professores_endereco_professor1`
    FOREIGN KEY (`endereco_professor_id`)
    REFERENCES `mydb`.`tab_endereco_professor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_professores_contato_professor1`
    FOREIGN KEY (`contato_professor_id`)
    REFERENCES `mydb`.`tab_contato_professor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE tab_endereco_professor (
  `id` INT NOT NULL,
  `cidade` VARCHAR(45) NULL,
  `bairro` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE tab_contato_professor (
  `id` INT NOT NULL,
  `email` VARCHAR(45) NULL,
  `telefone` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB












