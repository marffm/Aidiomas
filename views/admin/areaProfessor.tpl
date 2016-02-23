<div class="container">
    <ol class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
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
                            <h3 class="panel-title">Grupo - <?php echo $grupos['cod_grupo'] ?></h3>
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
                                    <td class="deletar"><a href="<?php echo PATH_URL ?>aluno/setAluno/<?php echo $grupoalunos['codigo'] ?>">Edit</a></td>
                                </tr>
                                <?php } ?>
                                <?php } ?>
                            </table>
                        </div>
                    </div>
                    <?php } ?>
                </div>
            </div>

        </div>

    </div>



</div>
