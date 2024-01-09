SELECT
X.whno,
X.notedate,
X.noteno,
X.CUSNO ,
SUM(NOTEAMT) AS NOTEAMT,
SUM(SAPAMT)  AS SAPAMT
FROM(
select
m.whno,
m.notedate,
m.noteno,
c.cusno_new as cusno,
d.NOTEAMT AS NOTEAMT,
0 AS SAPAMT
from nrnotedS m
left join nrnotedd d ON m.noteno = d.noteno 
left join ccm c ON d.CUSNO=C.CUSNO 
where 1=1
and m.notedate>='1121101' and m.notedate<='1121130'
AND M.WHNO>='' AND M.WHNO<='ZZ'
and m.trn = 'N2'
and m.nrpayno<>'999'

UNION ALL 

select
m.whno,
M.dlvdate,
M.noteno,
M.CUSNO,
0 AS NOTEAMT,
M.dramt AS SAPAMT
from SAP_NOTE M 
WHERE 1=1
AND M.ctype LIKE '1%'--- ­É¤è 
AND M.dlvdate>='1121101' AND M.DLVDATE<='1121130'
AND M.WHNO>='' AND M.WHNO<='ZZ'
) X
WHERE 1=1
GROUP BY X.whno,X.notedate,X.noteno,X.CUSNO
