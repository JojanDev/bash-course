#! /bin/bash 

# Consulta mysql
query=$(cat <<EOF
use siebase;
SELECT 
    REPLACE(s.codigosuc, 'SUC', '') as codigosuc, 
    s.nombresuc nombre_sucursal, 
    es.estado,
    COALESCE(s.celular,'-') numero_contacto,
    COALESCE((SELECT valor FROM ProductocamposValores WHERE relacion_fk = s.dk AND productocampos_fk = 30 LIMIT 1),'-') correo_contacto,
    COALESCE( NULLIF(CONCAT_WS(' ', e.primernombre, e.segundonombre, e.primerapellido, e.segundoapellido), ''), '-') AS supervisor,
    COALESCE(linea.linea,'-') telefono_supervisor,
    COALESCE(pcvsuperv.valor,'-') correo_supervisor,
    REPLACE(r.nombre,'REGION ','') region_sucursal,
    REPLACE(d.nombredep,'DEPOSITO ','') deposito_region,
    REPLACE(z.nombresuper,'SUPERV ','') zona_supervision
FROM siebase.sucursal s 
LEFT JOIN zonasupervision z ON z.dk = s.zonasupervision_LINK
LEFT JOIN siebase.departamento dto ON dto.dk = s.departamento_link
LEFT JOIN empleado e on e.zonasupervision_link = s.zonasupervision_LINK AND e.cargoempleado_OID IN (select dk from cargoempleado cc where cc.zonasupervisor = 'SI') and e.estadoempleado_OID = 115342
LEFT JOIN ( select empleado_OID, group_concat(num_linea) linea  from lineastelefonicascorpotarivas where empleado_OID is not null  group by empleado_OID ) linea on linea.empleado_OID = e.dk
LEFT JOIN ProductocamposValores pcvsuperv on pcvsuperv.relacion_fk = e.dk and pcvsuperv.productocampos_fk = 75
LEFT JOIN regionsucursal r ON r.dk = s.regionsucursal_OID
LEFT JOIN deposito d ON d.Dk = r.depositoRH_OID
INNER JOIN siebase.estado es ON s.estado_OID = es.Dk 
WHERE es.estado = 'ACTIVO' AND s.aliada = 'NO' AND s.codigosuc NOT LIKE '%DOM%' AND s.codigosuc NOT LIKE '%VIR%' LIMIT 10;
EOF
)

request=$(mysql -u practicante_jsdm -paan0Hr422SGhyPp7jIPrmC1u -h10.25.3.18 -B siebase -e "$query")
request=$(echo "$request" | sed 's/\t/;/g')

while read line
do
codigosuc=$(echo "$line" | cut -d ';' -f 1)
nombre_sucursal=$(echo "$line" | cut -d ';' -f 2)
estado=$(echo "$line" | cut -d ';' -f 3)
numero_contacto=$(echo "$line" | cut -d ';' -f 4)
correo_contacto=$(echo "$line" | cut -d ';' -f 5)
supervisor=$(echo "$line" | cut -d ';' -f 6)
telefono_supervisor=$(echo "$line" | cut -d ';' -f 7)
correo_supervisor=$(echo "$line" | cut -d ';' -f 8)
region_sucursal=$(echo "$line" | cut -d ';' -f 9)
deposito_region=$(echo "$line" | cut -d ';' -f 10)
zona_supervision=$(echo "$line" | cut -d ';' -f 11)

echo "$codigosuc | $nombre_sucursal | $estado | $numero_contacto | $correo_contacto | $supervisor | $telefono_supervisor | $correo_supervisor | $region_sucursal | $deposito_region | $zona_supervision"

done <<< "$request"


# echo $request