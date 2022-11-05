USE Oficina ;

INSERT INTO Pessoa (Nome,Endereco,Telefone,email)
VALUES
  ("Ezekiel","Ap #108-7047 Et, Avenue","(524) 766-7620","odio.phasellus@icloud.ca"),
  ("Winifred","472-961 Ipsum Rd.","1-544-558-9267","in@icloud.com"),
  ("Tanisha","578 Faucibus. Rd.","1-927-913-2426","augue.sed.molestie@hotmail.couk"),
  ("Jordan","793-8446 Pede. Ave","(777) 925-7250","magna.malesuada@protonmail.couk"),
  ("Hammett","Ap #742-5578 Enim. Rd.","(308) 417-3571","sem@aol.org"),
  ("Elliott","Ap #349-678 Hymenaeos. St.","1-465-366-3657","ipsum.cursus.vestibulum@yahoo.ca"),
  ("Rachel","325-758 Vel, Rd.","1-628-937-0611","ultricies@aol.com"),
  ("Kai","891-4225 Nascetur Av.","(639) 579-8579","nascetur@yahoo.com"),
  ("Mariko","245-7733 Magna. Rd.","(574) 755-6472","ac.orci@aol.net"),
  ("Maile","Ap #215-7838 In Street","(574) 872-2462","libero.et@hotmail.edu"),
  ("Camden","330-9409 Eleifend St.","(371) 746-3706","semper.egestas.urna@yahoo.ca"),
  ("Desiree","Ap #618-4144 Quis Road","(486) 527-1071","neque.nullam@google.net"),
  ("Kaitlin","8691 Mus. Road","1-923-622-5373","donec@outlook.com"),
  ("Demetrius","715-8399 Nec, Avenue","(687) 326-2122","mus.proin@google.couk"),
  ("Graiden","860-9057 Cras Road","1-797-634-3851","eu.lacus@icloud.org"),
  ("Flynn","544-7341 Euismod Avenue","1-459-780-6632","sem@outlook.net"),
  ("McKenzie","681-9313 Molestie St.","1-368-131-7570","massa@protonmail.com"),
  ("Ifeoma","Ap #464-4212 Quisque St.","(645) 140-3983","quis@google.edu"),
  ("Emerson","Ap #428-161 Maecenas Avenue","(554) 765-0543","nec@google.com"),
  ("Bernard","Ap #645-5485 Montes, Road","1-149-868-4752","a.malesuada@yahoo.com");



-- ---------------------------------------------------------------------------------------------
-- cliente


INSERT INTO Clientes (Pessoa_idPessoa,Situacao,Data_ultimo_contato)
VALUES
  (4,true,"2023-04-21"),
  (18,False,"2021-12-15"),
  (1,true,"2022-04-05"),
  (10,true,"2023-04-09"),
  (3,true,"2021-12-01"),
  (7,False,"2023-07-28"),
  (15,False,"2022-08-27"),
  (8,False,"2021-11-18"),
  (20,False,"2023-08-31"),
  (17,true,"2023-03-25"),
  (13,False,"2022-04-19"),
  (19,False,"2022-02-10"),
  (5,true,"2023-08-14"),
  (6,true,"2023-05-23"),
  (16,False,"2021-11-20"),
  (14,true,"2023-05-15"),
  (11,true,"2023-03-03"),
  (9,true,"2021-12-28"),
  (2,true,"2023-02-22"),
  (12,False,"2022-08-17");

-- -------------------------------------------
-- equipes

INSERT INTO Equipes (Descricao)
VALUES
  ("Equipe de Injeção eletrônica"),
  ("Equipe de Elétrica"),
  ("Equipe de Motores"),
  ("Equipe de Funilaria"),
  ("Equipe de Freios");


--  ---------------------------------------------------------
-- funcionarios

INSERT INTO Funcionarios (Pessoa_idPessoa,Matricula,Especialidade,Equipes_idEquipes)
VALUES
  (8,"DUM40OFW4SF","Suspensão",5),
  (6,"JRP74YYU8RI","Motor",4),
  (7,"OYI37SKW4CJ","Injeção eletrônica",1),
  (2,"KRP01FQZ6VP","Motor",2),
  (19,"PWU35HQJ1BR","Motor",4);


-- ---------------------------------------------------------------
-- veiculos
INSERT INTO Veiculos (Marca,Modelo,Placa,Ano,Situacao,Data_ultima_revisao,Clientes_idClientes)
VALUES
  ("Audi","A4","KRA-7278",2016,"0","2022-11-05",11),
  ("Fiat","Palio","HIP-6683",2016,"1","2022-07-07",7),
  ("Nissan","Frontier","NSQ-2341",2017,"0","2023-01-18",5),
  ("Kia Motors","Pcanto","DGX-1303",2004,"1","2022-02-21",15),
  ("Chevrolet","Corsa","WOX-3824",2005,"1","2023-03-16",7),
  ("Chevrolet","Onix","UDS-2852",2016,"1","2023-04-25",2),
  ("Volkswagen","Gol","LPC-9852",2014,"1","2022-05-08",18),
  ("Ford","Ranger","GOU-1219",2011,"0","2022-03-14",5),
  ("Ford","F1000","YFR-0648",2019,"0","2022-09-26",19),
  ("Peugeot","208","PXF-8136",2003,"0","2022-10-03",16),
  ("Peugeot","2008","LKE-0661",2008,"1","2021-11-10",9),
  ("Peugeot","3008","GIN-9624",2002,"1","2022-04-04",14),
  ("Audi","A3","JED-6886",2014,"0","2022-01-16",12),
  ("Renault","Clio","SGT-6246",2005,"1","2023-05-22",11),
  ("Peugeot","5008","HMM-7265",2015,"1","2022-12-30",17),
  ("Suzuki","Vitara","VNE-5346",2010,"0","2022-07-13",9),
  ("Peugeot","207","TRI-5344",2005,"0","2022-10-26",1),
  ("Suzuki","GrandVitara","TJT-8639",2018,"0","2023-09-01",8),
  ("Chevrolet","S10","HDN-7268",2022,"1","2022-01-19",11),
  ("Nissan","Versa","DML-4149",2007,"1","2022-04-04",9);
  
  
  -- -----------------------------------------------------------------
  -- catlogo_pecas
  
INSERT INTO Catalogo_Pecas (Descricao,Valor_unitario,Fabricante,PART_NUMBER,qtd_estoque)
VALUES
  ("nec orci. Donec nibh. Quisque","78.83","Ford","LV03QIBY7555467520327",12),
  ("aptent","79.00","Audi","LV95YGKD0412187930351",5),
  ("malesuada malesuada. Integer","86.15","Peugeot","LI6851865510603126035",11),
  ("urna. Vivamus molestie dapibus","99.24","Renault","TR177805994886658740670253",11),
  ("Nulla tincidunt,","84.61","Fiat","MT53TPST47473458417582072169277",4),
  ("consequat dolor vitae","66.15","Fiat","GE13898034485671218285",5),
  ("facilisis lorem tristique aliquet.","35.32","Volkswagen","MU6130972483615367444264374363",6),
  ("ante bibendum ullamcorper.","86.63","Fiat","GT67675310044878725225616029",4),
  ("iaculis enim, sit","65.50","Audi","AD4018888971285120468659",12),
  ("ultricies sem magna nec quam.","92.63","General Motors","SI88762856356953622",6),
  ("vehicula. Pellentesque tincidunt","80.01","Suzuki","EE186348484463024733",11),
  ("nulla. Integer","27.91","Audi","MR9181196977254084934113054",3),
  ("at, iaculis quis, pede.","57.07","Suzuki","FI7134753113265006",9),
  ("Quisque imperdiet, erat nonummy","38.58","General Motors","SE2763582275673098215814",4),
  ("Quisque fringilla","34.21","Fiat","CR3976490082511168301",6),
  ("scelerisque dui. Suspendisse","57.74","Volkswagen","MC5566975724188814554633115",9),
  ("pede, ultrices a,","52.23","Peugeot","LB92764459638447875373945475",4),
  ("pellentesque. Sed dictum. Proin","60.34","Suzuki","BG23XEBN82018540173773",13),
  ("lorem eu metus. In","32.39","Ford","HR8824094189514576328",9),
  ("dui. Cum sociis natoque","27.08","Peugeot","FO8269640623774666",6);


  -- -----------------------------------------------------------
  -- catalogo servicos
  INSERT INTO Catalogo_Servicos (Descricao,Valor_unitario,Duracao_servico)
VALUES
  ("sem ut","44.49",6),
  ("leo. Vivamus","64.94",7),
  ("et ultrices","21.54",1),
  ("diam dictum","46.88",5),
  ("penatibus et magnis dis","88.06",1),
  ("nunc.","12.99",5),
  ("lectus","49.40",5),
  ("Vivamus","53.40",1),
  ("aliquet odio. Etiam","65.27",2),
  ("ac","10.52",4),
  ("velit. Sed malesuada augue","4.28",9),
  ("Sed","53.22",5),
  ("ipsum primis in","93.14",6),
  ("consequat enim diam vel","14.78",3),
  ("sodales purus, in molestie","85.65",2),
  ("Phasellus","76.73",1),
  ("egestas, urna justo","70.72",3),
  ("Integer tincidunt","59.73",5),
  ("ornare tortor","65.74",8),
  ("cubilia Curae Donec","78.78",10);

  
  
  
-- -----------------------------------
-- ordens de servico
INSERT INTO ordem_servico (Equipes_idEquipes,Data_emissao,Data_conclusao,Liberada_para_executar,Veiculos_idVeiculos,Clientes_idClientes,Vl_cobrado_total_ordem,Porcentagem_diferenca,Forma_pagamento)
VALUES
  (4,"2021-10-30","2021-09-25","0",9,19,"877","4.77","Pix"),
  (3,"2021-09-29","2021-10-05","0",3,5,"900","8.48","boleto"),
  (1,"2021-09-13","2021-10-07","0",17,1,"981","8.69","Pix"),
  (2,"2021-10-31","2021-09-20","1",12,14,"569","4.01","Cartão de Crédito"),
  (2,"2021-09-03","2021-09-28","1",2,7,"177","11.81","boleto"),
  (2,"2021-09-03","2021-09-28","1",5,7,"177","11.81","boleto");
  
  -- --------------------------------------------
  
--  lista_de_servicos_da_os
INSERT INTO lista_de_servicos_da_os (Catalogo_servicos_idCatalogo_servicos,Ordem_servico_idOrdem_servico,Qtd_servico,Valor_cobrado_unitario,Servico_autorizado)
VALUES
  (10,3,1,"63.60","1"),
  (12,5,2,"76.46","0"),
  (11,2,1,"36.72","1"),
  (6,2,2,"61.62","0"),
  (1,1,0,"89.50","1"),
  (6,1,2,"19.34","1"),
  (5,1,0,"69.89","0"),
  (11,3,2,"32.91","1"),
  (9,6,1,"80.61","1"),
  (7,4,0,"86.35","0"),
  (17,6,1,"89.86","0"),
  (3,5,1,"35.83","0"),
  (15,5,2,"41.64","0"),
  (13,3,3,"2.58","1"),
  (9,1,2,"55.13","1");


 -- --------------------------------------------
  
--  lista_de_pecas_da_os
INSERT INTO lista_de_pecas_da_os (Catalogo_pecas_idCatalogo_pecas,Ordem_servico_idOrdem_servico,Qtd_pecas,Valor_cobrado_unitario,peca_autorizada)
VALUES
  (10,3,1,"63.60","1"),
  (12,5,2,"76.46","1"),
  (11,2,1,"36.72","1"),
  (6,2,2,"61.62","0"),
  (1,1,0,"89.50","1"),
  (6,1,2,"19.34","1"),
  (5,1,0,"69.89","0"),
  (11,3,2,"32.91","1"),
  (9,6,1,"80.61","1"),
  (7,4,0,"86.35","0"),
  (17,6,1,"89.86","0"),
  (3,5,1,"35.83","0"),
  (15,5,2,"41.64","0"),
  (13,3,3,"2.58","1"),
  (9,1,2,"55.13","1");


