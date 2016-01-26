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
                <p class="admin-logoff"><a href="<?php echo $data['destroy'] ?>">Sair</a></p>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">Alunos</h4>
                </div>
                <div class="panel-body">
                    <a href="#" class="list-group-item">Fabiana - paragrafo</a>
                    <a href="#" class="list-group-item">Leticia - Paragrafo</a>
                    <a href="#" class="list-group-item active">Cadastrar Aluno</a>
                </div>
            </div>
        </div>
        
        <div class="col-sm-9">
            
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">Cadastro de Professor</h4>
                </div>
                <div class="panel-body">
                    <form action="cadastrarProf/insertProf"
                </div>
            </div>
            
        </div>

    </div>
    
    
    
</div>