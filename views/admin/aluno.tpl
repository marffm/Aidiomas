<div class="container">
    <ol class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['link']; ?>"><?php echo $breadcrumb['title']; ?></a></li>
        <?php } ?>
    </ol>

    <div class="row">

        <div class="col-sm-3">
            <div class="admin_user">                
                <h4><?php echo $data['textArea'] ?></h4>
                <hr />
                <div class="icon"><i class="fa fa-user fa-4x"></i></div>
                <p class="admin_name"><?php echo $data['username'] ?></p>
                <p class="admin-name-category">Usuário administrativo</p>
                <p class="admin-logoff"><a href="<?php echo $data['destroy'] ?>">Sair</a></p>
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
                    <?php if($data['usercategory'] == 'admin'){ ?>
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
                    <?php } else if ($data['usercategory'] == 'areaProfessor' and $data['username'] == $grupo['nome_prof']) { ?>
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
                            <div class="panel-body box_aluno">
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

                            <div class="panel-body box_aluno">
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
                                <?php if(isset($errorInsertBoletim)) { ?>
                                <p class="alert alert-danger" role="alert"><?php echo $errorInsertBoletim ?></p>
                                <?php } ?>
                            </div>
                        </div>
                    </div>
                    <?php } ?>

                    <?php if (isset($nivel_a1e)) { ?>
                    <div class="col-sm-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Boletim - Espanhol Nivel A1</h3>
                            </div>

                            <div class="panel-body box_aluno">
                                <form action="<?php echo PATH_URL ?>aluno/insertBoletim" method="POST">
                                    <input type="hidden" name="codigo_aluno" id="codigo_aluno" value="<?php echo $aluno['codigo'] ?>" />
                                    <input type="hidden" name="b_level" id="b_level" value="a1-e" />
                                    <span><strong>Semestre</strong></span>
                                    <input type="text" name="semestre" id="semestre" placeholder="00/0000" class="form-control" required="" />
                                    <br/>
                                    <span><strong>Unidades 1, 2 y 3</strong></span>
                                    <p>Habilidades: Gramatical.</p>
                                    <input type="text" name="unidade123" id="unidade123" placeholder="00" class="form-control" />
                                    <br/>
                                    <span><strong>Unidades 4, 5, y 6</strong></span>
                                    <p>Habilidades: lectora, escrita, auditiva y oral.</p>
                                    <input type="text" name="unidade456" id="unidade456" placeholder="00" class="form-control" />
                                    <br/>
                                    <span><strong>Unidades 7, 8, y 9</strong></span>
                                    <p>Habilidades: lectora, escrita, auditiva y oral.</p>
                                    <input type="text" name="unidade789" id="unidade789" placeholder="00" class="form-control" />
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

                    <?php if (isset($nivel_a2e)) { ?>
                    <div class="col-sm-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Boletim - Espanhol Nivel A2</h3>
                            </div>

                            <div class="panel-body box_aluno">
                                <form action="<?php echo PATH_URL ?>aluno/insertBoletim" method="POST">
                                    <input type="hidden" name="codigo_aluno" id="codigo_aluno" value="<?php echo $aluno['codigo'] ?>" />
                                    <input type="hidden" name="b_level" id="b_level" value="a2-e" />
                                    <span><strong>Semestre</strong></span>
                                    <input type="text" name="semestre" id="semestre" placeholder="00/0000" class="form-control" required="" />
                                    <br/>
                                    <span><strong>Unidades 1, 2 y 3</strong></span>
                                    <p>Habilidades: Gramatical.</p>
                                    <input type="text" name="unidade123" id="unidade123" placeholder="00" class="form-control" />
                                    <br/>
                                    <span><strong>Unidades 4, 5, y 6</strong></span>
                                    <p>Habilidades: lectora, escrita, auditiva y oral.</p>
                                    <input type="text" name="unidade456" id="unidade456" placeholder="00" class="form-control" />
                                    <br/>
                                    <span><strong>Unidades 7, 8, 9 y 10</strong></span>
                                    <p>Habilidades: lectora, escrita, auditiva y oral.</p>
                                    <input type="text" name="unidade78910" id="unidade78910" placeholder="00" class="form-control" />
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

                    <?php if (isset($nivel_alemao)) { ?>
                    <div class="col-sm-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Boletim - Alemão</h3>
                            </div>

                            <div class="panel-body box_aluno">
                                <form action="<?php echo PATH_URL ?>aluno/insertBoletim" method="POST">
                                    <input type="hidden" name="codigo_aluno" id="codigo_aluno" value="<?php echo $aluno['codigo'] ?>" />
                                    <input type="hidden" name="b_level" id="b_level" value="alemao" />
                                    <span><strong>Semestre</strong></span>
                                    <input type="text" name="semestre" id="semestre" placeholder="00/0000" class="form-control" required="" />
                                    <br/>
                                    <span><strong>Quiz 1</strong></span>
                                    <input type="text" name="quiz_1" id="quiz_1" placeholder="00" class="form-control" />
                                    <br/>
                                    <span><strong>Test 1</strong></span>
                                    <input type="text" name="test_1" id="test_1" placeholder="00" class="form-control" />
                                    <br/>
                                    <span><strong>Quiz 2</strong></span>
                                    <input type="text" name="quiz_2" id="quiz_2" placeholder="00" class="form-control" />
                                    <br/>
                                    <span><strong>Test 2</strong></span>
                                    <input type="text" name="test_2" id="test_2" placeholder="00" class="form-control" />
                                    <br/>
                                    <span><strong>Sprechen</strong></span>
                                    <input type="text" name="sprechen" id="sprechen" placeholder="00" class="form-control" />
                                    <br/>
                                    <span><strong>Hausaufgabe</strong></span>
                                    <input type="text" name="hausau" id="hausau" placeholder="00" class="form-control" />
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

                    <?php if (isset($nivel_ingles)) { ?>
                    <div class="col-sm-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Boletim - Inglês</h3>
                            </div>

                            <div class="panel-body box_aluno">
                                <form action="<?php echo PATH_URL ?>aluno/insertBoletim" method="POST">
                                    <input type="hidden" name="codigo_aluno" id="codigo_aluno" value="<?php echo $aluno['codigo'] ?>" />
                                    <input type="hidden" name="b_level" id="b_level" value="ingles" />
                                    <span><strong>Semestre</strong></span>
                                    <input type="text" name="semestre" id="semestre" placeholder="00/0000" class="form-control" required="" />
                                    <br/>
                                    <span><strong>Quiz 1</strong></span>
                                    <input type="text" name="quiz_1" id="quiz_1" placeholder="00" class="form-control" />
                                    <br/>
                                    <span><strong>Test 1</strong></span>
                                    <input type="text" name="test_1" id="test_1" placeholder="00" class="form-control" />
                                    <br/>
                                    <span><strong>Participação 1</strong></span>
                                    <input type="text" name="participacao_1" id="participacao_1" placeholder="00" class="form-control" />
                                    <br/>
                                    <span><strong>Média 1</strong></span>
                                    <input type="text" name="media_1" id="media_1" placeholder="00" class="form-control" />
                                    <br/>
                                    <span><strong>Quiz 2</strong></span>
                                    <input type="text" name="quiz_2" id="quiz_2" placeholder="00" class="form-control" />
                                    <br/>
                                    <span><strong>Test 2</strong></span>
                                    <input type="text" name="test_2" id="test_2" placeholder="00" class="form-control" />
                                    <br/>
                                    <span><strong>Oral Test</strong></span>
                                    <input type="text" name="oral_test" id="oral_test" placeholder="00" class="form-control" />
                                    <br/>
                                    <span><strong>Mocks</strong></span>
                                    <input type="text" name="mocks" id="mocks" placeholder="00" class="form-control" />
                                    <br/>
                                    <span><strong>Reading</strong></span>
                                    <input type="text" name="reading" id="reading" placeholder="00" class="form-control" />
                                    <br/>
                                    <span><strong>Participação 2</strong></span>
                                    <input type="text" name="participacao_2" id="participacao_2" placeholder="00" class="form-control" />
                                    <br/>
                                    <span><strong>Multiroom</strong></span>
                                    <input type="text" name="multroom" id="multroom" placeholder="00" class="form-control" />
                                    <br/>
                                    <span><strong>Média 2</strong></span>
                                    <input type="text" name="media_2" id="media_2" placeholder="00" class="form-control" />
                                    <br/>
                                    <span><strong>Média Final</strong></span>
                                    <input type="text" name="media_final" id="media_final" placeholder="00" class="form-control" />

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
                    
                    <?php if (isset($nivel_frances)) { ?>
                    <div class="col-sm-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Boletim - Francês</h3>
                            </div>
                            
                            <div class="panel-body box_aluno">
                                <form action="<?php echo PATH_URL ?>aluno/insertBoletim" method="POST">
                                    <input type="hidden" name="codigo_aluno" id="codigo_aluno" value="<?php echo $aluno['codigo'] ?>" />
                                    <input type="hidden" name="b_level" id="b_level" value="frances" />
                                    <span><strong>Élève</strong></span>
                                    <input type="text" name="eleve" id="eleve" placeholder="" class="form-control" />
                                    <br/>
                                    <span><strong>Méthode</strong></span>
                                    <input type="text" name="methode" id="methode" placeholder="Methode" class="form-control" />
                                    <br/>
                                    <span><strong>Niveau</strong></span>
                                    <input type="text" name="niveau" id="niveau" placeholder="Niveau" class="form-control" />
                                    <br/>
                                    <span><strong>Moyenne</strong></span>
                                    <input type="text" name="moyenne" id="moyenne" placeholder="Moyenne" class="form-control" />
                                    <br/>
                                    <span><strong>Contenus Travaillés - Unité 1</strong></span>
                                    <input type="text" name="travailles-unite1" id="travailles-unite1" placeholder="Unité 1" class="form-control" />
                                    <br/>
                                    <span><strong>Contenus Travaillés - Unité 2</strong></span>
                                    <input type="text" name="travailles-unite2" id="travailles-unite2" placeholder="Unité 2" class="form-control" />
                                    <br/>
                                    <span><strong>Contenus Travaillés - Unité 3</strong></span>
                                    <input type="text" name="travailles-unite3" id="travailles-unite3" placeholder="Unité 3" class="form-control" />
                                    <br/>
                                    <span><strong>Contenus Travaillés - Unité 4</strong></span>
                                    <input type="text" name="travailles-unite4" id="travailles-unite4" placeholder="Unité 4" class="form-control" />
                                    <br/>
                                    <span><strong>Devoirs - Unité 1</strong></span>
                                    <input type="text" name="devoirs-unite1" id="devoir-unite1" placeholder="Unité 1" class="form-control" />
                                    <br/>
                                    <span><strong>Devoirs - Unité 2</strong></span>
                                    <input type="text" name="devoirs-unite2" id="devoirs-unite2" placeholder="Unité 2" class="form-control" />
                                    <br/>
                                    <span><strong>Devoirs - Unité 3</strong></span>
                                    <input type="text" name="devoirs-unite3" id="devoirs-unite3" placeholder="Unité 3" class="form-control" />
                                    <br/>
                                    <span><strong>Devoirs - Unité 4</strong></span>
                                    <input type="text" name="devoirs-unite4" id="devoirs-unite4" placeholder="Unité 4" class="form-control" />
                                    <br/>
                                    <br/>
                                    <h4>Évaluations 1er bimestre</h4>
                                    <br/>
                                    <span><strong>Participation</strong></span>
                                    <input type="text" name="participation" id="participation" placeholder="Participation" class="form-control" />
                                    <br/>
                                    <span><strong>Devoirs</strong></span>
                                    <input type="text" name="davoirs-1" id="davoirs-1" placeholder="Devoirs" class="form-control" />
                                    <br/>
                                    <span><strong>Performance en classe</strong></span>
                                    <input type="text" name="performance" id="performance" placeholder="Performance en Classe" class="form-control" />
                                    <br/>
                                    <span><strong>Test écrit</strong></span>
                                    <input type="text" name="test-ecrit-1" id="test-ecrit-1" placeholder="Test écrit" class="form-control" />
                                    <br/>
                                    <span><strong>Total</strong></span>
                                    <input type="text" name="total-1" id="total-1" placeholder="Total 1er Bimestre" class="form-control" />
                                    <br/>
                                    <br/>
                                    <h4>Évaluations 2e bimestre</h4>
                                    <br/>
                                    <span><strong>Lecture</strong></span>
                                    <input type="text" name="lecture" id="lecture" placeholder="Lecture" class="form-control" />
                                    <br/>
                                    <span><strong>Devoirs</strong></span>
                                    <input type="text" name="devoirs-2" id="devoirs-2" placeholder="Devoirs" class="form-control" />
                                    <br/>
                                    <span><strong>Test oral</strong></span>
                                    <input type="text" name="test-oral" id="test-oral" placeholder="Test Oral" class="form-control" />
                                    <br/>
                                    <span><strong>Test écrit</strong></span>
                                    <input type="text" name="test-ecrit-2" id="test-ecrit-2" placeholder="Test écrit" class="form-control" />
                                    <br/>
                                    <span><strong>Total</strong></span>
                                    <input type="text" name="total-2" id="total-2" placeholder="Total" class="form-control" />
                                    
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


                            <div class="panel-body box_aluno">
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
                                        <a href="<?php echo PATH_URL ?>aluno/deleteBoletim/<?php echo $boletins['codigo_aluno'] ?>_b1-e" class=" btn btn-danger">Deletar</a>
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

                            <div class="panel-body box_aluno">
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
                                        <a href="<?php echo PATH_URL ?>aluno/deleteBoletim/<?php echo $boletins['codigo_aluno'] ?>_b2-e" class=" btn btn-danger">Deletar</a>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                    <?php } ?> <!-- END IF B2-E -->

                    <?php if ($boletins['b_level'] == "a1-e" ) { ?>
                    <div class="col-sm-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Boletim - <?php echo $boletins['b_level'] ?></h3>
                            </div>

                            <div class="panel-body box_aluno">
                                <form action="<?php echo PATH_URL ?>aluno/updateBoletim" method="POST">
                                    <input type="hidden" name="codigo_aluno" id="codigo_aluno" value="<?php echo $boletins['codigo_aluno'] ?>" />
                                    <input type="hidden" name="b_level" id="b_level" value="a1-e" />
                                    <span><strong>Semestre</strong></span>
                                    <input type="text" name="semestre" id="semestre" value="<?php echo $boletins['semestre'] ?>" class="form-control" required="" />
                                    <br/>
                                    <span><strong>Unidades 1, 2 y 3</strong></span>
                                    <p>Habilidades: Gramatical.</p>
                                    <input type="text" name="unidade123" id="unidade123" value="<?php echo $boletins['unidade123'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Unidades 4, 5, y 6</strong></span>
                                    <p>Habilidades: lectora, escrita, auditiva y oral.</p>
                                    <input type="text" name="unidade456" id="unidade456" value="<?php echo $boletins['unidade456'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Unidades 7, 8, y 9</strong></span>
                                    <p>Habilidades: lectora, escrita, auditiva y oral.</p>
                                    <input type="text" name="unidade789" id="unidade789" value="<?php echo $boletins['unidade789'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Promedio Final</strong></span>
                                    <input type="text" name="mediafinal" id="mediafinal" value="<?php echo $boletins['mediafinal'] ?>" class="form-control" />
                                    <div id="button-inserirAluno">
                                        <button type="submit" class="btn btn-info">Atualizar Boletim</button>
                                        <a href="<?php echo PATH_URL ?>aluno/deleteBoletim/<?php echo $boletins['codigo_aluno'] ?>_a1-e" class=" btn btn-danger">Deletar</a>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                    <?php } ?> <!-- END IF A1-E -->

                    <?php if ($boletins['b_level'] == "a2-e" ) { ?>
                    <div class="col-sm-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Boletim - <?php echo $boletins['b_level'] ?></h3>
                            </div>

                            <div class="panel-body box_aluno">
                                <form action="<?php echo PATH_URL ?>aluno/updateBoletim" method="POST">
                                    <input type="hidden" name="codigo_aluno" id="codigo_aluno" value="<?php echo $boletins['codigo_aluno'] ?>" />
                                    <input type="hidden" name="b_level" id="b_level" value="a2-e" />
                                    <span><strong>Semestre</strong></span>
                                    <input type="text" name="semestre" id="semestre" value="<?php echo $boletins['semestre'] ?>" class="form-control" required="" />
                                    <br/>
                                    <span><strong>Unidades 1, 2 y 3</strong></span>
                                    <p>Habilidades: Gramatical.</p>
                                    <input type="text" name="unidade123" id="unidade123" value="<?php echo $boletins['unidade123'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Unidades 4, 5, y 6</strong></span>
                                    <p>Habilidades: lectora, escrita, auditiva y oral.</p>
                                    <input type="text" name="unidade456" id="unidade456" value="<?php echo $boletins['unidade456'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Unidades 7, 8, 9 y 10</strong></span>
                                    <p>Habilidades: lectora, escrita, auditiva y oral.</p>
                                    <input type="text" name="unidade78910" id="unidade78910" value="<?php echo $boletins['unidade78910'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Proyecto Lectura</strong></span>
                                    <input type="text" name="proyectolectura" id="proyectolectura" value="<?php echo $boletins['proyectolectura'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Promedio Final</strong></span>
                                    <input type="text" name="mediafinal" id="mediafinal" value="<?php echo $boletins['mediafinal'] ?>" class="form-control" />
                                    <div id="button-inserirAluno">
                                        <button type="submit" class="btn btn-info">Atualizar Boletim</button>
                                        <a href="<?php echo PATH_URL ?>aluno/deleteBoletim/<?php echo $boletins['codigo_aluno'] ?>_a2-e" class=" btn btn-danger">Deletar</a>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                    <?php } ?> <!-- END IF A2-E -->

                    <?php if ($boletins['b_level'] == "alemao" ) { ?>
                    <div class="clearfix col-sm-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Boletim - <?php echo $boletins['b_level'] ?></h3>
                            </div>

                            <div class="panel-body box_aluno">
                                <form action="<?php echo PATH_URL ?>aluno/updateBoletim" method="POST">
                                    <input type="hidden" name="codigo_aluno" id="codigo_aluno" value="<?php echo $boletins['codigo_aluno'] ?>" />
                                    <input type="hidden" name="b_level" id="b_level" value="alemao" />
                                    <span><strong>Semestre</strong></span>
                                    <input type="text" name="semestre" id="semestre" value="<?php echo $boletins['semestre'] ?>" class="form-control" required="" />
                                    <br/>
                                    <span><strong>Quiz 1</strong></span>
                                    <input type="text" name="quiz_1" id="quiz_1" value="<?php echo $boletins['quiz_1'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Test 1</strong></span>
                                    <input type="text" name="test_1" id="test_1" value="<?php echo $boletins['test_1'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Quiz 1</strong></span>
                                    <input type="text" name="quiz_2" id="quiz_2" value="<?php echo $boletins['quiz_2'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Test 2</strong></span>
                                    <input type="text" name="test_2" id="test_2" value="<?php echo $boletins['test_2'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Sprechen</strong></span>
                                    <input type="text" name="sprechen" id="sprechen" value="<?php echo $boletins['sprechen'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Hausaufgabe</strong></span>
                                    <input type="text" name="hausau" id="hausau" value="<?php echo $boletins['hausau'] ?>" class="form-control" />
                                    <div id="button-inserirAluno">
                                        <button type="submit" class="btn btn-info">Atualizar Boletim</button>
                                        <a href="<?php echo PATH_URL ?>aluno/deleteBoletim/<?php echo $boletins['codigo_aluno'] ?>_alemao" class=" btn btn-danger">Deletar</a>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                    <?php } ?> <!-- END IF ALEMAO -->

                    <?php if ($boletins['b_level'] == "ingles" ) { ?>
                    <div class="col-sm-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Boletim - Inglês</h3>
                            </div>

                            <div class="panel-body box_aluno">
                                <form action="<?php echo PATH_URL ?>aluno/updateBoletim" method="POST">
                                    <input type="hidden" name="codigo_aluno" id="codigo_aluno" value="<?php echo $boletins['codigo_aluno'] ?>" />
                                    <input type="hidden" name="b_level" id="b_level" value="ingles" />
                                    <span><strong>Semestre</strong></span>
                                    <input type="text" name="semestre" id="semestre" value="<?php echo $boletins['semestre'] ?>" class="form-control" required="" />
                                    <br/>
                                    <span><strong>Quiz 1</strong></span>
                                    <input type="text" name="quiz_1" id="quiz_1" value="<?php echo $boletins['quiz_1'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Test 1</strong></span>
                                    <input type="text" name="test_1" id="test_1" value="<?php echo $boletins['test_1'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Participação 1</strong></span>
                                    <input type="text" name="participacao_1" id="participacao_1" value="<?php echo $boletins['participacao_1'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Média 1</strong></span>
                                    <input type="text" name="media_1" id="media_1" value="<?php echo $boletins['media_1'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Quiz 2</strong></span>
                                    <input type="text" name="quiz_2" id="quiz_2" value="<?php echo $boletins['quiz_2'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Test 2</strong></span>
                                    <input type="text" name="test_2" id="test_2" value="<?php echo $boletins['test_2'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Oral Test</strong></span>
                                    <input type="text" name="oral_test" id="oral_test" value="<?php echo $boletins['oral_test'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Mocks</strong></span>
                                    <input type="text" name="mocks" id="mocks" value="<?php echo $boletins['mocks'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Reading</strong></span>
                                    <input type="text" name="reading" id="reading" value="<?php echo $boletins['reading'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Participação 2</strong></span>
                                    <input type="text" name="participacao_2" id="participacao_2" value="<?php echo $boletins['participacao_2'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Multiroom</strong></span>
                                    <input type="text" name="multroom" id="multroom" value="<?php echo $boletins['multroom'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Média 2</strong></span>
                                    <input type="text" name="media_2" id="media_2" value="<?php echo $boletins['media_2'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Média Final</strong></span>
                                    <input type="text" name="media_final" id="media_final" value="<?php echo $boletins['media_final'] ?>" class="form-control" />

                                    <div id="button-inserirAluno">
                                        <button type="submit" class="btn btn-info">Atualizar Boletim</button>
                                        <a href="<?php echo PATH_URL ?>aluno/deleteBoletim/<?php echo $boletins['codigo_aluno'] ?>_ingles" class=" btn btn-danger">Deletar</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <?php } ?> <!-- END IF INGLES -->
                    
                    <?php if ($boletins['b_level'] == "frances" ) { ?>
                    <div class="col-sm-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Boletim - Francês</h3>
                            </div>
                            
                            <div class="panel-body box_aluno">
                                <form action="<?php echo PATH_URL ?>aluno/updateBoletim" method="POST">
                                    <input type="hidden" name="codigo_aluno" id="codigo_aluno" value="<?php echo $aluno['codigo'] ?>" />
                                    <input type="hidden" name="b_level" id="b_level" value="frances" />
                                    <span><strong>Élève</strong></span>
                                    <input type="text" name="eleve" id="eleve" value="<?php echo $boletins['eleve'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Méthode</strong></span>
                                    <input type="text" name="methode" id="methode" value="<?php echo $boletins['methode'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Niveau</strong></span>
                                    <input type="text" name="niveau" id="niveau" value="<?php echo $boletins['niveau'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Moyenne</strong></span>
                                    <input type="text" name="moyenne" id="moyenne" value="<?php echo $boletins['moyenne'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Contenus Travaillés - Unité 1</strong></span>
                                    <input type="text" name="travailles-unite1" id="travailles-unite1" value="<?php echo $boletins['travailles_unite1'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Contenus Travaillés - Unité 2</strong></span>
                                    <input type="text" name="travailles-unite2" id="travailles-unite2" value="<?php echo $boletins['travailles_unite2'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Contenus Travaillés - Unité 3</strong></span>
                                    <input type="text" name="travailles-unite3" id="travailles-unite3" value="<?php echo $boletins['travailles_unite3'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Contenus Travaillés - Unité 4</strong></span>
                                    <input type="text" name="travailles-unite4" id="travailles-unite4" value="<?php echo $boletins['travailles_unite4'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Devoirs - Unité 1</strong></span>
                                    <input type="text" name="devoirs-unite1" id="devoir-unite1" value="<?php echo $boletins['devoirs_unite1'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Devoirs - Unité 2</strong></span>
                                    <input type="text" name="devoirs-unite2" id="devoirs-unite2" value="<?php echo $boletins['devoirs_unite2'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Devoirs - Unité 3</strong></span>
                                    <input type="text" name="devoirs-unite3" id="devoirs-unite3" value="<?php echo $boletins['devoirs_unite3'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Devoirs - Unité 4</strong></span>
                                    <input type="text" name="devoirs-unite4" id="devoirs-unite4" value="<?php echo $boletins['devoirs_unite4'] ?>" class="form-control" />
                                    <br/>
                                    <br/>
                                    <h4>Évaluations 1er bimestre</h4>
                                    <br/>
                                    <span><strong>Participation</strong></span>
                                    <input type="text" name="participation" id="participation" value="<?php echo $boletins['participation'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Devoirs</strong></span>
                                    <input type="text" name="davoirs-1" id="davoirs-1" value="<?php echo $boletins['davoirs_1'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Performance en classe</strong></span>
                                    <input type="text" name="performance" id="performance" value="<?php echo $boletins['performance'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Test écrit</strong></span>
                                    <input type="text" name="test-ecrit-1" id="test-ecrit-1" value="<?php echo $boletins['test_ecrit1'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Total</strong></span>
                                    <input type="text" name="total-1" id="total-1" value="<?php echo $boletins['total_1'] ?>" class="form-control" />
                                    <br/>
                                    <br/>
                                    <h4>Évaluations 2e bimestre</h4>
                                    <br/>
                                    <span><strong>Lecture</strong></span>
                                    <input type="text" name="lecture" id="lecture" value="<?php echo $boletins['lecture'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Devoirs</strong></span>
                                    <input type="text" name="devoirs-2" id="devoirs-2" value="<?php echo $boletins['devoirs_2'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Test oral</strong></span>
                                    <input type="text" name="test-oral" id="test-oral" value="<?php echo $boletins['test_oral'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Test écrit</strong></span>
                                    <input type="text" name="test-ecrit-2" id="test-ecrit-2" value="<?php echo $boletins['test_ecrit2'] ?>" class="form-control" />
                                    <br/>
                                    <span><strong>Total</strong></span>
                                    <input type="text" name="total-2" id="total-2" value="<?php echo $boletins['total_2'] ?>" class="form-control" />
                                    
                                    <div id="button-inserirAluno">
                                        <button type="submit" class="btn btn-info">Inserir Boletim</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <?php } ?> <!-- END IF FRANCES -->

                    <?php } ?> <!-- END FOREACH BOLETINS -->
                    <?php } ?> <!-- END FOREACH DATA ALUNO BOLETIN -->
                </div>
            </div>

            <?php } ?> <!-- END OF BOLETINS -->


        </div> <!-- END DIV COL-SM-9 -->
    </div>
</div>
