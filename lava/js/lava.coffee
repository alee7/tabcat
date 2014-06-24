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
    url: '/:pidn',
    templateUrl: 'views/patient.html',
    controller: 'PatientCtrl',
    resolve: {
      currentPidn: ($stateParams) ->
        return $stateParams.pidn
      patient: ($stateParams, ItineraryService) ->
        return ItineraryService.getPatient($stateParams.pidn)
    }
  })
  
  $stateProvider.state('lava.patients.detail.instruments', {
    url: '/instruments/:instrid',
    templateUrl: 'views/instrument.html',
    controller: 'InstrumentCtrl',
    resolve: {
      instrument: ($stateParams, currentPidn, ItineraryService) ->
        return ItineraryService.getInstrument(currentPidn, $stateParams.instrid)
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



