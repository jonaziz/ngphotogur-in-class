@photogur.factory('Picture', ($resource) ->
  return $resource('/api/v1/pictures/:id',
    {id: '@id'},
    {update: {method: "PUT"}}
  )
)