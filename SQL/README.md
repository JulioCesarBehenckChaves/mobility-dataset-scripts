# SQL scripts explained

## Extraction of cell phone users' permanence locations

We've created a new table (ultima_posicao_dias) to get the last detected position of each user per day.

### IN
Relevant users, positions of cell phone towers and CDRs.

### OUT
List of locations (PARTICAO_GEOGRAFIA=geographic partitioning) where the users was detected according to the established parameters.

### Parameters
Sundays, public holidays and the time period when most people are considered to be at home.

```
CREATE TABLE ultima_posicao_dias
AS
    SELECT a.ID,
        dt_ini_atividade_rede AS dia,
        MAX (hr_ini_atividade_rede) AS MAX_HORA,
        PARTICAO_GEOGRAFIA
FROM CDR a
        INNER JOIN LAT_LONG_LOCAL b
    ON a.longitude = b.longitude AND a.latitude = b.latitude
        INNER JOIN ligadores_significativos c
    ON c.ID = a.ID
WHERE    -- any time on holydays
    dt_ini_atividade_rede IN (SELECT dia
                    FROM feriado)
        OR        -- any time on sundays
    EXTRACT (dow FROM dt_ini_atividade_rede) = 7
        OR        -- only between 7pm and 6am on workdays
    (   EXTRACT (HOUR FROM hr_ini_atividade_rede) > 19
        OR EXTRACT (HOUR FROM hr_ini_atividade_rede) < 6)
GROUP BY a.ID,
        dt_ini_atividade_rede,
        PARTICAO_GEOGRAFIA; 
```


## Number of days in the most visited place

SQL statement to extract the most visited location per user.
We've created a new table (contar_dias_em_locais) to count the days based on the previous created table ultima_posicao_dias.

### IN

List of users and all the places they frequent.

### OUT 
Number of days that the user was found in the place where he/she frequented the most.

### Parameter
NA.

```
CREATE TABLE contar_dias_em_locais
AS
	SELECT ID, SUM (n_dias) AS total_dias_em_locais
	FROM (  SELECT ID,
		PARTICAO_GEOGRAFIA,
		COUNT (DIA) AS n_dias
		FROM ultima_posicao_dias
		GROUP BY ID, PARTICAO_GEOGRAFIA)
		AS ultima_posicao
GROUP BY ID
order by ID, total_dias_em_locais;
```

## Calculation of presumed residence per user
SQL statement to infer the geographic partition of household.

### IN

Total days in places most visited by users.

### OUT

Calculation of presumed place of residence of users.

### Parameter

Proportional number of days in the most visited place given by total_dias_em_locais >= 8 and total_dias_em_locais / 2.

```
CREATE TABLE residencia_presumida
AS
	WITH residencia_presumida_bruta
	AS (SELECT ID, PARTICAO_GEOGRAFIA, MAX (n_dias) AS dias_local_mais_visitado
		FROM ( -- Counts the number of days per place of stay per ID
		SELECT   ID, PARTICAO_GEOGRAFIA, COUNT (DIA) AS n_dias
			FROM
			ultima_posicao_dias
		GROUP BY ID, PARTICAO_GEOGRAFIA)
			AS ultima_posicao
group by ID, PARTICAO_GEOGRAFIA)
select ID, PARTICAO_GEOGRAFIA, dias_local_mais_visitado, total_dias_em_locais
FROM
(
SELECT T1.ID,
	T1.PARTICAO_GEOGRAFIA,
	T1.dias_local_mais_visitado,
	T2.total_dias_em_locais
FROM residencia_presumida_bruta T1
INNER JOIN contar_dias_em_locais T2 ON T2.ID=T1.ID
) AS residencia_presumida_validacao
where total_dias_em_locais >= 8
	and dias_local_mais_visitado > total_dias_em_locais / 2;
```

## Calculation of the fixed population expansion factor

We have data from one cell phone operator, which means only a market share. We need to expand the cell phone user to represent a brazilian citizen. We did a 'geographic' join with the census database (base_IBGE).

### IN

Presumed place of residence of users and IBGE population base.

### OUT

Fixed population expansion factor.

### Parameter
NA.

```
create table fator_k_l as
select 
r.PARTICAO_GEOGRAFIA,
count(r.ID) as USU,
POP,
POP/count(r.ID) as k_l
from
residencia_presumida r
inner join base_IBGE i
	on i.PARTICAO_GEOGRAFIA = r.PARTICAO_GEOGRAFIA
group by r.PARTICAO_GEOGRAFIA, POP;
```

## Adaptive population expansion factor



### IN

### OUT

### Parameter

 

\hrulefill \\
  Entrada: Viagens ``puras'', ou seja, sem fator de expans\~ao algum. \\
  Par\^ametro: -\\
  Saida: Viagens realizadas por dia pelos residentes de $l$.
%[gobble=2, numbers=left, frame=lines, label=Viagens realizadas por dia pelos residentes de l, labelposition=topline,fontfamily=helvetica, fontsize=\small,samepage=false]
 \begin{verbatim}
    create table julio.viajantes_dia_l as
      select cast(dia as date) as dia, 
      local_residência, sum(viagens) as viagens 
    from julio.matriz_od_transiente_viagens_purasn 
    group by dia, local_residência order by dia, local_residência;
\end{verbatim}


### IN

### OUT

### Parameter
  Entrada: Viagens realizadas por dia pelos residentes de $l$. \\
  Par\^ametro: -\\
  Saida: \#Viagens expandidas adaptativamente \`a $OD$ e \`a $d$.
%[gobble=2, numbers=left, frame=lines, label=Viagens expandidas adaptativamente, labelposition=topline,fontfamily=helvetica, fontsize=\small,samepage=false]
 \begin{verbatim}
    create table julio.viagens_adaptativas as
    select
    dia, origem, destino,sum(viagens_OD_feitas_por_l) as viagens_feitas_por_l,
    sum(viagens_adaptativas) as viagens_adaptativas
    from (
    select
      a.dia,
      a.local_residência as l,
      a.origem, a.destino,
      a.viagens as viagens_OD_feitas_por_l,
      b.viagens as total_de_viagens_d_l,
      c.pop_censo as pop_l,
      ceil((a.viagens/b.viagens)*(c.pop_censo)) as viagens_adaptativas
    from
      julio.matriz_od_transiente_viagens_purasn a inner join
      julio.viajantes_dia_l b on a.dia=b.dia and 
      b.local_residência=a.local_residência inner join
      julio.local_pop_usu c on c.nm_grao = a.local_residência
    order by
      a.dia, a.local_residência,
      a.origem,
      a.destino
    ) as s0
    group by dia, origem, destino
    order by dia, origem, destino;
\end{verbatim}


\subsection{Viagens por dia}


### IN

### OUT

### Parameter

  Entrada: Local de resid\^encia presumida dos usu\'arios, base de CDR e base de torres de telefonia. \\
  Par\^ametro: O dia, o intervalo temporal entre as chamadas e a dist\^ancia percorrida.\\
  Saida: Quantidade de deslocamentos entre todas as origens e destino por dia.
%[gobble=2, numbers=left, frame=lines, label=Viagens por dia com k-fixo, labelposition=topline,fontfamily=helvetica, fontsize=\small,samepage=false]
 \begin{verbatim}
    insert into julio.deslocamentos_dia_k
    SELECT '2014-01-01' AS dia,
	  origem,
	  destino,
	  sum(deslocamentos) as deslocamentos
    FROM (
    SELECT 
	  origem,
	  destino,
	  Count(*) as deslocamentos
    FROM   (SELECT id,
		  datahora,
		  salto,
		  origem,
		  destino,
		  ocoord,
		  dcoord,
		  minsbetween
	    FROM   (SELECT id,
			  datahora,
			  salto,
			  origem,
			  destino,
			  ocoord,
			  dcoord,
			  Round(Distance(Cast(Substr(ocoord, 0, Instr(ocoord, ','))
					      AS
					      FLOAT), Cast
				(
				      Substr(ocoord, Instr(ocoord, ',') + 1,
				      Length(ocoord))AS
				      FLOAT),
				Cast(
				      Substr(dcoord, 0, Instr(dcoord, ','))AS FLOAT
				), Cast
				(
				      Substr(dcoord, Instr(dcoord, ',') + 1,
				      Length(dcoord))AS
				      FLOAT)), 3)
							AS km_distance,
			  Datediff(mi, hora, nexthour) AS minsbetween
		    FROM   (SELECT id,
				  datahora,
				  salto,
				  hora,
				  Lead(hora, 1)
				    OVER (
				      partition BY id
				      ORDER BY datahora) AS nexthour,
				  local                  AS Origem,
				  Lead(local, 1)
				    OVER (
				      partition BY id
				      ORDER BY datahora) AS Destino,
				  coord                  AS OCoord,
				  Lead(coord, 1)
				    OVER (
				      partition BY id
				      ORDER BY datahora) AS DCoord
			    FROM   (SELECT ddd_orig
					  || id1                   AS id,
					  Upper(b.nm_grao)         AS local,
					  b.latitude
					  || ','
					  || b.longitude           AS coord,
					  dt_ini_atividade_rede
					  || '_'
					  || hr_ini_atividade_rede AS datahora,
					  hr_ini_atividade_rede    AS hora,
					  Conditional_change_event(b.latitude
								    || ','
								    || b.longitude)
					    OVER (
					      partition BY ddd_orig||id1
					      ORDER BY ddd_orig||id1,
					    dt_ini_atividade_rede||'_'||
					    hr_ini_atividade_rede)
								    AS salto
				    FROM   bill_quando_onde_j a
					  INNER JOIN julio.lat_long_local b
						  ON a.longitude = b.longitude
						      AND a.latitude = b.latitude
					  LEFT OUTER JOIN julio.residencia_presumida r
						  ON r.cod = a.ddd_orig||a.id1
					  INNER JOIN julio.local_pop_usu c
						  ON c.nm_grao = r.nm_grao
				    WHERE  dt_ini_atividade_rede = '2014-01-01'
				    ORDER  BY ddd_orig
					      || id1,
					      salto,
					      dt_ini_atividade_rede
					      || '_'
					      || hr_ini_atividade_rede,
					      b.nm_grao) AS salto)AS grouped)AS
		  grouped2
	    WHERE  ocoord != dcoord
		  AND km_distance > 2
		  AND minsbetween > 30
		  AND minsbetween < 240) AS grouped3
    GROUP  BY origem,
	      destino, k) as LAST
    GROUP BY origem, destino;
\end{verbatim}


### IN

### OUT

### Parameter

  Entrada: Local de resid\^encia presumida dos usu\'arios, base de CDR e base de torres de telefonia e fatores de expans\~ao fixo. \\
  Par\^ametro: -\\
  Saida: Quantidade de deslocamentos da popula\c{c}\~ao, entre todas as origens e destino por dia. \end{small} 
%[gobble=2, numbers=left, frame=lines, label=Viagens por dia com k-fixo, labelposition=topline,fontfamily=helvetica, fontsize=\small,samepage=false]
  \begin{verbatim}
    SELECT 
	  origem,
	  destino,
	  Count(*) * k_fixo as viagens_k_fixo,
	  dia
    FROM  ...
		 ...  SELECT 
		      ...
                        c.k                      AS k_fixo,
                        dt_ini_atividade_rede AS dia,
		      ...
                      FROM  CDR a
                                       INNER JOIN lat_long_local b
                                               ON a.longitude = b.longitude
                                                  AND a.latitude = b.latitude
                                       INNER  JOIN residencia_presumida r
                                               ON r.ID = a.ID 
                                        INNER JOIN fator_k_l c
                                               ON c.PARTICAO_GEOGRAFIA = 
                                               r.PARTICAO_GEOGRAFIA
\end{verbatim}


### IN

### OUT

### Parameter

  Entrada: Local de resid\^encia presumida dos usu\'arios, base de CDR e base de torres de telefonia e fatores de expans\~ao adaptativo. \\
  Par\^ametro: -\\
  Saida: Quantidade de deslocamentos da popula\c{c}\~ao, entre todas as origens e destino por dia. \end{small} 
%[gobble=2, numbers=left, frame=lines, label=Viagens por dia com k-adaptativo, labelposition=topline,fontfamily=helvetica, fontsize=\small,samepage=false]  
  \begin{verbatim}
    SELECT 
	  origem,
	  destino,
	  Count(*) * k_adaptativo as viagens_k_adaptativo,
	  dia
    FROM  ...
		 ...  SELECT 
		      ...
                        c.k                      AS k_adaptativo,
                        dt_ini_atividade_rede AS dia,
		      ...
                      FROM  CDR a
                                       INNER JOIN lat_long_local b
                                               ON a.longitude = b.longitude
                                                  AND a.latitude = b.latitude
                                       INNER  JOIN residencia_presumida r
                                               ON r.ID = a.ID 
                                        INNER JOIN fator_k_l_d c
                                               ON c.PARTICAO_GEOGRAFIA = 
                                               r.PARTICAO_GEOGRAFIA
                                               and c.DIA = a.dt_ini_atividade_rede
\end{verbatim}

  
### IN

### OUT

### Parameter  

  Entrada: Local de resid\^encia presumida dos usu\'arios, base de CDR e base de torres de telefonia. \\
  Par\^ametro: O intervalo espa\c{c}o-temporal do evento, atrav\'es das tabelas EVENTO e EVENTO\_LATLNG.\\
  Saida: Descoberta de usu\'arios que estavam no evento. \end{small}
%[gobble=2, numbers=left, frame=lines, label=Usu\'arios no evento, labelposition=topline,fontfamily=helvetica, fontsize=\small,samepage=false]  
 \begin{verbatim}
    create table EVENTO_REVEILLON2014_DENTRO as
    select ID , a.latlng 
    from CDR a inner join EVENTO_LATLNG b on 
      a.LAT_LNG=b.LAT_LNG inner join EVENTO c on 
      b.ID_EVENTO=c.ID_EVENTO inner join residencia_presumida d on
      d.ID = a.ID
    where 
    ((
      DT_INI_ATIVIDADE_REDE in (
	cast(date_part('year',c.inicio)||'-'||date_part('month',c.inicio)||'-'||
	date_part('day',c.inicio) as date)
	) 
	and HR_INI_ATIVIDADE_REDE > cast(date_part('hour',c.inicio)||':'||
	date_part('minute',c.inicio)||':'||date_part('second',c.inicio) as time)
    ) 
    and
    (
      DT_INI_ATIVIDADE_REDE in (
	cast(date_part('year',c.fim)||'-'||date_part('month',c.fim)||'-'||
	date_part('day',c.fim) as date)
	) 
	and HR_INI_ATIVIDADE_REDE < cast(date_part('hour',c.fim)||':'||
	date_part('minute',c.fim)||':'||date_part('second',c.fim) as time)
    ))
    and b.ID_EVENTO = 'REVEILLON2014'
    group by ID,  a.LAT_LNG;
\end{verbatim}


### IN

### OUT

### Parameter

  Entrada: Local de resid\^encia presumida dos usu\'arios, base de CDR e base de torres de telefonia. \\
  Par\^ametro: O intervalo espa\c{c}o-temporal do evento, atrav\'es das tabelas EVENTO e \-  EVENTO\_LATLNG.\\
  Saida: Descoberta de usu\'arios que estavam no evento. \end{small}
%[gobble=2, numbers=left, frame=lines, label=Usu\'arios fora do evento, labelposition=topline,fontfamily=helvetica, fontsize=\small,samepage=false]  
 \begin{verbatim}
      create table EVENTO_REVEILLON2014_FORA as
      select a.ID , a.latlng 
      from CDR a FULL OUTER join EVENTO_LATLNG b on 
	a.LAT_LNG=b.LAT_LNG inner join EVENTO c on 
	b.ID_EVENTO=c.ID_EVENTO inner join residencia_presumida d on
	d.ID = a.ID
      where 
      ((
	DT_INI_ATIVIDADE_REDE in (
	  cast(date_part('year',c.inicio)||'-'||date_part('month',c.inicio)||'-'||
	  date_part('day',c.inicio) as date)
	  ) 
	  and HR_INI_ATIVIDADE_REDE > cast(date_part('hour',c.inicio)||':'||
	  date_part('minute',c.inicio)||':'||date_part('second',c.inicio) as time)
      ) 
      and
      (
	DT_INI_ATIVIDADE_REDE in (
	  cast(date_part('year',c.fim)||'-'||date_part('month',c.fim)||'-'||
	  date_part('day',c.fim) as date)
	  ) 
	  and HR_INI_ATIVIDADE_REDE < cast(date_part('hour',c.fim)||':'||
	  date_part('minute',c.fim)||':'||date_part('second',c.fim) as time)
      ))
      and b.ID_EVENTO = 'REVEILLON2014'
      and a.LAT_LNG is null and b.LAT_LNG is null
      group by ID,  a.LAT_LNG;
\end{verbatim}


### IN

### OUT

### Parameter

  Entrada: Local de resid\^encia presumida dos usu\'arios, base de CDR, base de torres de telefonia. \\
  Par\^ametro: Torres de telefonia que atenderam o evento.\\
  Saida: Quantidade de visitantes em eventos, assim como as regi\~oes de origem inferida. \end{small}
 %[gobble=2, numbers=left, frame=lines, label=Quantidade de visitantes em eventos, labelposition=topline,fontfamily=helvetica, fontsize=\small,samepage=false]
 \begin{verbatim}
	  select
	    a.dia as "DATA",
	    grao as cod_ibge, 
	    nm_grao as "LOCAL", 
	    nm_municip as "MUNICÍPIO",
	    zona as "ZONA",
	    pop_censo as "POPULAÇÃO", 
	    pop_usu as "USUÁRIOS", 
	    substring(
		    centroide,1,(strpos(centroide, ' ') -1)	
		    ) as "LONGITUDE",
	    substring(
		    centroide,(strpos(centroide, ' ') +1)
		    ) as "LATITUDE",
	    praia as "DESTINO", 
	    substring(
		    centroide_ev,1,(strpos(centroide_ev, ',') -1)	
		    ) as "LAT_PRAIA",
	    substring(
		    centroide_ev,(strpos(centroide_ev, ',') +1)
		    ) as "LONG_PRAIA",
	    Distance_meters as "DISTÂNCIA(m)",
	    a.TX_DETEC as "TAXA",
	    a.Total_detectado as "TOTAL",
	    a.usuarios_in As "IN",
		((cast(a.usuarios_in as double precision))
		  /cast(a.Total_detectado as double precision)) as "PROB",
	    (((cast(a.usuarios_in as double precision))
	    /cast(a.Total_detectado as double precision))
	    * pop_censo) as "VISITANTES"
	  from
	    pop_usu_resultado_cruz a 
		    inner join "Area21Grao_v2w_ev" b 
	    on a.local=b.grao
	  order by 
	    nm_grao;
\end{verbatim}
