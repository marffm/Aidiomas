<div class="container">
    <ol class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['link']; ?>"><?php echo $breadcrumb['title']; ?></a></li>
        <?php } ?>
    </ol>

    <div class="row">

        <div class="col-sm-3">
            <div class="admin_user">                
                <h4>Área do Aluno</h4>
                <hr />
                <div class="icon"><i class="fa fa-user fa-4x"></i></div>
                <p class="admin_name"><?php echo $data['username'] ?></p>
                <p class="admin-name-category">Usuário Aluno</p>
                <p class="admin-logoff"><a href="<?php echo $destroy ?>">Sair</a></p>
            </div>
        </div>

        <div class="col-sm-9">

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Informações Sobre o Aluno</h3>
                </div>

                <div class="panel-body">
                    <?php foreach ($data['alunogrupo'] as $alunogrupo) { ?>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Boletim - Grupo <?php echo $alunogrupo['cod_grupo'] ?> - <?php echo utf8_encode($alunogrupo['nome_idioma']) ?></h3>
                        </div>
                        <div class="panel-body">
                            <?php foreach ($data['alunoboletins'] as $key => $value) { ?>
                            <?php foreach ($value as $boletins) { ?>

                            <?php if ($boletins['b_level'] == $alunogrupo['level_grupo'] and $boletins['b_level'] == 'b1-e' ) { ?>
                            <div class="text">
                                <p>Código Aluno: <strong><?php echo $alunogrupo['codigo_aluno'] ?></strong></p>                                
                                <p>Professor: <strong><?php echo $alunogrupo['nome_prof'] ?></strong></p>
                                <p>Nivel: <strong><?php echo $alunogrupo['level_grupo'] ?></strong></p>
                                <p>Semestre: <strong><?php echo $boletins['semestre'] ?></strong></p>
                            </div>
                            <br/>
                            <table class="table table-hover table-bordered">
                                <tr style='font-size: 12px;'>
                                    <th>Unidades 1, 2 y 3</th>
                                    <th>Unidades 4, 5 y 6</th>
                                    <th>Unidades 7, 8 y 9</th>
                                    <th>Unidades 10, 11 y 12</th>
                                    <th>Proyecto Lectura</th>
                                    <th>Promedio Final</th>
                                </tr>
                                <tr>
                                    <td><?php echo $boletins['unidade123'] ?></td>
                                    <td><?php echo $boletins['unidade456'] ?></td>
                                    <td><?php echo $boletins['unidade789'] ?></td>
                                    <td><?php echo $boletins['unidade101112'] ?></td>
                                    <td><?php echo $boletins['proyectolectura'] ?></td>
                                    <td><?php echo $boletins['mediafinal'] ?></td>
                                </tr>
                            </table>

                            <?php } else if ($boletins['b_level'] == $alunogrupo['level_grupo'] and $boletins['b_level'] == 'b2-e') { ?>
                            <div class="text">
                                <p>Código Aluno: <strong><?php echo $alunogrupo['codigo_aluno'] ?></strong></p>                                
                                <p>Professor: <strong><?php echo $alunogrupo['nome_prof'] ?></strong></p>
                                <p>Nivel: <strong><?php echo $alunogrupo['level_grupo'] ?></strong></p>
                                <p>Semestre: <strong><?php echo $boletins['semestre'] ?></strong></p>
                            </div>
                            <br/>
                            <table class="table table-hover table-bordered">
                                <tr style='font-size: 12px;'>
                                    <th>Unidades 1, 2, 3, 4 y 5</th>
                                    <th>Unidades 6, 7, 8, 9 y 10</th>
                                    <th>Proyecto Lectura</th>
                                    <th>Promedio Final</th>
                                </tr>
                                <tr>
                                    <td><?php echo $boletins['unidade12345'] ?></td>
                                    <td><?php echo $boletins['unidade678910'] ?></td>
                                    <td><?php echo $boletins['proyectolectura'] ?></td>
                                    <td><?php echo $boletins['mediafinal'] ?></td>
                                </tr>
                            </table>
                            <?php } else if ($boletins['b_level'] == $alunogrupo['level_grupo'] and $boletins['b_level'] == 'a1-e') { ?>
                            <div class="text">
                                <p>Código Aluno: <strong><?php echo $alunogrupo['codigo_aluno'] ?></strong></p>                                
                                <p>Professor: <strong><?php echo $alunogrupo['nome_prof'] ?></strong></p>
                                <p>Nivel: <strong><?php echo $alunogrupo['level_grupo'] ?></strong></p>
                                <p>Semestre: <strong><?php echo $boletins['semestre'] ?></strong></p>
                            </div>
                            <br/>
                            <table class="table table-hover table-bordered">
                                <tr style='font-size: 12px;'>
                                    <th>Unidades 1, 2 y 3</th>
                                    <th>Unidades 4, 5 y 6</th>
                                    <th>Unidades 7, 8 y 9</th>
                                    <th>Promedio Final</th>
                                </tr>
                                <tr>
                                    <td><?php echo $boletins['unidade123'] ?></td>
                                    <td><?php echo $boletins['unidade456'] ?></td>
                                    <td><?php echo $boletins['unidade789'] ?></td>
                                    <td><?php echo $boletins['mediafinal'] ?></td>
                                </tr>
                            </table>                
                            <?php } else if ($boletins['b_level'] == $alunogrupo['level_grupo'] and $boletins['b_level'] == 'a2-e') { ?>
                            <div class="text">
                                <p>Código Aluno: <strong><?php echo $alunogrupo['codigo_aluno'] ?></strong></p>                                
                                <p>Professor: <strong><?php echo $alunogrupo['nome_prof'] ?></strong></p>
                                <p>Nivel: <strong><?php echo $alunogrupo['level_grupo'] ?></strong></p>
                                <p>Semestre: <strong><?php echo $boletins['semestre'] ?></strong></p>
                            </div>
                            <br/>
                            <table class="table table-hover table-bordered">
                                <tr style='font-size: 12px;'>
                                    <th>Unidades 1, 2 y 3</th>
                                    <th>Unidades 4, 5 y 6</th>
                                    <th>Unidades 7, 8, 9 y 10</th>
                                    <th>Proyecto Lectura</th>
                                    <th>Promedio Final</th>
                                </tr>
                                <tr>
                                    <td><?php echo $boletins['unidade123'] ?></td>
                                    <td><?php echo $boletins['unidade456'] ?></td>
                                    <td><?php echo $boletins['unidade78910'] ?></td>
                                    <td><?php echo $boletins['proyectolectura'] ?></td>
                                    <td><?php echo $boletins['mediafinal'] ?></td>
                                </tr>
                            </table> 
                            <?php } else if ($boletins['b_level'] == $alunogrupo['level_grupo'] and $boletins['b_level'] == 'alemao') { ?>
                            <div class="text">
                                <p>Código Aluno: <strong><?php echo $alunogrupo['codigo_aluno'] ?></strong></p>                                
                                <p>Professor: <strong><?php echo $alunogrupo['nome_prof'] ?></strong></p>
                                <p>Nivel: <strong><?php echo $alunogrupo['level_grupo'] ?></strong></p>
                                <p>Semestre: <strong><?php echo $boletins['semestre'] ?></strong></p>
                            </div>
                            <br/>
                            <table class="table table-hover table-bordered">
                                <tr style='font-size: 12px;'>
                                    <th>Quiz 1</th>
                                    <th>Test 1</th>
                                    <th>Quiz 2</th>
                                    <th>Test 2</th>
                                    <th>Sprechen</th>
                                    <th>Hausau</th>
                                </tr>
                                <tr>
                                    <td><?php echo $boletins['quiz_1'] ?></td>
                                    <td><?php echo $boletins['test_1'] ?></td>
                                    <td><?php echo $boletins['quiz_2'] ?></td>
                                    <td><?php echo $boletins['test_2'] ?></td>
                                    <td><?php echo $boletins['sprechen'] ?></td>
                                    <td><?php echo $boletins['hausau'] ?></td>
                                </tr>
                            </table> 

                            <?php } else if ($boletins['b_level'] == $alunogrupo['level_grupo'] and $boletins['b_level'] == 'ingles') { ?>
                            <div class="text">
                                <p>Código Aluno: <strong><?php echo $alunogrupo['codigo_aluno'] ?></strong></p>                                
                                <p>Professor: <strong><?php echo $alunogrupo['nome_prof'] ?></strong></p>
                                <p>Nivel: <strong><?php echo $alunogrupo['level_grupo'] ?></strong></p>
                                <p>Semestre: <strong><?php echo $boletins['semestre'] ?></strong></p>
                            </div>
                            <br/>
                            <table class="table table-hover table-bordered">
                                <tr style='font-size: 12px;'>
                                    <th>Quiz 1</th>
                                    <th>Test 1</th>
                                    <th>Participação 1</th>
                                    <th>Média 1</th>

                                </tr>
                                <tr>
                                    <td><?php echo $boletins['quiz_1'] ?></td>
                                    <td><?php echo $boletins['test_1'] ?></td>
                                    <td><?php echo $boletins['participacao_1'] ?></td>
                                    <td><?php echo $boletins['media_1'] ?></td>

                                </tr>

                                <tr style='font-size: 12px;'>
                                    <th>Quiz 2</th>
                                    <th>Test 2</th>
                                    <th>Oral Teste</th>
                                    <th>Mocks</th>
                                    <th>Reading</th>
                                    <th>Participação 2</th>
                                    <th>Multroom</th>
                                    <th>Média 2</th>
                                    <th>Média Final</th>
                                </tr>
                                <tr>
                                    <td><?php echo $boletins['quiz_2'] ?></td>
                                    <td><?php echo $boletins['test_2'] ?></td>
                                    <td><?php echo $boletins['oral_test'] ?></td>
                                    <td><?php echo $boletins['mocks'] ?></td>
                                    <td><?php echo $boletins['reading'] ?></td>
                                    <td><?php echo $boletins['participacao_2'] ?></td>
                                    <td><?php echo $boletins['multroom'] ?></td>
                                    <td><?php echo $boletins['media_2'] ?></td>
                                    <td><?php echo $boletins['media_final'] ?></td>
                                </tr>
                            </table> 

                            <?php } else if ($boletins['b_level'] == $alunogrupo['level_grupo'] and $boletins['b_level'] == 'frances') { ?>
                            <div class="text">
                                <p>Código Aluno: <strong><?php echo $alunogrupo['codigo_aluno'] ?></strong></p>                                
                                <p>Professor: <strong><?php echo $alunogrupo['nome_prof'] ?></strong></p>
                                <p>Nivel: <strong><?php echo $alunogrupo['level_grupo'] ?></strong></p>
                                
                                <table class="table table-hover table-bordered" style=" width: 100%">
                                    <tr>
                                        <th style="width: 60%;">Élève</th>
                                        <th>Méthode</th>
                                        <th>Niveau</th>
                                        <th>Moyenne</th>
                                    </tr>
                                    <tr>
                                        <td><?php echo $boletins['eleve'] ?></td>
                                        <td><?php echo $boletins['methode'] ?></td>
                                        <td><?php echo $boletins['niveau'] ?></td>
                                        <td><?php echo $boletins['moyenne'] ?></td>
                                    </tr>
                                </table>
                                
                                <table class="table table-hover table-bordered" style=" width: 100%">
                                    <tr>
                                        <th colspan="4" style=" text-align: center;">Contenus Travaillés</th>
                                    </tr>
                                    <tr>
                                        <th>Unité</th>
                                        <th>Unité</th>
                                        <th>Unité</th>
                                        <th>Unité</th>
                                    </tr>
                                    <tr>
                                        <td><?php echo $boletins['travailles_unite1'] ?></td>
                                        <td><?php echo $boletins['travailles_unite2'] ?></td>
                                        <td><?php echo $boletins['travailles_unite3'] ?></td>
                                        <td><?php echo $boletins['travailles_unite4'] ?></td>
                                    </tr>
                                </table>
                                
                                <table class="table table-hover table-bordered" style=" width: 100%">
                                    <tr>
                                        <th colspan="4" style=" text-align: center;">Devoirs</th>
                                    </tr>
                                    <tr>
                                        <th>Unité</th>
                                        <th>Unité</th>
                                        <th>Unité</th>
                                        <th>Unité</th>
                                    </tr>
                                    <tr>
                                        <td><?php echo $boletins['devoirs_unite1'] ?></td>
                                        <td><?php echo $boletins['devoirs_unite2'] ?></td>
                                        <td><?php echo $boletins['devoirs_unite3'] ?></td>
                                        <td><?php echo $boletins['devoirs_unite4'] ?></td>
                                    </tr>
                                </table>
                                
                                <table class="table table-hover table-bordered" style=" width: 100%">
                                    <tr>
                                        <th colspan="5" style=" text-align: center;">Évaluations 1<sup>er</sup> bimestre</th>
                                    </tr>
                                    <tr>
                                        <th>Participation</th>
                                        <th>Devoirs</th>
                                        <th>Performance en classe</th>
                                        <th>Test écrit</th>
                                        <th>Total</th>
                                    </tr>
                                    <tr>
                                        <td><?php echo $boletins['participation'] ?></td>
                                        <td><?php echo $boletins['davoirs_1'] ?></td>
                                        <td><?php echo $boletins['performance'] ?></td>
                                        <td><?php echo $boletins['test_ecrit1'] ?></td>
                                        <td><?php echo $boletins['total_1'] ?></td>
                                    </tr>
                                    
                                </table>
                                
                                <table class="table table-hover table-bordered" style=" width: 100%">
                                    <tr>
                                        <th colspan="5" style=" text-align: center;">Évaluations 2<sup>e</sup> bimestre</th>
                                    </tr>
                                    <tr>
                                        <th>Lecture</th>
                                        <th>Devoirs</th>
                                        <th>Test oral</th>
                                        <th>Test écrit</th>
                                        <th>Total</th>
                                    </tr>
                                    <tr>
                                        <td><?php echo $boletins['lecture'] ?></td>
                                        <td><?php echo $boletins['devoirs_2'] ?></td>
                                        <td><?php echo $boletins['test_oral'] ?></td>
                                        <td><?php echo $boletins['test_ecrit2'] ?></td>
                                        <td><?php echo $boletins['total_2'] ?></td>
                                    </tr>
                                    
                                </table>
                                
                            </div>
                            <?php }?>
                            
                            
                            <?php }?>
                            <?php }?>


                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">Recados</h4>
                                </div>
                                <div class="row">
                                     <div class="panel-body">
                                        <?php foreach($data['recadogrupo'] as $recadogrupo) { ?>
                                        <?php if ($recadogrupo['cod_grupo'] == $alunogrupo['cod_grupo']){ ?>
                                        <div class="col-sm-4">

                                            <table class="table table-hover table-bordered">
                                                <tr>
                                                    <th>Título</th>
                                                    <td style="font-size: 15px; font-weight: bold;"><?php echo $recadogrupo['titulo_recado'] ?></td>
                                                </tr>
                                                <tr style="text-align: justify;">
                                                    <th>Recado</th>
                                                    <td style="font-size: 12px;"><?php echo $recadogrupo['conteudo_recado'] ?></td>
                                                </tr>
                                                <tr>
                                                    <th>Data</th>
                                                    <td><?php echo $recadogrupo['data_recado'] ?></td>
                                                </tr>

                                            </table>
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
