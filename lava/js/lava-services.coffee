angular.module('lava.services', [])
  .factory('ItineraryService', ->
    patients = [
      {pidn: 1001, name: "John Doe"},
      {pidn: 1002, name: "Jane Doe"},
      {pidn: 1003, name: "John Smith"}
    ]
    
    instruments = [
      {name: 'MAC Diagnosis', version: '3.0.0'},
      {name: 'MMSE', version: null}
    ]
  
    return {
      patients: patients
      instruments: instruments
      getPatient: (index) ->
        return patients[index]
    }
  )