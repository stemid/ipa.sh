<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>{{page_title}}</title>
  <meta name="description" content="See your external IP">
  <meta name="author" content="Stefan Midjich">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/normalize.css">
  <link rel="stylesheet" href="css/skeleton.css">
  <link rel="stylesheet" href="css/custom.css">
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

  <style>
    pre code {
      white-space: pre;
      white-space: pre\9;
      word-wrap: normal;
      font-size: 0.8em;
      font-family:monospace,monospace;
    }
    
    mark {
      font-style:italic;
      font-size:0.8em;
      background:0;
    }
    .message-box {
        margin: 0 0.1em;
        padding: 0.3em 1em;
        color: #fff;
        background: #999;
        font-size: 80%;
    }
    .message-box-red {
        background: #df2d4f;
    }

    .button-success,
    .button-error,
    .button-warning,
    .button-secondary {
      color: white;
      border-radius: 4px;
      text-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
    }

    .button-success {
      background: rgb(28, 184, 65); /* this is a green */
    }

    .button-error {
      background: rgb(202, 60, 60); /* this is a maroon */
    }

    .button-warning {
      background: rgb(223, 117, 20); /* this is an orange */
    }

    .button-secondary {
      background: rgb(66, 184, 221); /* this is a light blue */
    }
  </style>

</head>
<body>

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
        <div class="one-half column">
          <h3>More info</h3>
          <div class="one-half column phones page-content">
            {{!base}}
          </div>
        </div>
      </div>
    </div>
  </div>
  % end


</body>
</html>

