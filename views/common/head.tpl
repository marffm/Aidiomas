<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<html lang="pt">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta http-equiv="Location" content="http://localhost/aidiomas/home">
        <title><?php echo htmlspecialchars('Aliança Idiomas - ' . $data['pageTitle'] ); ?></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Escola de idiomas em Franca São Paulo.">
        <meta name="keywords" content="Escola de Idiomas.">
        <meta name="author" content="Marcelo F. F. Martins">

        <link rel="stylesheet" type="text/css" href="<?php echo PATH_URL ?>public/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="<?php echo PATH_URL ?>public/css/stylesheet.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="<?php echo PATH_URL ?>public/css/hover.css">
        <link rel="stylesheet" href="//blueimp.github.io/Gallery/css/blueimp-gallery.min.css">
        <link rel="stylesheet" href="<?php echo PATH_URL ?>public/css/bootstrap-image-gallery.min.css">

        <script type="text/javascript" src="<?php echo PATH_URL ?>public/js/jquery-2.2.0.min.js"></script>
        <script type="text/javascript" src="<?php echo PATH_URL ?>public/js/bootstrap.min.js"></script>
        <script src="//blueimp.github.io/Gallery/js/jquery.blueimp-gallery.min.js"></script>
        <script src="<?php echo PATH_URL ?>public/js/bootstrap-image-gallery.min.js"></script>

    </head>


  <body>

      <header>


          <div class="menutop">
              <div class="container">
                  <div class="row">

                      <div class="col-sm-1" id='buttons'>
                          <a href="<?php echo PATH_URL ?>home">Home</a>
                      </div>
                      <div class="col-sm-2" id='buttons'>
                          <a href="<?php echo $login['area_professor'] ?>">Área do Professor</a>
                      </div>
                      <div class="col-sm-3 col-sm-offset-6" id='buttons'>
                          <div class="login_button">
                            <a href="<?php echo $text_link ?>"><?php echo $text_admin ?></a>
                          </div>
                      </div>

                  </div>
              </div>
          </div>
          
          <div class="logos">
              <div class="container">
                  <div class="row">
                      
                      <div class='col-sm-2 col-sm-offset-1 col-xs-6'>
                          <a href="<?php echo PATH_URL ?>home">
                              <image src="<?php echo PATH_URL ?>public/images/logos/da_logo.png" id="da_logo" />
                          </a>
                      </div>
                      
                      <div class="col-sm-4 col-sm-offset-1">
                          <a href="<?php echo PATH_URL ?>home">
                            <image src="<?php echo PATH_URL ?>public/images/logos/alianca_logo.png" id="alianca_logo" />
                          </a>
                      </div>
                      
                      <div class="col-sm-2 col-sm-offset-1 col-xs-6">
                          <a href="<?php echo PATH_URL ?>home">
                            <image src="<?php echo PATH_URL ?>public/images/logos/af_logo.png" id="af_logo" />
                          </a>
                      </div>                         
                      
                  </div>
              </div>
          </div>
          
          <div class="menu_links">
              <div class="container">
                  <div class="row">
                      
                      <div class="col-sm-2 hvr-bounce-to-top" id="buttons_links">
                          <a href="<?php echo PATH_URL ?>teste">Estrutura</a>
                      </div>
                      <div class="col-sm-2 hvr-bounce-to-top" id="buttons_links">
                          <a href="<?php echo PATH_URL ?>cursos">Cursos</a>
                      </div>
                      <div class="col-sm-2 hvr-bounce-to-top" id="buttons_links">
                          <a href="<?php echo PATH_URL ?>aprendizagem">Aprendizagem</a>
                      </div>
                      <div class="col-sm-2 hvr-bounce-to-top" id="buttons_links">
                          <a href="<?php echo PATH_URL ?>parcerias">Parcerias</a>
                      </div>
                      <div class="col-sm-2 hvr-bounce-to-top" id="buttons_links">
                          <a href="<?php echo $login['area_aluno'] ?>">Área do Aluno</a>
                      </div>
                      <div class="col-sm-2 hvr-bounce-to-top" id="buttons_links">
                          <a href="<?php echo PATH_URL ?>contato">Contato</a>
                      </div>
                      
                  </div>
              </div>
          </div>


      </header>
