-- ==============================================================================
-- SCRIPT DE POVOAMENTO DE DADOS (POPULATE)
-- ==============================================================================

-- 1. POPULANDO AS ESPECIALIDADES (cadastro.Especialidade)
INSERT INTO cadastro.Especialidade (nomeEspecialidade) VALUES 
('Cardiologia'), ('Pediatria'), ('Ortopedia'), ('Cl�nica M�dica'), 
('Dermatologia'), ('Ginecologia'), ('Neurologia'), ('Psiquiatria');

-- 2. POPULANDO AS FUN��ES DO RH (rh.Funcao)
INSERT INTO rh.Funcao (nomeFuncao, descricao) VALUES 
('Recepcionista', 'Atendimento ao cliente e agendamentos'),
('Auxiliar de Limpeza', 'Manuten��o e higiene do local'),
('Administrador', 'Gerenciamento financeiro e de pessoal'),
('Enfermeiro', 'Suporte m�dico e triagem de pacientes'),
('T�cnico de TI', 'Suporte aos sistemas e infraestrutura');

-- 3. POPULANDO OS M�DICOS (cadastro.Medico) - 8 m�dicos vinculados �s Especialidades (1 a 8)
INSERT INTO cadastro.Medico (CRM, Nome, idEspecialidade) VALUES 
('CRM/SP 12345', 'Dr. Arnaldo Silva', 1),
('CRM/SP 67890', 'Dra. Beatriz Santos', 2),
('CRM/SP 11223', 'Dr. Carlos Oliveira', 3),
('CRM/SP 44556', 'Dra. Daniela Lima', 4),
('CRM/SP 77889', 'Dr. Eduardo Costa', 5),
('CRM/SP 99001', 'Dra. Fernanda Souza', 6),
('CRM/SP 22334', 'Dr. Gabriel Jesus', 7),
('CRM/SP 55667', 'Dra. Helena Roza', 8);

-- 4. POPULANDO OS PACIENTES (cadastro.Paciente) - 20 pacientes
INSERT INTO cadastro.Paciente (Nome, CPF, Telefone, dataNascimento) VALUES 
('Jo�o Silva', '11122233344', '11988887777', '1985-05-12'),
('Maria Oliveira', '22233344455', '11977776666', '1990-08-24'),
('Pedro Santos', '33344455566', '11966665555', '1978-03-02'),
('Ana Costa', '44455566677', '11955554444', '2000-11-15'),
('Lucas Souza', '55566677788', '11944443333', '1995-01-30'),
('Julia Lima', '66677788899', '11933332222', '1988-07-19'),
('Marcos Rocha', '77788899900', '11922221111', '1965-12-05'),
('Beatriz Ramos', '88899900011', '11911110000', '2002-04-22'),
('Carlos Melo', '99900011122', '11900009999', '1973-09-14'),
('Amanda Dias', '00011122233', '11999998888', '1992-06-08'),
('Roberto Cruz', '12345678901', '11987654321', '1980-02-28'),
('Camila Faria', '23456789012', '11976543210', '1997-10-10'),
('Ricardo Gomes', '34567890123', '11965432109', '1958-08-03'),
('Larissa Martins', '45678901234', '11954321098', '2005-12-25'),
('Fernando Alencar', '56789012345', '11943210987', '1983-04-17'),
('Sofia Teixeira', '67890123456', '11932109876', '1991-03-11'),
('Andr� Carvalho', '78901234567', '11921098765', '1970-11-30'),
('Mariana Vieira', '89012345678', '11910987654', '1994-05-05'),
('Thiago Barbosa', '90123456789', '11901098765', '1987-09-21'),
('Gabriela Nunes', '01234567890', '11990987654', '1999-07-07');

-- 5. POPULANDO OS FUNCION�RIOS (rh.Funcionario) - 6 funcion�rios vinculados �s Fun��es (1 a 5)
INSERT INTO rh.Funcionario (idFuncao, Nome, Email, Telefone, dataAdmissao, ativo) VALUES 
(1, 'Alice Nogueira', 'alice@clinica.com', '11912345678', '2022-01-10', 1),
(1, 'Bruno Mendes', 'bruno@clinica.com', '11923456789', '2023-03-15', 1),
(2, 'Claudio Ribeiro', 'claudio@clinica.com', '11934567890', '2021-06-01', 1),
(3, 'Debora Fonseca', 'debora@clinica.com', '11945678901', '2020-01-05', 1),
(4, 'Elton Quadros', 'elton@clinica.com', '11956789012', '2024-02-20', 1),
(5, 'Fabiana Rezende', 'fabiana@clinica.com', '11967890123', '2022-08-11', 1);

-- 6. POPULANDO AS CONSULTAS (atendimento.Consulta) - 50 consultas vinculando Pacientes e M�dicos
INSERT INTO atendimento.Consulta (idPaciente, idMedico, HorarioConsulta, Status, Descricao) VALUES 
(1, 1, '2026-01-05 08:00:00', 'Realizada', 'Rotina cardiol�gica, paciente bem.'),
(2, 2, '2026-01-05 09:00:00', 'Realizada', 'Consulta de rotina pedi�trica.'),
(3, 3, '2026-01-05 10:00:00', 'Realizada', 'Dor no joelho p�s-queda.'),
(4, 4, '2026-01-05 11:00:00', 'Realizada', 'Check-up anual, solicitados exames de sangue.'),
(5, 5, '2026-01-06 08:30:00', 'Realizada', 'Avalia��o de manchas na pele.'),
(6, 6, '2026-01-06 09:30:00', 'Realizada', 'Consulta ginecol�gica preventiva.'),
(7, 7, '2026-01-06 14:00:00', 'Realizada', 'Enxaquecas frequentes.'),
(8, 8, '2026-01-06 15:00:00', 'Realizada', 'Acompanhamento terap�utico.'),
(9, 1, '2026-01-07 08:00:00', 'Realizada', 'Palpita��o card�aca relatada.'),
(10, 2, '2026-01-07 10:00:00', 'Realizada', 'Febre alta em crian�a.'),
(11, 3, '2026-01-07 11:30:00', 'Realizada', 'Suspeita de fratura no pulso.'),
(12, 4, '2026-01-07 13:00:00', 'Realizada', 'Sintomas gripais intensos.'),
(13, 5, '2026-01-08 09:00:00', 'Realizada', 'Retorno de tratamento de acne.'),
(14, 6, '2026-01-08 10:30:00', 'Realizada', 'Acompanhamento pr�-natal inicial.'),
(15, 7, '2026-01-08 14:30:00', 'Realizada', 'Dorm�ncia nos bra�os.'),
(16, 8, '2026-01-08 16:00:00', 'Realizada', 'Ansiedade generalizada.'),
(17, 1, '2026-01-09 08:00:00', 'Cancelada', 'Paciente desmarcou.'),
(18, 2, '2026-01-09 09:00:00', 'Realizada', 'Acompanhamento de peso infantil.'),
(19, 3, '2026-01-09 11:00:00', 'Realizada', 'Dor cr�nica na coluna lombar.'),
(20, 4, '2026-01-09 15:00:00', 'Realizada', 'Renova��o de receitas de uso cont�nuo.'),
(1, 2, '2026-01-12 08:30:00', 'Realizada', 'Consulta de transi��o de prontu�rio.'),
(3, 4, '2026-01-12 10:00:00', 'Realizada', 'Cansa�o extremo e indisposi��o.'),
(5, 6, '2026-01-12 14:00:00', 'Realizada', 'Exames de rotina solicitados.'),
(7, 8, '2026-01-12 16:00:00', 'Realizada', 'Ajuste de dosagem de medicamento.'),
(2, 1, '2026-01-13 09:00:00', 'Realizada', 'Sopro card�aco detectado anteriormente.'),
(4, 3, '2026-01-13 11:00:00', 'Realizada', 'Entorse no tornozelo.'),
(6, 5, '2026-01-13 13:30:00', 'Realizada', 'Alergia cut�nea severa.'),
(8, 7, '2026-01-13 15:30:00', 'Realizada', 'Tremores nas m�os.'),
(10, 4, '2026-01-14 08:00:00', 'Realizada', 'Avalia��o p�s-resfriado.'),
(12, 6, '2026-01-14 10:00:00', 'Realizada', 'Retorno com exames de ultrassom.'),
(14, 8, '2026-01-14 14:00:00', 'Realizada', 'Avalia��o de estresse ocupacional.'),
(16, 2, '2026-01-14 15:30:00', 'Realizada', 'Dor de ouvido recorrente.'),
(18, 1, '2026-01-15 08:00:00', 'Agendada', 'Consulta futura marcada.'),
(20, 3, '2026-01-15 10:00:00', 'Agendada', 'Retorno da coluna p�s-fisioterapia.'),
(11, 5, '2026-01-15 14:00:00', 'Realizada', 'Remo��o de pequenos sinais de pele.'),
(13, 7, '2026-01-15 16:00:00', 'Realizada', 'Avalia��o de perda de mem�ria recente.'),
(15, 4, '2026-01-16 09:00:00', 'Realizada', 'Dor abdominal suspeita.'),
(17, 6, '2026-01-16 11:00:00', 'Realizada', 'Dores no baixo ventre.'),
(19, 8, '2026-01-16 14:00:00', 'Realizada', 'In�cio de tratamento psicoter�pico.'),
(2, 3, '2026-01-19 08:30:00', 'Realizada', 'Postura incorreta na escola.'),
(4, 5, '2026-01-19 10:30:00', 'Realizada', 'Check-up dermatol�gico geral.'),
(6, 7, '2026-01-19 13:30:00', 'Realizada', 'Formigamento cr�nico nas pernas.'),
(8, 1, '2026-01-19 15:30:00', 'Realizada', 'Press�o alta cr�nica, ajuste de medica��o.'),
(1, 4, '2026-01-20 08:00:00', 'Realizada', 'Queixa de ins�nia e dor de cabe�a.'),
(3, 6, '2026-01-20 10:00:00', 'Realizada', 'Exames de rotina anuais de ginecologia.'),
(5, 8, '2026-01-20 14:00:00', 'Realizada', 'Transtorno do sono.'),
(7, 2, '2026-01-20 15:30:00', 'Realizada', 'Acompanhamento de asma infantil.'),
(9, 3, '2026-01-21 09:00:00', 'Realizada', 'Contus�o muscular no ombro.'),
(11, 4, '2026-01-21 11:00:00', 'Realizada', 'Revis�o de exames laboratoriais.'),
(13, 6, '2026-01-21 14:00:00', 'Realizada', 'Preven��o e orienta��es gerais.');

-- 7. POPULANDO OS EXAMES (atendimento.Exame) - 25 exames vinculados �s Consultas existentes
INSERT INTO atendimento.Exame (idConsulta, tipoExame, resultado, dataExame) VALUES 
(1, 'Eletrocardiograma', 'Ritmo sinusal normal, sem altera��es cr�ticas.', '2026-01-05 10:00:00'),
(3, 'Raio-X de Joelho', 'Sem fraturas �sseas aparentes. Leve edema muscular.', '2026-01-05 11:30:00'),
(4, 'Hemograma Completo', 'Taxas dentro da normalidade, leve anemia identificada.', '2026-01-06 07:00:00'),
(4, 'Colesterol Total e Fra��es', 'Colesterol LDL levemente acima do recomendado.', '2026-01-06 07:00:00'),
(6, 'Papanicolau', 'Amostra satisfat�ria. Negativo para malignidade.', '2026-01-08 09:00:00'),
(7, 'Resson�ncia Magn�tica do Cr�nio', 'Estruturas cerebrais preservadas, sem les�es agudas.', '2026-01-10 14:00:00'),
(9, 'Ecocardiograma Transtor�cico', 'Fra��o de eje��o normal. Discreta insufici�ncia mitral.', '2026-01-07 11:00:00'),
(11, 'Raio-X de Punho', 'Fratura linear est�vel no r�dio. Recomendado gesso.', '2026-01-07 13:00:00'),
(14, 'Ultrassonografia Obst�trica', 'Idade gestacional de 8 semanas. Embri�o com batimentos normais.', '2026-01-10 09:30:00'),
(19, 'Resson�ncia de Coluna Lombar', 'Abaulamento discal difuso em L4-L5, sem compress�o grave.', '2026-01-14 11:00:00'),
(22, 'Glicemia em Jejum', 'Resultado: 92 mg/dL. Normal.', '2026-01-13 07:15:00'),
(22, 'TSH e T4 Livre', 'Horm�nios tireoidianos regulados.', '2026-01-13 07:15:00'),
(23, 'Ultrassonografia P�lvica', '�tero e ov�rios sem altera��es anat�micas.', '2026-01-13 16:00:00'),
(26, 'Raio-X de Tornozelo', 'Aus�ncia de fraturas. Entorse de grau 1 tratado com repouso.', '2026-01-13 12:00:00'),
(27, 'Bi�psia de Les�o Cut�nea', 'Les�o benigna. Ceratose seborreica.', '2026-01-20 10:00:00'),
(30, 'Hemograma Completo', 'Sem altera��es na s�rie branca ou vermelha.', '2026-01-15 07:00:00'),
(35, 'Audiometria', 'Audi��o dentro dos padr�es de normalidade para a idade.', '2026-01-16 15:00:00'),
(37, 'Ultrassonografia Transvaginal', 'Pequeno mioma intramural detectado, sem relev�ncia cl�nica.', '2026-01-18 10:00:00'),
(41, 'Teste de Alergia Cut�nea (Prick Test)', 'Positivo para �caros e poeira dom�stica.', '2026-01-21 11:00:00'),
(43, 'Eletrocardiograma de Esfor�o (Ergom�trico)', 'Sem sinais de isquemia durante o esfor�o m�ximo.', '2026-01-22 14:00:00'),
(44, 'Polissonografia', 'Fragmenta��o do sono leve. Roncos espor�dicos.', '2026-01-25 22:00:00'),
(45, 'Mamografia Digital', 'BI-RADS 2 - Achados benignos.', '2026-01-22 08:30:00'),
(48, 'Ultrassonografia de Ombro', 'Tendinopatia leve do supraespinhal. Sem rupturas.', '2026-01-22 10:00:00'),
(49, 'Creatinina e Ureia', 'Fun��o renal excelente.', '2026-01-22 07:00:00'),
(49, 'Urina Tipo 1', 'Aus�ncia de infec��o urin�ria ou protein�ria.', '2026-01-22 07:00:00');