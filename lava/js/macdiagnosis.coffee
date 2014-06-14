macdiagnosisApp = angular.module('macdiagnosisApp', ['ionic'])

macdiagnosisApp.controller('MacDiagnosisCtrl', ($scope, $http) ->
  $http.get('http://google.com').success((data) ->
    $scope.priorDx = data
  )

  $scope.test = "a test!!"
)
