@photogur = angular.module('photogur', [])
# window.photogur = angular.module('photogur', [])

@photogur.config(($routeProvider, $locationProvider) ->

  # Enable HTML5 history support. For browsers that support HTML5 history this means
  # You can use a url like this
  #    http://localhost:3000/pictures/new
  # Instead of this
  #    http://localhost:3000/#/pictures/new
  # 
  # Here's a detailed explanation of how HTML5 history works: 
  # http://diveintohtml5.info/history.html
  $locationProvider.html5Mode(true)

  $routeProvider
  .when("/", {templateUrl: "pictures/index", controller: "PicturesController"})
  .when("/pictures", {templateUrl: "pictures/index", controller: "PicturesController"})
  .when("/pictures/:id", {templateUrl: "pictures/show", controller: "PictureController"})
  .when("/pictures/:id/edit", {templateUrl: "pictures/edit", controller: "PictureController"})
  .when("/pictures/new", {templateUrl: "pictures/new", controller: "PicturesController"})
  .otherwise({template: "page not found by Angular"})
  # $routeProvider.when(…) EACH LINE OR AS SHOWN ABOVE
  # templateUrl does some smart stuff via JST (hamlc)
  )

@photogur.run(['$window', '$templateCache', ($window, $templateCache) ->
  # Load the hamlc templates into the angular template cache when angular starts up.
  # This means angular doesn't need to download each template from the server 
  # when a page is requested.
  $templateCache.put(name, templateFunction) for name, templateFunction of $window.JST
])