<div class="container">
    <ol class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) {?>
        <li><a href="<?php echo $breadcrumb['link']; ?>"><?php echo $breadcrumb['title']; ?></a></li>
        <?php } ?>
    </ol>

    <div class="row">

        <div class="col-sm-3">
            <div class="admin_user">                
                <h4>Área do Professor</h4>
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
                    <?php foreach ($data['grupos'] as $grupos) { ?>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Grupo - <?php echo $grupos['cod_grupo'] ?> - <?php echo utf8_encode($grupos['nome_idioma']) ?></h3>
                        </div>

                        <div class="panel-body">
                            <table class="table table-hover table-bordered tabelaGrupo">
                                <tr>
                                    <th class="codigoaluno">Código do Aluno</th>
                                    <th class="nome">Nome do Aluno</th>
                                    <th class="email">E-mail</th>
                                    <th class="deletar">Editar</th>
                                </tr>
                                <?php foreach ($data['grupoalunos'] as $grupoalunos) { ?>
                                <?php if ($grupos['cod_grupo'] == $grupoalunos['cod_grupo']) { ?>
                                <tr>
                                    <td class="codigoaluno"><?php echo $grupoalunos['codigo'] ?></td>
                                    <td class="nome"><?php echo $grupoalunos['nome'] ?> <?php echo $grupoalunos['sobrenome'] ?></td>
                                    <td class="email"><?php echo $grupoalunos['email'] ?></td>
                                    <td class="deletar"><a href="<?php echo PATH_URL ?>aluno/setAluno/<?php echo $grupoalunos['codigo'] ?>">Editar</a></td>
                                </tr>
                                <?php } ?>
                                <?php } ?>
                            </table>
                            
                            
                            <h4>Recados</h4>
                            <form action="areaProfessor/insertRecado/<?php echo $grupos['cod_grupo'] ?>" method="POST">
                                <input type="hidden" name="cod_grupo" value="<?php echo $grupos['cod_grupo'] ?>">
                                <span>Titúlo do Recado</span>
                                <input type="text" name="titulo-recado" maxlength="30" class="form-control" placeholder="Título do Recado" required="">
                                <span>Conteúdo do Recado</span>
                                <textarea name="conteudo-recado" id="conteudo-recado" class="form-control admin-textarea-sum" placeholder="Conteúdo do Recado" required=""></textarea>
                                <span>Data</span>
                                <input type="date" id="data-recado" name="data-recado" class="form-control" aria-describedby="basic-addon1" required="">

                                <div class="article_buttons">
                                    <button type="submit" class="btn btn-default">Salvar</button>                                    
                                </div>
                            </form>

                            <div class="panel panel-default mural-Recados">
                                <div class="panel-heading">
                                    <h4 class="panel-title">Mural de Recados</h4>
                                </div>
                                <div class="row">
                                    <div class="panel-body">
                                        <?php foreach ($data['recadogrupo'] as $recadogrupo) { ?>
                                        
                                        <?php if ($grupos['cod_grupo'] == $recadogrupo['cod_grupo']) { ?>
                                        <div class="col-sm-4">
                                            <form action="areaProfessor/updateRecado/<?php echo $recadogrupo['id'] ?>" method="POST">
                                                <input type="hidden" name="recado-id" value="<?php echo $recadogrupo['id'] ?>">
                                                <input type="hidden" name="cod_grupo" value="<?php echo $recadogrupo['cod_grupo'] ?>">
                                                <span>Titúlo do Recado</span>
                                                <input type="text" name="titulo-recado" maxlength="30" class="form-control" value="<?php echo $recadogrupo['titulo_recado'] ?>" required="">
                                                <span>Conteúdo do Recado</span>
                                                <textarea name="conteudo-recado" id="conteudo-recado" class="form-control admin-textarea-sum" placeholder="Conteúdo do Recado" required=""><?php echo $recadogrupo['conteudo_recado'] ?></textarea>
                                                <span>Data</span>
                                                <input type="date" id="data-recado" name="data-recado" class="form-control" aria-describedby="basic-addon1" value="<?php echo $recadogrupo['data_recado'] ?>" required="">

                                                <div class="article_buttons">
                                                    <button type="submit" class="btn btn-default">Atualizar</button>                                    
                                                    <a href="areaProfessor/deleteRecado/<?php echo $recadogrupo['id'] ?>" class="btn btn-danger">Deletar</a>
                                                </div>

                                            </form>                                
                                        </div>
                                        <?php } ?>
                                        
                                        <?php } ?>
                                    </div>  
                                </div>
                            </div>

                            
                        </div>
                    </div>
                    <?php } ?>
                </div>
            </div>

        </div>

    </div>



</div>
