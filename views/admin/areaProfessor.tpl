<div class="container">
    <ol class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['link']; ?>"><?php echo $breadcrumb['title']; ?></a></li>
        <?php } ?>
    </ol>
    
    <div class="row">
        <h2>Welcome Professor <?php echo $username ?> - category <?php echo $usercategory ?></h2>
    </div>
    
    
    <div>
        <a class="btn btn-default" href="<?php echo $destroy ?>" role="button">Destroy</a>
    </div>
    
</div>
