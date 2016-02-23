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
                            <?php }?>

                            <?php }?>
                            <?php }?>

                        </div>
                    </div>
                    <?php } ?>

                </div>
            </div>

        </div>

    </div>

</div>
