angular.module('lava.services', [])
  .factory('ItineraryService', ->
    johnInstruments = {
      macdiagnosis: {name: 'MAC Diagnosis', version: '3.0.0'},
      mmse: {name: 'MMSE', version: null}
    }

    janeInstruments = {
      faq: {name: 'FAQ', version: null}
    }

    patients = {
      1001: {name: "John Doe", instruments: johnInstruments},
      1002: {name: "Jane Doe", instruments: janeInstruments},
      1003: {name: "John Smith", instruments: null}
    }

    return {
      patients: patients
      getPatient: (pidn) ->
        return patients[pidn]
      getInstrument: (pidn, instrument) ->
        return patients[pidn].instruments[instrument]
    }
  )