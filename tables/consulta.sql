SELECT * FROM grupo INNER JOIN aluno_grupo ON (grupo.cod_grupo=aluno_grupo.cod_grupo) INNER JOIN aluno ON (aluno_grupo.codigo_aluno=aluno.codigo) WHERE codigo_professor=1