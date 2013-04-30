# Dependency injection
# # Useful for testing vs. creating fake classes when testing API-dependant app
# # Dependency inject just requires you to give some data, passed into constructor as a variable 
@photogur.controller("PicturesController", ($scope, Picture) ->
  # This is not required to create variables, but it helps to document them
  $scope.newPicture
  # $scope.name = "homer"
  
  # console.log "Pictures controller is live!"
  # # Ways to debug / explore scope
  # # console.log $scope
  # # window.debugcheck = $scope
  # # Can also use actual debug tool in chrome

  # $scope.$watch('name', ->
  #   console.log "Name changed to #{$scope.name}"
  # )

  # $scope.isHomer = ->
  #   return $scope.name.toLowerCase() == 'homer'

  $scope.pictures = Picture.query(
    (data) ->
      console.log("Successfully retreived pictures")
    , (data)->
      console.log("Error retreiving pictures")
    )

  $scope.savePicture = ->
    console.log "The picture is ", $scope.newPicture
    Picture.save($scope.newPicture, (data) ->
      console.log ("Image saved!")
    , (data)->
      console.log ("Could not save picture!")
    )
)