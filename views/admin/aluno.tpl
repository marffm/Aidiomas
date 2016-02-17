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
                <p class="admin_name"><?php echo $data['username'] ?></p>
                <p class="admin-name-category">Usuário administrativo</p>
                <p class="admin-logoff"><a href="<?php echo $destroy ?>">Sair</a></p>
            </div>
        </div>

        <div class="col-sm-9">

            <p>Aluno:</p>
            <h4><?php echo $aluno['codigo'] ?> - <?php echo $aluno['nome'] ?> <?php echo $aluno['sobrenome'] ?></h4>
            <br/>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Cadastro Aluno</h3>
                </div>

                <div class="panel-body">
                    <p>Código: <strong><?php echo $aluno['codigo'] ?></strong></p>

                    <div class="panel panel-default">

                        <form action="<?php echo PATH_URL ?>aluno/updateAluno" method="POST" class="panel-body">
                            <input type="hidden" name="codigo" id="codigo" value="<?php echo $aluno['codigo'] ?>" />
                            <input type="hidden" name="nivel" id="nivel" value="<?php echo $aluno['nivel'] ?>" />

                            <div class="row">
                                <div class="col-sm-3">
                                    <span>Nome</span>
                                    <input type="text" name="nome" id="nome" required="" maxlength="25" value="<?php echo $aluno['nome'] ?>" placeholder="<?php echo $aluno['nome'] ?>" class="form-control" />
                                </div>
                                <div class="col-sm-6">
                                    <span>Sobrenome</span>
                                    <input type="text" required maxlength="50" name="sobrenome" id="sobrenome" value="<?php echo $aluno['sobrenome'] ?>" placeholder="<?php echo $aluno['sobrenome'] ?>" class="form-control"/>
                                </div>
                                <div class="col-sm-3">
                                    <span>Data Nascimento</span>
                                    <input type="date" required name="nascimento" id="nascimento" value="<?php echo $aluno['nascimento'] ?>" class="form-control" />
                                </div>
                            </div>
                            <br/>
                            <div class="row">
                                <div class="col-sm-4">
                                    <span>Telefone</span>
                                    <input type="text" name="telefone" id="telefone" value="<?php echo $aluno['telefone'] ?>" maxlength="16" class="form-control" />
                                </div>
                                <div class="col-sm-8">
                                    <span>E-mail</span>
                                    <input type="text" name="email" id="email" maxlength="50" class="form-control" value="<?php echo $aluno['email'] ?>" />
                                </div>
                            </div>
                            <br/>
                            <div class="row">
                                <div class="col-sm-4">
                                    <span>Usuário</span>
                                    <input type="text" name="usuario" id="usuario" required value="<?php echo $aluno['usuario'] ?>" maxlength="10" class="form-control" />
                                </div>
                                <div class="col-sm-4">
                                    <span>Senha</span>
                                    <input type="text" name="senha" id="senha" value="<?php echo $aluno['senha'] ?>" maxlength="9" class="form-control" required="" />
                                </div>
                                <div class="col-sm-2" id="button-inserirAluno">
                                    <button type="submit" class="btn btn-info">Atualizar Aluno</button>
                                </div>
                                <div class="col-sm-2" id="button-inserirAluno">
                                    <a href="<?php echo PATH_URL ?>aluno/deleteAluno/<?php echo $aluno['codigo'] ?>" class="btn btn-danger">Deletar</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <?php if (isset($data['aluno_grupo'])) { ?>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Grupos</h3>
                </div>

                <div class="panel-body">
                    <?php foreach($data['aluno_grupo'] as $grupo) { ?>
                    <div class="col-sm-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Código: <?php echo $grupo['cod_grupo']?></h3>
                            </div>

                            <div class="panel-body">
                                <p>Idioma: <strong><?php echo utf8_encode($grupo['nome_idioma']) ?></strong></p>
                                <p>Level: <strong><?php echo $grupo['level_grupo'] ?></strong></p>
                                <p>Professor: <strong><?php echo utf8_encode($grupo['nome_prof']) ?> <?php echo utf8_encode($grupo['sobrenome_prof']) ?></strong></p>
                            </div>

                        </div>
                    </div>
                    <?php } ?>
                </div>
            </div>
            <?php } ?>
            
            <?php if (isset($data['aluno_grupo'])) { ?>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">Inserir Boletins</h4>
                </div>
                <div class="panel-body">                    

                    <?php if (isset($nivel_b1e)) { ?>
                    <div class="col-sm-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Boletim - Espanhol Nivel B1</h3>
                            </div>
                            <div class="panel-body">
                                <form action="<?php echo PATH_URL ?>aluno/insertBoletim" method="POST">
                                    <input type="hidden" name="codigo_aluno" id="codigo_aluno" value="<?php echo $aluno['codigo'] ?>" />
                                    <input type="hidden" name="b_level" id="b_level" value="b1-e" />
                                    <span><strong>Semestre</strong></span>
                                    <input type="text" name="semestre" id="semestre" placeholder="00/0000" class="form-control" required="" />
                                    <br/>
                                    <span><strong>Unidades 1, 2 y 3</strong></span>
                                    <p>Habilidades: Gramatical.</p>
                                    <input type="text" name="unidade123" id="unidade123" placeholder="00" class="form-control" />
                                    <br/>
                                    <span><strong>Unidades 4, 5 y 6</strong></span>
                                    <p>Habilidades: lectora, escrita, auditiva y oral.</p>
                                    <input type="text" name="unidade456" id="unidade456" placeholder="00" class="form-control" />
                                    <br/>
                                    <span><strong>Unidades 7, 8 y 9</strong></span>
                                    <p>Habilidades: Gramatical.</p>
                                    <input type="text" name="unidade789" id="unidade789" placeholder="00" class="form-control" />
                                    <br/>
                                    <span><strong>Unidades 10, 11 y 12</strong></span>
                                    <p>Habilidades: lectora, escrita, auditiva y oral.</p>
                                    <input type="text" name="unidade101112" id="unidade101112" placeholder="00" class="form-control" />
                                    <br/>
                                    <span><strong>Proyecto Lectura</strong></span>
                                    <input type="text" name="proyectolectura" id="proyectolectura" placeholder="00" class="form-control" />
                                    <br/>
                                    <span><strong>Promedio Final</strong></span>
                                    <input type="text" name="mediafinal" id="mediafinal" placeholder="00" class="form-control" />
                                    <div id="button-inserirAluno">
                                        <button type="submit" class="btn btn-info">Inserir Boletim</button>
                                    </div>
                                </form>
                                <?php if(isset($errorInsertBoletim)) { ?>
                                <p class="alert alert-danger" role="alert"><?php echo $errorInsertBoletim ?></p>
                                <?php } ?>
                            </div>
                        </div>
                    </div>
                    <?php } ?>

                    <?php if (isset($nivel_b2e)) { ?>
                    <div class="col-sm-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Boletim - Espanhol Nivel B2</h3>
                            </div>

                            <div class="panel-body">
                                <form action="<?php echo PATH_URL ?>aluno/insertBoletim" method="POST">
                                    <input type="hidden" name="codigo_aluno" id="codigo_aluno" value="<?php echo $aluno['codigo'] ?>" />
                                    <input type="hidden" name="b_level" id="b_level" value="b2-e" />
                                    <span><strong>Semestre</strong></span>
                                    <input type="text" name="semestre" id="semestre" placeholder="00/0000" class="form-control" required="" />
                                    <br/>
                                    <span><strong>Unidades 1, 2, 3, 4 y 5</strong></span>
                                    <p>Habilidades: lectora, escrita, auditiva y oral.</p>
                                    <input type="text" name="unidade12345" id="unidade12345" placeholder="00" class="form-control" />
                                    <br/>
                                    <span><strong>Unidades 6, 7, 8, 9 y 10</strong></span>
                                    <p>Habilidades: lectora, escrita, auditiva y oral.</p>
                                    <input type="text" name="unidade678910" id="unidade678910" placeholder="00" class="form-control" />
                                    <br/>
                                    <span><strong>Proyecto Lectura</strong></span>
                                    <input type="text" name="proyectolectura" id="proyectolectura" placeholder="00" class="form-control" />
                                    <br/>
                                    <span><strong>Promedio Final</strong></span>
                                    <input type="text" name="mediafinal" id="mediafinal" placeholder="00" class="form-control" />
                                    <div id="button-inserirAluno">
                                        <button type="submit" class="btn btn-info">Inserir Boletim</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <?php } ?>

                </div>
            </div>
            <?php } ?>

            <?php if (isset($data['aluno_boletin'])) { ?>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Boletins</h3>
                </div>

                <div class="panel-body">
                    <?php foreach($data['aluno_boletin'] as $key => $value) { ?>
                    <?php foreach($value as $boletins) { ?>

                    <?php if ($boletins['b_level'] == "b1-e" ) { ?>

                    <div class="col-sm-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Boletim - <?php echo $boletins['b_level'] ?></h3>
                            </div>


                            <div class="panel-body">
                                <form action="<?php echo PATH_URL ?>aluno/updateBoletim" method="POST">
                                    <input type="hidden" name="codigo_aluno" id="codigo_aluno" value="<?php echo $boletins['codigo_aluno'] ?>" />
                                    <input type="hidden" name="b_level" id="b_level" value="b1-e" />
                                    <span><strong>Semestre</strong></span>
                                    <input type="text" name="semestre" id="semestre" value="<?php echo $boletins['semestre'] ?>" class="form-control" required="" />
                                    <br/>
                                    <span><strong>Unidades 1, 2 y 3</strong></span>
                                    <p>Habilidades: Gramatical.</p>
                                    <input type="text" name="unidade123" id="unidade123" value="<?php echo $boletins['unidade123'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Unidades 4, 5 y 6</strong></span>
                                    <p>Habilidades: lectora, escrita, auditiva y oral.</p>
                                    <input type="text" name="unidade456" id="unidade456" value="<?php echo $boletins['unidade456'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Unidades 7, 8 y 9</strong></span>
                                    <p>Habilidades: Gramatical.</p>
                                    <input type="text" name="unidade789" id="unidade789" value="<?php echo $boletins['unidade789'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Unidades 10, 11 y 12</strong></span>
                                    <p>Habilidades: lectora, escrita, auditiva y oral.</p>
                                    <input type="text" name="unidade101112" id="unidade101112" value="<?php echo $boletins['unidade101112'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Proyecto Lectura</strong></span>
                                    <input type="text" name="proyectolectura" id="proyectolectura" value="<?php echo $boletins['proyectolectura'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Promedio Final</strong></span>
                                    <input type="text" name="mediafinal" id="mediafinal" value="<?php echo $boletins['mediafinal'] ?>" class="form-control" />
                                    <div id="button-inserirAluno">
                                        <button type="submit" class="btn btn-info">Atualizar Boletim</button>
                                        <a href="<?php echo PATH_URL ?>aluno/deleteBoletim/" class=" btn btn-danger">Deletar</a>
                                    </div>
                                </form>
                            </div> 
                        </div>
                    </div>

                    <?php } ?> <!-- END IF B1-E -->

                    <?php if ($boletins['b_level'] == "b2-e" ) { ?>

                    <div class="col-sm-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Boletim - <?php echo $boletins['b_level'] ?></h3>
                            </div>

                            <div class="panel-body">
                                <form action="<?php echo PATH_URL ?>aluno/updateBoletim" method="POST">
                                    <input type="hidden" name="codigo_aluno" id="codigo_aluno" value="<?php echo $boletins['codigo_aluno'] ?>" />
                                    <input type="hidden" name="b_level" id="b_level" value="b2-e" />
                                    <span><strong>Semestre</strong></span>
                                    <input type="text" name="semestre" id="semestre" value="<?php echo $boletins['semestre'] ?>" class="form-control" required="" />
                                    <br/>
                                    <span><strong>Unidades 1, 2, 3, 4 y 5</strong></span>
                                    <p>Habilidades: lectora, escrita, auditiva y oral.</p>
                                    <input type="text" name="unidade12345" id="unidade12345" value="<?php echo $boletins['unidade12345'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Unidades 6, 7, 8, 9 y 10</strong></span>
                                    <p>Habilidades: lectora, escrita, auditiva y oral.</p>
                                    <input type="text" name="unidade678910" id="unidade678910" value="<?php echo $boletins['unidade678910'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Proyecto Lectura</strong></span>
                                    <input type="text" name="proyectolectura" id="proyectolectura" value="<?php echo $boletins['proyectolectura'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Promedio Final</strong></span>
                                    <input type="text" name="mediafinal" id="mediafinal" value="<?php echo $boletins['mediafinal'] ?>" class="form-control" />
                                    <div id="button-inserirAluno">
                                        <button type="submit" class="btn btn-info">Atualizar Boletim</button>
                                        <a href="<?php echo PATH_URL ?>aluno/deleteBoletim/" class=" btn btn-danger">Deletar</a>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>

                    <?php } ?> <!-- END IF B2-E -->

                    <?php } ?> <!-- END FOREACH BOLETINS -->
                    <?php } ?> <!-- END FOREACH DATA ALUNO BOLETIN -->
                </div>

            </div>

            <?php } ?> <!-- END OF BOLETINS -->


        </div> <!-- END DIV COL-SM-9 -->
    </div>
</div>
