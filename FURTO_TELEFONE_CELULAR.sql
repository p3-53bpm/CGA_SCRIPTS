SELECT OCO.numero_ocorrencia, -- NÚMERO DA OCORRÊNCIA
OCO.data_hora_fato, -- DATA HORA DO FATO
MAO.tipo_objeto_codigo,  -- CÓDIGO DO TIPO DO OBJETO
MAO.tipo_objeto_descricao,  -- DESCRIÇÃO DO TIPO DO OBJETO
MAO.situacao_codigo,  -- CÓDIGO DA SITUAÇÃO DO MATERIAL APREENDIDO
MAO.situacao_descricao, -- DESCRIÇÃO DA SITUAÇÃO DO MATERIAL APREENDIDO
MAO.cor, -- COR DO MATERIAL
MAO.marca, -- MARCA DO MATERIAL
MAO.modelo, -- MODELO DO MATERIAL
MAO.informacao_complementar,  -- INFORMAÇÃO COMPLEMENTAR REFERENTE AO MATERIAL 
OCO.numero_endereco, -- Nº DO ENDEREÇO DO FATO
OCO.logradouro_nome, -- LOGRADOURO DO FATO
OCO.nome_bairro, -- BAIRRO DO FATO
OCO.nome_municipio, -- MUNICÍPIO DO FATO
OCO.numero_latitude, -- LATITUDE
OCO.numero_longitude  -- LONGITUDE
FROM tb_ocorrencia OCO
INNER JOIN tb_material_apreendido_ocorrencia MAO
ON OCO.numero_ocorrencia = MAO.numero_ocorrencia 
WHERE YEAR(OCO.data_hora_fato) = 2024 -- FILTRA O ANO DO FATO
 AND OCO.relator_sigla_orgao = 'PM' -- FILTRA OCORRÊNCIAS RELATADAS PELA POLÍCIA MILITAR
 AND OCO.ocorrencia_uf = 'MG' -- FILTRA OCORRÊNCIAS NO ESTADO DE MINAS GERAIS
 AND OCO.descricao_estado = 'FECHADO'  -- FILTRA APENAS OCORRÊNCIAS FECHADAS
 AND OCO.natureza_codigo = 'C01155' -- FILTRA CÓDIGO ESPECÍFICO DE NATUREZA DA OCORRÊNCIA (FURTO)
 AND MAO.tipo_objeto_codigo = '0902' -- FILTRA CÓDIGO ESPCÍFICO DE TIPO DO OBJETO (TELEFONE CELULAR)
 AND MAO.situacao_codigo = '0500' -- FILTRA CÓDIGO ESPCÍFICO DE SITUAÇÃO (FURTADO / ROUBADO (NAO RECUPERADO))
-- AND OCO.nome_municipio LIKE '%XXXXXX%' -- FILTRE A CIDADE
-- AND OCO.unidade_area_militar_nome LIKE '%/xxx BPM%' -- FILTRE A CIA/BPM/RPM 
 ORDER BY OCO.nome_municipio, OCO.nome_bairro -- ORDERNA O NOME DO MUNICÍPIO E O BAIRRO 
 
