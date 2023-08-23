
# Geospatial SQL

We used shapefiles to deal with spatial data. We loaded shapefiles as tables in the SGBD and used spatial functions.

The statement bellow returns the Lat/Long from the centroid of a polygon.

```SQL
SELECT ST_AsText(STV_Geography(ST_Centroid(STV_Geometry(geom)))) FROM Limite_RP;
```

The statements bellow are generating an output with the name of a municipality given by a lat/long point. The points are cellphone towers, which we had to address to a municipality.

```SQL
SELECT upper(NM_MUNICIP), ' -42,74361 ',' -22,26043 ' 
FROM IBGE33MUE250GC_SIR as A
WHERE ST_Intersects(ST_GeomFromText('POINT ( -42.74361   -22.26043 )', 4269), geom);
SELECT upper(NM_MUNICIP), ' -43,12380 ',' -22,89640 ' 
FROM IBGE33MUE250GC_SIR as A
WHERE ST_Intersects(ST_GeomFromText('POINT ( -43.12380   -22.89640 )', 4269), geom);
SELECT upper(NM_MUNICIP), ' -58,39250 ',' -62,08528 ' 
FROM IBGE33MUE250GC_SIR as A
WHERE ST_Intersects(ST_GeomFromText('POINT ( -58.39250   -62.08528 )', 4269), geom);
SELECT upper(NM_MUNICIP), ' -42,17960 ',' -22,31950 ' 
FROM IBGE33MUE250GC_SIR as A
WHERE ST_Intersects(ST_GeomFromText('POINT ( -42.17960   -22.31950 )', 4269), geom);
SELECT upper(NM_MUNICIP), ' -44,55132 ',' -22,33162 ' 
FROM IBGE33MUE250GC_SIR as A
WHERE ST_Intersects(ST_GeomFromText('POINT ( -44.55132   -22.33162 )', 4269), geom);
SELECT upper(NM_MUNICIP), ' -43,12226 ',' -22,90081 ' 
FROM IBGE33MUE250GC_SIR as A
WHERE ST_Intersects(ST_GeomFromText('POINT ( -43.12226   -22.90081 )', 4269), geom);
SELECT upper(NM_MUNICIP), ' -42,36132 ',' -21,97736 ' 
FROM IBGE33MUE250GC_SIR as A
WHERE ST_Intersects(ST_GeomFromText('POINT ( -42.36132   -21.97736 )', 4269), geom);
SELECT upper(NM_MUNICIP), ' -43,42036 ',' -22,34703 ' 
FROM IBGE33MUE250GC_SIR as A
WHERE ST_Intersects(ST_GeomFromText('POINT ( -43.42036   -22.34703 )', 4269), geom);
SELECT upper(NM_MUNICIP), ' -42,35172 ',' -22,87330 ' 
FROM IBGE33MUE250GC_SIR as A
WHERE ST_Intersects(ST_GeomFromText('POINT ( -42.35172   -22.87330 )', 4269), geom);
SELECT upper(NM_MUNICIP), ' -43,40726 ',' -22,34972 ' 
FROM IBGE33MUE250GC_SIR as A
WHERE ST_Intersects(ST_GeomFromText('POINT ( -43.40726   -22.34972 )', 4269), geom);
SELECT upper(NM_MUNICIP), ' -42,93800 ',' -22,97227 ' 
FROM IBGE33MUE250GC_SIR as A
WHERE ST_Intersects(ST_GeomFromText('POINT ( -42.93800   -22.97227 )', 4269), geom);
SELECT upper(NM_MUNICIP), ' -43,35110 ',' -22,79690 ' 
FROM IBGE33MUE250GC_SIR as A
WHERE ST_Intersects(ST_GeomFromText('POINT ( -43.35110   -22.79690 )', 4269), geom);
SELECT upper(NM_MUNICIP), ' -43,70917 ',' -22,73317 ' 
FROM IBGE33MUE250GC_SIR as A
WHERE ST_Intersects(ST_GeomFromText('POINT ( -43.70917   -22.73317 )', 4269), geom);
SELECT upper(NM_MUNICIP), ' -44,24579 ',' -22,99762 '
FROM IBGE33MUE250GC_SIR as A
WHERE ST_Intersects(ST_GeomFromText('POINT ( -44.24579   -22.99762 )', 4269), geom);
SELECT upper(NM_MUNICIP), ' -42,86969 ',' -22,34460 '
FROM IBGE33MUE250GC_SIR as A
WHERE ST_Intersects(ST_GeomFromText('POINT ( -42.86969   -22.34460 )', 4269), geom);
SELECT upper(NM_MUNICIP), ' -43,12382 ',' -22,89573 '
FROM IBGE33MUE250GC_SIR as A
WHERE ST_Intersects(ST_GeomFromText('POINT ( -43.12382   -22.89573 )', 4269), geom);
SELECT upper(NM_MUNICIP), ' -43,10900 ',' -22,91178 '
FROM IBGE33MUE250GC_SIR as A
WHERE ST_Intersects(ST_GeomFromText('POINT ( -43.10900   -22.91178 )', 4269), geom);
```