<div class="container">
    <ol class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['link']; ?>"><?php echo $breadcrumb['title']; ?></a></li>
        <?php } ?>
    </ol>
    
    <div class="row">
        <?php foreach ($data['articles'] as $article) { ?>
        <div class="col-sm-8 col-sm-offset-2">
            
            <div class="mural_box">
                <div class="image">
                    <img src="<?php echo $data['image'] ?>">
                </div>
                
                <div class="title">
                    <h3><?php echo utf8_encode($article['title']) ?></h3>
                </div>
                
                <div class="summary">
                    <a href="#"><span><?php echo utf8_encode($article['summary']) ?></span></a>
                </div>
                <br/>
                <div class="content">
                    <a href="#"><span><?php echo utf8_encode($article['content']) ?></span></a>
                </div>
                
                <div class="date">
                    <p><?php echo $dataFinal ?></p>
                </div>
                
            </div>
            
        </div>
        
        <?php } ?>
    
    </div>
    
</div>
