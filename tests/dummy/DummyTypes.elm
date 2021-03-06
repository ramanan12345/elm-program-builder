module DummyTypes exposing (..)

import MainModel exposing (..)
import MainUpdate


dummyModel : MainModel.Model
dummyModel =
    makeDummyModel []


dummyModelWithSessions : MainModel.Model
dummyModelWithSessions =
    makeDummyModel dummySessions


makeDummyModel : List Session -> MainModel.Model
makeDummyModel sessions =
    { tracks = [ Track 1 "track 1" "track 1 description", Track 2 "track 2" "track 2 description" ]
    , columns = [ Column 1 "Pediatric Sessions", Column 2 "Other Sessions" ]
    , showNewSessionUi = False
    , showNewTrackUi = False
    , showNewColumnUi = False
    , showManageDatesUi = False
    , published = False
    , showPreviewUi = False
    , newSession = blankSession 1
    , newSessionDate = DateWithoutTime 2017 1 1
    , editSession = blankSession 1
    , editSessionDate = DateWithoutTime 2017 1 1
    , newColumn = blankColumn 1
    , newTrack = blankTrack 1
    , idOfSessionBeingEdited = Nothing
    , eventId = ""
    , submissionIdsInputs =
        [ { submissionIds = ""
          , startTime = Nothing
          , endTime = Nothing
          , id = 1
          }
        ]
    , submissions = [ Submission 1 ]
    , datePickerClosed = True
    , pickedDates = initialDates
    , pickedTracks = []
    , pickedColumns = []
    , datesWithSessions = [ { date = DateWithoutTime 2017 1 1, sessions = sessions } ]
    , host = ""
    , showPublishPage = False
    , invalidSubmissionIdsInput = ""
    , showValidation = True
    , scheduleSubmissionsIndividually = False
    }


dummyApiUpdateGet : MainModel.ApiUpdateGet
dummyApiUpdateGet =
    { datesWithSessions = dummyDatesWithSessions
    , tracks = dummyTracks
    , columns = dummyColumn
    , submissions = []
    , published = False
    }


updatedModel : MainModel.Model
updatedModel =
    MainUpdate.updateModelWithApiUpdateGet dummyModel dummyApiUpdateGet


dummyColumn : List MainModel.Column
dummyColumn =
    [ { id = 1
      , name = "Test column"
      }
    ]


dummyDates : List MainModel.DateWithoutTime
dummyDates =
    [ { year = 2017
      , month = 1
      , day = 1
      }
    ]


dummyTracks : List MainModel.Track
dummyTracks =
    [ { id = 1
      , name = "Test track"
      , description = "Test track description"
      }
    ]


dummyDatesWithSessions : List MainModel.DateWithSessions
dummyDatesWithSessions =
    [ { date = MainModel.DateWithoutTime 2017 1 1, sessions = dummySessions } ]


dummySessions : List MainModel.Session
dummySessions =
    [ MainModel.Session
        1
        "Conceptualising diabetes self-management as an occupation"
        "This a description of the inital session"
        (MainModel.TimeOfDay 9 0)
        (MainModel.TimeOfDay 9 1)
        (MainModel.ColumnId 1)
        (Just 1)
        "The aquariam"
        [ { id = 1, startTime = Just { hour = 11, minute = 0 }, endTime = Just { hour = 11, minute = 45 } }
        , { id = 2, startTime = Just { hour = 12, minute = 0 }, endTime = Just { hour = 12, minute = 30 } }
        , { id = 3, startTime = Just { hour = 12, minute = 0 }, endTime = Just { hour = 12, minute = 30 } }
        , { id = 4, startTime = Just { hour = 12, minute = 0 }, endTime = Just { hour = 12, minute = 30 } }
        ]
        "Chairman Dave"
    , MainModel.Session
        2
        "Computers n stuff sesh 2"
        "This a description of the second inital session"
        (MainModel.TimeOfDay 10 30)
        (MainModel.TimeOfDay 11 0)
        (MainModel.ColumnId 1)
        (Just 1)
        "The observatory"
        [ { id = 5, startTime = Nothing, endTime = Nothing }
        , { id = 2, startTime = Nothing, endTime = Nothing }
        ]
        "Chairwoman Sue"
    ]
