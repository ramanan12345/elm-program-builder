module MainMessages exposing (..)

import Http
import MainModel
import Date exposing (Date)


type Msg
    = AddNewColumn
    | AddNewDate String Date
    | AddNewTrack
    | CancelAction
    | UpdateColumns
    | CreateNewSession
    | CreateSubmissionInput
    | DeleteSubmissionInput Int
    | UpdateTracks
    | DeleteColumn Int
    | DeleteDate Int
    | DeleteSession Int
    | DeleteTrack MainModel.TrackId
    | EditSession
    | GetDateAndThenAddDate String
    | MoveColumnUp Int
    | MoveColumnDown Int
    | NewColumn
    | NewTrack
    | PublishProgrammeBuilder
    | UpdatePickedDates (List String)
    | UpdateDates (List String)
    | SaveModel (Result Http.Error MainModel.ApiUpdatePost)
    | SelectSessionToEdit Int
    | SetSessionSubmissionStartTimes Int String
    | SetSessionSubmissionEndTimes Int String
    | ShowValidationMessage
    | ToggleManageDatesUi
    | ToggleNewColumnUi
    | ToggleNewSessionUi
    | ToggleNewTrackUi
    | ToggleScheduleSubmissionsIndividually
    | UpdateModel (Result Http.Error MainModel.ApiUpdateGet)
    | UpdateNewColumnName String
    | UpdateNewSessionChair String
    | UpdateNewSessionColumn String
    | UpdateNewSessionDate String
    | UpdateNewSessionDescription String
    | UpdateNewSessionEndHour String
    | UpdateNewSessionEndMinute String
    | UpdateNewSessionLocation String
    | UpdateNewSessionName String
    | UpdateNewSessionStartHour String
    | UpdateNewSessionStartMinute String
    | UpdateNewSessionSubmissionIds Int (Maybe MainModel.TimeOfDay) (Maybe MainModel.TimeOfDay) String
    | UpdateNewSessionTrack (Maybe MainModel.TrackId)
    | UpdateNewTrackDescription String
    | UpdateNewTrackName String
    | UpdatePickedColumn Int String
    | UpdatePickedTrack Int MainModel.TrackFields String
