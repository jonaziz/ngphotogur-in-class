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

  $scope.updatePicture = ->
    console.log "Updating picture: ", $scope.newPicture
    Picture.update($scope.picture,
      (data) ->
        console.log ("Image saved!")
      ,(data)->
        $scope.errors = data.data.errors
    )
    
)