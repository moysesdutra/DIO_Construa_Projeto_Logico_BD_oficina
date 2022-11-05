USE Oficina ;

-- listando os veiculos de um cliene
select c.idclientes, p.Nome, p.telefone, v.marca, v.modelo, v.placa  from pessoa p 
inner join clientes c on c.Pessoa_idPessoa = p.idPessoa
inner join veiculos v on v.Clientes_idClientes = c.idClientes
order by 2,4 ;

-- ------------------------------
-- mostrando as ordens de servico dos clientes que iniciam com a letra G

select c.idclientes, p.Nome, p.telefone, v.marca, v.modelo, v.placa , os.Data_emissao, os.Data_Conclusao from pessoa p 
inner join clientes c on c.Pessoa_idPessoa = p.idPessoa
inner join veiculos v on v.Clientes_idClientes = c.idClientes
inner join ordem_servico os on os.Clientes_idClientes = c.idclientes and os.Veiculos_idVeiculos = v.idVeiculos
where p.nome like 'G%';


-- ------------------------------
-- mostrando o valor  de pecas e servicos das ordens de servico dos clientes (caso tenham peças ou servicos

select c.idclientes, p.Nome, p.telefone, v.marca, v.modelo, v.placa , 
	   os.Data_emissao, os.Data_Conclusao, sos.Qtd_servico ,  
       sos.Valor_cobrado_Unitario *sos.Qtd_servico  as vl_servicos,
       pos.QTD_pecas, 
       pos.QTD_pecas * pos.Valor_cobrado_Unitario as vl_pecas from pessoa p 
inner join clientes c on c.Pessoa_idPessoa = p.idPessoa
inner join veiculos v on v.Clientes_idClientes = c.idClientes
inner join ordem_servico os on os.Clientes_idClientes = c.idclientes and os.Veiculos_idVeiculos = v.idVeiculos
left outer join lista_de_pecas_da_os pos on pos.Ordem_servico_idOrdem_servico = os.idOrdem_servico
left outer join lista_de_servicos_da_os sos on sos.Ordem_servico_idOrdem_servico = os.idOrdem_servico
order by 2, 7
;

-- ----------------------------------------------------------------
-- listando a quantidade de ordens liberadas e não liberadas
select count(*) as qtd, Liberada_para_executar  from ordem_servico 
group by Liberada_para_executar;


-- -----------------------------------------------------------
--  identifcando os clientes que ainda nao liberaram a execução das ordens de servico

select c.idclientes, p.Nome, p.telefone, concat(v.Placa, ' - ',v.Modelo, ' - (' ,v.ano,')') as Veiculo from pessoa p 
inner join clientes c on c.Pessoa_idPessoa = p.idPessoa
inner join veiculos v on v.Clientes_idClientes = c.idClientes
inner join ordem_servico os on os.Clientes_idClientes = c.idclientes and os.Veiculos_idVeiculos = v.idVeiculos
where os.Liberada_para_executar = 0
order by v.ano desc;

-- ----------------------------------------------------------
-- Identificando ordens de servico com mais de 3 itens sem liberação (peças ou serviços)

select os.idOrdem_servico, c.idclientes, p.Nome, p.telefone, concat(v.Placa, ' - ',v.Modelo, ' - (' ,v.ano,')') as Veiculo from pessoa p 
inner join clientes c on c.Pessoa_idPessoa = p.idPessoa
inner join veiculos v on v.Clientes_idClientes = c.idClientes
inner join ordem_servico os on os.Clientes_idClientes = c.idclientes and os.Veiculos_idVeiculos = v.idVeiculos
where os.idOrdem_servico in 
	(select os.idOrdem_servico from pessoa p 
	inner join clientes c on c.Pessoa_idPessoa = p.idPessoa
	inner join veiculos v on v.Clientes_idClientes = c.idClientes
	inner join ordem_servico os on os.Clientes_idClientes = c.idclientes and os.Veiculos_idVeiculos = v.idVeiculos
	left outer join lista_de_pecas_da_os pos on pos.Ordem_servico_idOrdem_servico = os.idOrdem_servico
	left outer join lista_de_servicos_da_os sos on sos.Ordem_servico_idOrdem_servico = os.idOrdem_servico
	where pos.Peca_autorizada = 0 or sos.Servico_autorizado = 0
	group by  os.idOrdem_servico
	having count(*) >=3) -- pelo menos tres itens (pecas ou servicos) sem liberacao
order by 3,v.ano desc;

