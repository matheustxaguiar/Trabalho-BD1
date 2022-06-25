CREATE TABLE Pessoa(id_pessoa int PRIMARY KEY,
                       identidade bigint,
                       nome varchar(50),
                       data_nascimento date,
                       sexo varchar(10),
                       email varchar(50),
                       telefone bigint);


CREATE TABLE Profissao(id_profissao int PRIMARY KEY,
                       nome varchar(50));                    


CREATE TABLE Plano_Saude(id_plano_saude int PRIMARY KEY,
                       nome varchar(50));   


CREATE TABLE Paciente(id_paciente int PRIMARY KEY,
                     id_pessoa int,
                     id_plano_saude int,
                     id_profissao int,
                     FOREIGN KEY(id_plano_saude)
                     REFERENCES Plano_Saude(id_plano_saude),
                     FOREIGN KEY(id_profissao)
                     REFERENCES Profissao(id_profissao),
                     FOREIGN KEY(id_pessoa)
                     REFERENCES Pessoa(id_pessoa));


CREATE TABLE Grau_Gravidade(id_gravidade int PRIMARY KEY,
                       nivel varchar(50)); 

                   

CREATE TABLE Funcao(id_funcao int PRIMARY KEY,
                    funcao varchar(20),
                    salario real);
                    

CREATE TABLE Funcionario(id_funcionario int PRIMARY KEY,
                        data_contratacao date,
                          id_pessoa int,
                          id_funcao int,
                        FOREIGN KEY(id_pessoa)
                        REFERENCES Pessoa(id_pessoa),
                        FOREIGN KEY(id_funcao)
                        REFERENCES Funcao(id_funcao));
                        
                        
CREATE TABLE Setor(id_setor int PRIMARY KEY,
                   nome varchar(20),
                   capacidade_paciente int);
                   
                          
CREATE TABLE Ficha_Paciente(id_ficha int PRIMARY KEY,
                            situacao_tratamento varchar(20),
                            data_emissao date,
                            notacao varchar(150),
                            id_pessoa int,
                            id_setor int,
                            id_funcionario int,
                            id_grau_gravidade int,
                            FOREIGN KEY(id_pessoa)
                            REFERENCES Pessoa(id_pessoa),
                            FOREIGN KEY(id_setor)
                            REFERENCES Setor(id_setor),
                            FOREIGN KEY(id_funcionario)
                            REFERENCES Funcionario(id_funcionario),
                            FOREIGN KEY(id_grau_gravidade)
                            REFERENCES Grau_Gravidade(id_gravidade));
                            
CREATE TABLE Funcao_Setor(id_setor int,
                            id_funcao int,
                              min_capacidade int,
                            FOREIGN KEY(id_setor)
                            REFERENCES Setor(id_setor),
                            FOREIGN KEY(id_funcao)
                            REFERENCES Funcao(id_funcao));
                   
                          
CREATE TABLE Servico(id_servico int PRIMARY KEY,
                     nome varchar(40),
                     valor real);


CREATE TABLE Paciente_Servico(id_ficha int,
                              id_servico int,
                                data_servico date,
                              FOREIGN KEY(id_ficha)
                              REFERENCES Ficha_Paciente(id_ficha),
                              FOREIGN KEY(id_servico)
                              REFERENCES Servico(id_servico))












INSERT INTO Pessoa (id_pessoa, identidade, nome, data_nascimento, sexo, email, telefone)
    VALUES (0001, 12345678912, 'Vinícius Barbosa', '1977-03-21', 'Masculino', 'vinicius22@gmail.com', 27999999999),
           (0002, 98765432198, 'Márcia Monteiro', '1993-02-11', 'Feminino', 'marcia_m@hotmail.com', 28999990000),
           (0003, 14725836914, 'Ricardo Justo', '2000-09-10', 'Masculino', 'ricardo_justo3@hotmail.com', 27912345678),
           (0004, 96385274196, 'Heloísa Cunha', '1939-09-06', 'Feminino', 'heloisaconha39@outlook.com', 27999000999),
           (0005, 75324186952, 'Vivian Pinheiro', '1988-01-30', 'Feminino', 'vivi_pinheiro_oficial@gmail.com', 27987654321),
           (0006, 11122233344, 'Arthur D', '1950-03-24', 'Masculino', 'arthurd22@gmail.com', 27999991000),
           (0007, 93405834590, 'Guilherme B', '1980-11-01', 'Masculino', 'guilherminho__vix@hotmail.com', 27999667070),
           (0008, 77777451252, 'Lewis Hamilton', '1978-01-04', 'Masculino', 'lewishamilton44@gmail.com', 11998880033),
           (0009, 44334354566, 'Jô soares', '1960-2-20', 'Masculino', 'jojoamoglobo@outlook.com.br', 28987452233),
           (0010, 00000000001, 'Sharika Colombia', '2000-09-17', 'Feminino', 'wakawka_oficial@gmail.com', 11987666000),
           (0011, 12523658778, 'Harry Potter', '1993-07-01', 'Masculino', 'harrypotter_bruxo@gmail.com', 28998877665),
           (0012, 99887766554, 'Estefano estefane', '1999-01-01', 'Masculino', 'este7estafano@hotmail.com', 27999777444),
           (0013, 77777451252, 'Gabriel Barbosa', '2001-08-10', 'Masculino', 'gabigol_flamengo@gmail.com', 11912445023),
           (0014, 96385274196, 'Maria Bonita', '1958-09-20', 'Feminino', 'mariabonita@outlook.com.br', 28999333888),
           (0015, 00220011002, 'Fatima Bernades', '1977-11-20', 'Feminino', 'fatimadaglobo@gmail.com', 119584120325),
           (0016, 11122245120, 'Isabela Fonseca', '1988-07-07', 'Feminino', 'isaisafonseca@hotmail.com', 27965632325),
           (0017, 74545123595, 'Fernando Fernandez', '1983-11-12', 'Masculino', 'fffernandez@gmail.com', 11988854412),
           (0018, 55429001245, 'Thanos da Silva', '1974-03-11', 'Masculino', 'thanosdosavengers@gmail.com', 27988844211,
           (0019, 00110022003, 'Gabriela Fagundez', '1986-05-04', 'Feminino', 'gabrielafagundez@gmail.com', 11985422223),
           (0020, 96385274196, 'Debora martins', '2002-10-29', 'Feminino', 'm2002debora@outlook.com.br', 28999333888),
           (0021, 88888000088, 'Macleusa Rasputin', '1970-08-18', 'Feminino', 'macleusasouza@outlook.com.br', 11988885556);




















INSERT INTO Funcao (id_funcao, funcao, salario)
    VALUES (0001, 'Enfermeiro', 3500.00),
           (0002, 'Médico Clinico Geral', 10000.00),
           (0003, 'Recepcionista', 2000.00),
           (0004, 'Obstetra', 3700.00),
           (0005, 'Médico Pedriatra', 6000.00),
           (0006, 'Zelador', 900.00),
           (0007, 'Analista', 10000.00),
           (0008, 'Médico otorrino', 7500.00),
           (0009, 'Médico oftamologista', 8000.00),
           (0010, 'Médico cardiologista', 20000.00);


INSERT INTO Paciente (id_paciente, id_profissao, id_plano_saude, id_pessoa)
    VALUES (0001, 0001, 0001, 0001),
           (0002, 0002, 0002, 0002),
           (0003, 0003, 0003, 0003),
           (0004, 0004, 0004, 0004),
           (0005, 0005, 0005, 0005),
           (0006, 0006, 0001, 0006),
           (0007, 0007, 0003, 0007),
           (0008, 0008, 0001, 0008),
           (0009, 0009, 0005, 0009),
           (0010, 0010, 0001, 0010),
           (0011, 0011, 0001, 0011),
           (0012, 0012, 0004, 0012),
           (0013, 0013, 0001, 0013),
           (0014, 0014, 0003, 0014),
           (0015, 0015, 0001, 0015);



INSERT INTO Setor (id_setor, nome, capacidade_paciente)
    VALUES (0001, 'Enfermaria A', 25),
           (0002, 'Enfermaria B', 25),
           (0003, 'UTI', 20),
           (0004, 'Centro Cirúrgico', 10),
           (0005, 'Ambulatórior', 10),
	     (0006, 'Pronto socorro', 100),
	     (0006, 'Especialidade', 100),
	     (0006, 'Terapia', 100);

           

INSERT INTO Funcionario (id_funcionario, data_contratacao, id_pessoa, id_funcao)
    VALUES (0001,'2022-05-07', 0017, 0001),
           (0002, '2022-05-07', 0018, 0002),
           (0003, '2022-05-07', 0019, 0003),
           (0004, '2022-05-07', 0020, 0004),
           (0005, '2022-05-07', 0021, 0005);














INSERT INTO Ficha_Paciente (id_ficha,situacao_tratamento, data_emissao, id_grau_gravidade,notacao, id_pessoa,id_setor,id_funcionario)
    VALUES (0001,'Em Tratamento','2022-05-09', 0001,'Paciente febril e com colicas', 0001,0005,0002),
           (0002,'Alta', '2022-08-23', 0002,'Paciente relata que esta com dor na junta', 0002,0005,0002),
           (0003,'Em Tratamento', '2022-01-08', 0003,'Paciente com diarreia e vomito', 0003,0005,0002),
           (0004,'Em Tratamento', '2022-09-20', 0004,'Paciente gosta de Matematica Discreta', 0004,0006,0005),
           (0005,'Alta', '2022-11-23', 0003,'Paciente relata que caiu de moto, mas ta de boa', 0005,0004,0005),
	     (0006,'Em Tratamento','2022-01-14', 0001,'Paciente febril com diarreia', 0006,0005,0004),
           (0007,'Alta', '2022-09-23', 0002,'Sindrome do pato', 0007,0004,0004),
           (0008,'Em Tratamento', '2022-07-23', 0003,'Paciente com tremedeira', 0008,0006,0004),
           (0009,'Em Tratamento', '2022-07-15', 0004,'Paciente com mudança no paladar', 0009,0006,0005),
           (0010,'Alta', '2022-12-20', 0003,'Paciente relata que está com dor nas juntas, mas ta de boa', 0010,0006,0005),
           (0011,'Em Tratamento','2022-10-23', 0001,'Paciente com COVID', 0011,0005,0002),
           (0012,'Alta', '2022-05-23', 0002,'Paciente com Gripe forte', 0012,0005,0002),
           (0013,'Em Tratamento', '2022-07-14', 0003,'Chegou com dor no abdomem', 0013,0006,0004),
           (0014,'Em Tratamento', '2022-06-11', 0004,'Paciente gosta da Linguagem C', 0014,0006,0005),
           (0015,'Alta', '2022-01-10', 0003,'Paciente com coloração pálida e suando frio', 0015,0005,0002);




INSERT INTO Servico (id_servico, nome, valor)
    VALUES (0001, 'Eletrocardiogram', 100.00),
           (0002, 'Ecocardiografia transtorácica', 150.00),
           (0003, 'Eletroencefalograma', 100.00),
           (0004, 'Mamografia', 200.00),
           (0005, 'Radiografia', 50.00),
           (0006, 'Radiografia Contraste', 75.00),
           (0007, 'Tomografia', 210.00),
           (0008, 'Ultrasonografia simples', 200.00),
           (0009, 'Ultrasonografia com Doppler', 260.00); 





INSERT INTO Paciente_Servico (id_ficha, id_servico, data_servico)
    VALUES (0001, 0001, '2022-01-13'),
           (0002, 0002, '2022-10-23'),
           (0003, 0003, '2022-01-19'),
           (0004, 0004, '2022-06-08'),
           (0005, 0005, '2022-05-05'),
           (0001, 0007, '2022-10-04'),
           (0002, 0004, '2022-12-19'),
           (0003, 0009, '2022-11-14'),
           (0004, 0005, '2022-09-13'),
           (0005, 0008, '2022-05-17');
        






INSERT INTO Funcao_Setor (id_setor, id_funcao, min_capacidade)
    VALUES (0001, 0001, 10),
           (0001, 0002, 1),
           (0002, 0001, 18),
           (0005, 0003, 4),
           (0005, 0002, 3),
           (0001, 0006, 3),
           (0006, 0001, 18),
           (0006, 0006, 4),
           (0006, 0008, 3),
           (0006, 0009, 3),
           (0006, 0009, 3),      



INSERT INTO Profissao (id_profissao, nome)
    VALUES (0001, 'professor'),
           (0002, 'mecanico'),
           (0003, 'estudante'),
           (0004, 'mestre de obras'),
           (0005, 'designer'),
           (0006, 'professor'),
           (0007, 'mecanico'),
           (0008, 'estudante'),
           (0009, 'mestre de obras'),
           (0010, 'designer'),
           (0011, 'carpinteiro'),
           (0012, 'pedreiro'),
           (0013, 'padre'),
           (0014, 'estudante'),
           (0015, 'desempregado');



INSERT INTO Plano_Saude (id_plano_saude, nome)
    VALUES (0001, 'Unimed'),
           (0002, 'Medsenior'),
           (0003, 'SAMP'),
           (0004, 'Sul America'),
           (0005, 'nenhum');




INSERT INTO Grau_Gravidade (id_gravidade, nivel)
    VALUES (0001, 'nao urgente'),
           (0002, 'pouco urgente'),
           (0003, 'urgente'),
           (0004, 'muito urgente');









