<div class="container">
    <ol class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['link']; ?>"><?php echo $breadcrumb['title']; ?></a></li>
        <?php } ?>
    </ol>

    <div class="row">
        <h1>We are inside Admin - User <?php echo $username; ?></h1>
    </div>

    <div>
        <a class="btn btn-default" href="<?php echo PATH_URL ?>admin/destroy" role="button">Destroy</a>
        <button class="btn btn-success" onclick="<?php echo destroy() ?>">Logar</button>
    </div>

</div>
