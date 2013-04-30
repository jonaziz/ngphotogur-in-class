@photogur.controller("PictureController", ($scope, Picture) ->

  $scope.picture = Picture.get(
    {"@id"},
    
    )
)