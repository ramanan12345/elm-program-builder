module NewColumnViewTests exposing (..)

import Test exposing (..)
import Expect
import NewColumnView
import MainModel


-- showNewTrackUi is true for initial model


dummyModel : MainModel.Model
dummyModel =
    MainModel.initialModel


all : Test
all =
    describe "newColumnView functions"
        [ test "newColumnWarning shows message when there is no column name" <|
            \() ->
                let
                    newModel =
                        { dummyModel | showNewTrackUi = False, showNewColumnUi = True }
                in
                    Expect.equal (NewColumnView.newColumnWarning newModel) ("Cannot create: Column name field is empty")
        ]
