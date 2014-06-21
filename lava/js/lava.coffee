angular.module('lavaApp', [
  'ionic',
  'lava.services',
  'lava.controllers'
]).
config(($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise('/patients')

  $stateProvider.state('lava', {
    abstract: true,
    templateUrl: 'views/home.html'
  })

  $stateProvider.state('lava.patients', {
    abstract: true,
    url: '/patients',
    views: {
      patients: {
        template: '<ion-nav-view></ion-nav-view>'
      }
    }
  })

  $stateProvider.state('lava.patients.index', {
    url: '',
    templateUrl: 'views/patients.html',
    controller: 'ItineraryCtrl'
  })

  $stateProvider.state('lava.patients.detail', {
    url: '/:patient',
    templateUrl: 'views/patient.html',
    controller: 'PatientCtrl',
    resolve: {
      patient: ($stateParams, ItineraryService) ->
        return ItineraryService.getPatient($stateParams.patient)
    }
  })

  $stateProvider.state('lava.help', {
    url: '/help',
    views: {
      help: {
        templateUrl: 'views/help.html'
      }
    }
  })
  
)



