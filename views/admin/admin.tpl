<div class="container">
    <ol class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['link']; ?>"><?php echo $breadcrumb['title']; ?></a></li>
        <?php } ?>
    </ol>
    
    <p>Você esta logado como <?php echo $username ?>. Antes de sair finalize a sessão clicando em <a href="<?php echo $destroy ?>">Sair</a>.</p>

    <div class="row">
        <div class="col-sm-3">
            <div class="admin_menu_left">
                <div class="mural_title">
                    <h3>Artigos do Mural</h3>
                </div>
                <ul class="list-unstyled">
                    <li>Teste 1</li>
                    <li>Teste 2</li>
                    <li>Teste 3</li>
                </ul>
            </div>
        </div>
        
        
    </div>

    <div>
        <a class="btn btn-default" href="<?php echo $destroy ?>" role="button">Destroy</a>
    </div>

</div>
