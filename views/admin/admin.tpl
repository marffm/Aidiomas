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

            <div class="admin_menu_left">
                <div class="mural_title">
                    <h4>Artigos do Mural</h4>                    
                </div>
                <ol>
                    <?php foreach ($data['results'] as $value){ ?>
                    <li><?php echo $value['title']; ?></li>
                    <?php } ?>
                </ol>
            </div>
        </div>
        
        <div class="col-sm-9">

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Mural - Conteúdo</h3>
                </div>
                
                <div class="panel-body">
                    
                    <?php foreach ($data['results'] as $results) { ?>
                    <div class="col-sm-6">                        
                        <div class="panel panel-default">
                            <form action="admin/updateArticle/<?php echo $results['id'] ?>" method="POST" class="panel-body">
                                <input type="hidden" name="id" id="id" value="<?php echo $results['id'] ?>" />
                                <span >Titulo</span>
                                <input type="text" name="title" id="title" class="form-control" placeholder="Titulo" value="<?php echo $results['title'] ?>" />
                                <span >Resumo</span>
                                <textarea name="summary" id="summary" class="form-control admin-textarea-sum" placeholder="Sumario"><?php echo utf8_encode($results['summary']) ?></textarea>
                                <span >Conteúdo</span>
                                <textarea name="content" id="content" class="form-control admin-textarea-cont" placeholder="Conteúdo"><?php echo utf8_encode($results['content']) ?></textarea>
                                <span >Data</span>
                                <input type="date" name="date" id="date" class="form-control" aria-describedby="basic-addon1" value="<?php echo $results['date'] ?>" />
                                
                                <div class="article_buttons">
                                    <button type="submit" class="btn btn-default">Salvar</button>
                                    <a href="admin/deleteArticle/<?php echo $results['id']; ?>" class="btn btn-default">Deletar</a>
                                </div>
                            </form>
                        </div>                        
                    </div>
                    <?php } ?>
                    
                    <div class="col-sm-12">
                        
                        <div class="panel panel-default">
                            <form action="admin/saveArticle" method="POST" class="panel-body">
                                <span >Titulo</span>
                                <input type="text" name="title" id="title" required max-length='200' class="form-control" placeholder="Titulo">
                                <span >Resumo</span>
                                <textarea name="summary" id="summary" class="form-control admin-textarea-sum" placeholder="Sumario"></textarea>
                                <span >Conteúdo</span>
                                <textarea name="content" id="content" class="form-control admin-textarea-cont" placeholder="Conteúdo"></textarea>
                                <span >Data</span>
                                <input type="date" name="date" id="date" class="form-control" aria-describedby="basic-addon1">
                                
                                <div class="article_buttons">
                                    <button type="submit" class="btn btn-default">Salvar</button>                                    
                                </div>
                            </form>
                        </div>
                        
                    </div>
                    
                </div>
            </div>

        </div>
        
    </div>

</div>
