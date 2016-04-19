<div class="container">
    <ol class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['link']; ?>"><?php echo $breadcrumb['title']; ?></a></li>
        <?php } ?>
    </ol>

    <div class="promocoes">
        <div class="row">

            <div class="col-sm-4">
                <img src="public/images/promocoes/traga_amigo.png"/>
                <br/>
                <ol>
                    <li>amigo = 30% na 1ª Parcela*</li>
                    <li>amigos = 60% na 1ª Parcela*</li>
                    <li>amigos = 01 Parcela Gratuita.</li>
                    <li>amigos = 50% de desconto no 1° semestre.</li>
                </ol>
                <p>*Curso regular parcelado em 06 pagamentos, por semestre letivo.</p>
            </div>
            
            <div class="col-sm-4">
                <img src="public/images/promocoes/ingles1.png"/>
            </div>
            
            <div class="col-sm-4">
                <img src="public/images/promocoes/ingles2.png"/>
            </div>


        </div>
    </div>
</div>
