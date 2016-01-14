<div class="container">

    <ol class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['link']; ?>"><?php echo $breadcrumb['title']; ?></a></li>
        <?php } ?>
    </ol>

    <div class="eventos">
        <div class="row">

            <div class="events">
                <div class="col-sm-4">
                    <img src="<?php echo PATH_URL ?>public/images/eventos/voltaaomundo.png" alt="Volta ao Mundo">
                    <p>Volta ao mundo em sete festas é um evento que tem como 
                        objetivo a interação entre as culturas e a troca de 
                        experiências gastronômicas e costumes de sete países. 
                        Em 2014 a união e a amizade dos alunos, convidados e 
                        professores no Centro Linguístico de Franca foi um 
                        sucesso, assim, França, Itália, Alemanha, Espanha, 
                        Latim, Estados Unidos e Brasil falaram um só idioma, 
                        a confraternização.</p>
                    
                    <div class="thumbnails">
                        <a href="<?php echo PATH_URL ?>public/images/eventos/volta/01.jpg" title="Foto 1" data-gallery>
                            <img src="<?php echo PATH_URL ?>public/images/eventos/volta/01.jpg"" alt="foto1" class="img-thumbnail">
                        </a>
                        <a href="<?php echo PATH_URL ?>public/images/eventos/volta/02.jpg" title="Foto 2" data-gallery>
                            <img src="<?php echo PATH_URL ?>public/images/eventos/volta/02.jpg"" alt="foto1" class="img-thumbnail">
                        </a>
                        <a href="<?php echo PATH_URL ?>public/images/eventos/volta/03.jpg" title="Foto 3" data-gallery>
                            <img src="<?php echo PATH_URL ?>public/images/eventos/volta/03.jpg"" alt="foto1" class="img-thumbnail">
                        </a>
                        <a href="<?php echo PATH_URL ?>public/images/eventos/volta/04.jpg" title="Foto 4" data-gallery>
                            <img src="<?php echo PATH_URL ?>public/images/eventos/volta/04.jpg"" alt="foto1" class="img-thumbnail">
                        </a>
                        <a href="<?php echo PATH_URL ?>public/images/eventos/volta/05.jpg" title="Foto 5" data-gallery>
                            <img src="<?php echo PATH_URL ?>public/images/eventos/volta/05.jpg"" alt="foto1" class="img-thumbnail">
                        </a>
                        <a href="<?php echo PATH_URL ?>public/images/eventos/volta/06.jpg" title="Foto 6" data-gallery>
                            <img src="<?php echo PATH_URL ?>public/images/eventos/volta/06.jpg"" alt="foto1" class="img-thumbnail">
                        </a>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
    
    
    
    
    
    
    <div id="blueimp-gallery" class="blueimp-gallery" data-use-bootstrap-modal="false">
        <!-- The container for the modal slides -->
        <div class="slides"></div>
        <!-- Controls for the borderless lightbox -->
        <h3 class="title"></h3>
        <a class="prev">‹</a>
        <a class="next">›</a>
        <a class="close">×</a>
        <a class="play-pause"></a>
        <ol class="indicator"></ol>
        <!-- The modal dialog, which will be used to wrap the lightbox content -->
        <div class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body next"></div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default pull-left prev">
                            <i class="glyphicon glyphicon-chevron-left"></i>
                            Previous
                        </button>
                        <button type="button" class="btn btn-primary next">
                            Next
                            <i class="glyphicon glyphicon-chevron-right"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
