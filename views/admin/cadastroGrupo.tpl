<div class="container">
    <ol class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['link']; ?>"><?php echo $breadcrumb['title']; ?></a></li>
        <?php } ?>
    </ol>

    <div class="row">
        <div class="col-sm-3">
            <div class="admin_user">                
                <h4>Área Administrativa</h4>
                <hr />
                <div class="icon"><i class="fa fa-user fa-4x"></i></div>
                <p class="admin_name"><?php echo $username ?></p>
                <p class="admin-name-category">Usuário administrativo</p>
                <p class="admin-logoff"><a href="<?php echo $destroy ?>">Sair</a></p>
            </div>

        </div>

        <div class="col-sm-9">

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Grupos</h3>
                </div>

                <div class="panel-body">
                    <div class="row">
                        <div class="col-sm-5">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <span class='panel-title'>Novo Grupo</span>
                                </div>
                                <form action="cadastroGrupo/validateGrupo" method="POST" class="panel-body">
                                    <span>Código do Grupo</span>
                                    <input type="text" name="cod_grupo" title="cod_grupo" class="form-control" placeholder="Código do Grupo" required/>
                                    <span>Idioma</span>
                                    <select id='idioma' name='idioma' class="form-control" required>
                                        <?php foreach ($data['idiomaslist'] as $idiomas) { ?>
                                        <option value="<?php echo $idiomas['id'] ?>"><?php echo utf8_encode($idiomas['nome_idioma']) ?></option>
                                        <?php } ?>
                                    </select>
                                    <span>Level</span>
                                    <input type="text" name="level_grupo" id="level_grupo" maxlength="12" class="form-control"/>
                                    <span>Semestre</span>
                                    <input type="text" name="semestre" id="semestre" maxlength="10" class="form-control"/>
                                    <span>Professor</span>
                                    <select name="codigo_professor" id="codigo_professor" class="form-control" required>
                                        <?php foreach ($data['professoreslist'] as $professor) { ?>
                                        <option value="<?php echo $professor['id'] ?>"><?php echo $professor['nome_prof'] ?></option>
                                        <?php } ?>
                                    </select>

                                    <?php if (isset($error)) { ?>
                                    <p class="alert alert-danger" role="alert"><?php echo $error ?></p>
                                    <?php } ?>

                                    <div class="article_buttons">
                                        <button type="submit" class="btn btn-info">Salvar</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <?php foreach($data['gruposlist'] as $grupos) { ?>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="panel panel-default">

                                <div class="panel-heading">
                                    <span class="panel-title">Código: <?php echo $grupos['cod_grupo'] ?></span>
                                </div>

                                <div class="panel-body">
                                    <span>Idioma: <strong><?php echo utf8_encode($grupos['nome_idioma']) ?></strong>  |  Level: <strong><?php echo $grupos['level_grupo'] ?></strong>  |  Semestre: <strong><?php echo $grupos['semestre'] ?></strong>  |  Professor: <strong><?php echo $grupos['nome_prof'] ?></strong></span>
                                    <table class="table table-hover table-bordered tabelaGrupo">                                        
                                        <tr>
                                            <th class="codigoaluno">Código Aluno</th>
                                            <th class="nome">Nome</th>
                                            <th class="sobrenome">Sobrenome</th>
                                            <th class="deletar">Deletar</th>
                                        </tr>
                                        <?php foreach ($data['alunogrupolist'] as $aluno_grupo) { ?>
                                        <?php if ($aluno_grupo['cod_grupo'] == $grupos['cod_grupo']) { ?>
                                        <tr>
                                            <td class="codigoaluno"><?php echo $aluno_grupo['codigo'] ?></td>
                                            <td class="nome"><?php echo $aluno_grupo['nome'] ?></td>
                                            <td class="sobrenome"><?php echo $aluno_grupo['sobrenome'] ?></td>
                                            <td class="deletar"><a href="cadastroGrupo/deleteAluno_Grupo/<?php echo $aluno_grupo['cod_grupo'] ?>_<?php echo $aluno_grupo['codigo'] ?>"><i class="fa fa-minus-square fa-2x"></i></a></td>                                         
                                        </tr>
                                        <?php } ?>
                                        <?php } ?>                                        
                                    </table>
                                    <div class="row">
                                        <form method="POST" action="cadastroGrupo/validadeInsertAluno_Grupo">
                                            <input type="hidden" name="cod_grupo" id="cod_grupo" value="<?php echo $grupos['cod_grupo'] ?>"/>
                                            <div class="col-sm-4 col-sm-offset-6">
                                                <select name="codigo_aluno" id="codigo_aluno" class="form-control" required>
                                                    <option>Selecione um aluno</option>
                                                    <?php foreach($data['alunolist'] as $alunos) { ?>
                                                    <option value="<?php echo $alunos['codigo'] ?>"><?php echo $alunos['codigo'] ?> - <?php echo $alunos['nome'] ?> <?php echo $alunos['sobrenome'] ?></option>
                                                    <?php } ?>
                                                </select> 
                                            </div>

                                            <div class="col-sm-1">
                                                <button type="submit" class="btn btn-info">Inserir Aluno</button>
                                            </div>                                            
                                        </form>                                        
                                    </div>
                                    <?php if (isset($errorposition)) { ?>
                                    <?php if ($errorposition == $grupos['cod_grupo']) { ?>
                                    <div class="row">
                                        <br/>
                                        <div class="col-sm-4 col-sm-offset-8">
                                            <p class="alert alert-danger" role="alert"><?php echo $erroraluno_grupo ?><?php echo $grupos['cod_grupo'] ?></p>
                                        </div>                                        
                                    </div>
                                    <?php } ?>
                                    <?php } ?>
                                    
                                    <div class="">
                                        <div class="col-sm-2 col-sm-offset-10">
                                            <br/>
                                            <a href="cadastroGrupo/deleteGrupo/<?php echo $grupos['cod_grupo'] ?>" class="btn btn-danger">Deletar Grupo</a>
                                        </div>
                                    </div>

                                </div>




                            </div>
                        </div>
                    </div>
                    <?php }?>

                </div>

            </div>

        </div>

    </div>

</div>
