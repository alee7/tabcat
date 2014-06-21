lava.controller('MacDiagnosisCtrl', ($scope, $http, $ionicModal) ->
  $http.get('http://google.com').success((data) ->
    $scope.priorDx = data
  )

  $scope.test = "a test!!"

  $ionicModal.fromTemplateUrl('my-modal.html', {
    scope: $scope,
    animation: 'slide-in-up'
  }).then((modal) ->
    $scope.modal = modal
  )

  $scope.openModal = ->
    $scope.modal.show()

  $scope.closeModal = ->
    $scope.modal.hide()

  # Cleanup the modal when we're done with it!
  $scope.$on('$destroy', ->
    $scope.modal.remove()
  )
  
  # Execute action on hide modal
  $scope.$on('modal.hidden', ->
    # Execute action
  )

  # Execute action on remove modal
  $scope.$on('modal.removed', ->
    # Execute action
  )

)