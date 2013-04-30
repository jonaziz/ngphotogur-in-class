@photogur.controller("PictureController", ($scope, $routeParams, Picture) ->

  $scope.picture = Picture.get(
    # Can do this, which is safe for sure
    {id: $routeParams.id},
    # But this is also possible and more concise
    # $routeParams
    $.noop,
    (data)->
      $scope.errorMessage = ("Error retreiving photo id " + $routeParams.id)
    )
)