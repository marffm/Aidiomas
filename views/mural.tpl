<div class="container">

    <ol class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['link']; ?>"><?php echo $breadcrumb['title']; ?></a></li>
        <?php } ?>
    </ol>

    <div class="row">
        
        <?php foreach ($data['results'] as $results) { ?>
        
        <div class="col-sm-3">
            
            <div class="mural_box">
                <div class="image">
                    <img src="<?php echo $data['image'] ?>">
                </div>
                
                <div class="title">
                    <h3><?php echo $results['title'] ?></h3>
                </div>
                
                <div class="summary">
                    <span><?php echo $results['summary'] ?></span>
                </div>
                
                <div class="date">
                    <p><?php echo $results['date'] ?></p>
                </div>
            </div>
            
        </div>

        <?php } ?>
        


    </div>
</div>
