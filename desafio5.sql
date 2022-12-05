SELECT
	c.nome AS cancao,
    COUNT(h.cancoes_id) AS reproducoes
	FROM SpotifyClone.cancoes AS c
INNER JOIN 
	SpotifyClone.historico AS h
ON
	c.id = h.cancoes_id
    GROUP BY c.nome
    ORDER BY reproducoes DESC, cancao
    LIMIT 2;