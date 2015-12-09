<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>{{page_title}}</title>
  <meta name="description" content="See your external IP">
  <meta name="author" content="Stefan Midjich">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/css/normalize.css">
  <link rel="stylesheet" href="/css/skeleton.css">
  <link rel="stylesheet" href="/css/custom.css">
  <link rel="icon" type="image/png" href="img/favicon.png">
  <link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">

  <!--[if lte IE 8]>
    <link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/grids-responsive-old-ie-min.css">
  <![endif]-->
  <!--[if gt IE 8]><!-->
    <link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/grids-responsive-min.css">
  <!--<![endif]-->

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/8.8.0/styles/default.min.css">
  
  <!--[if lt IE 9]>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7/html5shiv.js"></script>
  <![endif]-->

</head>
<body>

  <!--<a href="https://github.com/stemid/ipa.sh#usage"><img style="position: absolute; top: 0; right: 0; border: 0;" src="https://camo.githubusercontent.com/a6677b08c955af8400f44c6298f40e7d19cc5b2d/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f72696768745f677261795f3664366436642e706e67" alt="Fork me on GitHub" data-canonical-src="https://s3.amazonaws.com/github/ribbons/forkme_right_gray_6d6d6d.png"></a>-->
  <span id="forkongithub"><a href="https://github.com/stemid/ipa.sh#usage">Fork me on GitHub</a></span>

  <div class="section hero">
    <div class="container">
      <div class="row">
        <div class="column">
          <h4 class="hero-heading">{{page_title}}</h4>
        </div>
      </div>
    </div>
  </div>

  % if verbose:
  <div class="section table">
    <div class="container">
      <div class="row">
        <div class="one-third column">
          <h3 id="more">More info</h3>
        </div>
        <div id="ip-info" class="two-thirds column table-content">
          {{!base}}
        </div>
      </div>
    </div>
  </div>
  % end


</body>
</html>

