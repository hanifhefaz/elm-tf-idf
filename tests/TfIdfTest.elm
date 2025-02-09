module TfIdfTest exposing (..)

import Test exposing (..)
import Expect exposing (..)
import TfIdf exposing (..)

-- Sample documents for testing
documents : List (List String)
documents =
    [ ["the", "cat", "sat", "on", "the", "mat"]
    , ["the", "dog", "sat", "on", "the", "log"]
    , ["the", "cat", "and", "the", "dog"]
    ]

-- Tests for term frequency (TF)
tfTests : Test
tfTests =
    describe "Term Frequency Tests"
        [ test "TF of 'the' in the first document" <|
            \() ->
                let
                    result = tf "the" (List.head documents |> Maybe.withDefault [])
                in
                Expect.within (Absolute 0.0001) result (2 / 6)

        , test "TF of 'cat' in the first document" <|
            \() ->
                let
                    result = tf "cat" (List.head documents |> Maybe.withDefault [])
                in
                Expect.within (Absolute 0.0001) result (1 / 6)

        , test "TF of 'dog' in the second document" <|
            \() ->
                let
                    result = tf "dog" (List.head documents |> Maybe.withDefault [])
                in
                Expect.equal result 0
        ]

-- Tests for inverse document frequency (IDF)
idfTests : Test
idfTests =
    describe "Inverse Document Frequency Tests"
        [ test "IDF of 'the' across documents" <|
            \() ->
                let
                    result = idf "the" documents
                in
                Expect.within (Absolute 0.0001) result (logBase 10 (3 / 3))

        , test "IDF of 'cat' across documents" <|
            \() ->
                let
                    result = idf "cat" documents
                in
                Expect.within (Absolute 0.0001) result (logBase 10 (3 / 2))

        , test "IDF of 'log' across documents" <|
            \() ->
                let
                    result = idf "log" documents
                in
                Expect.within (Absolute 0.0001) result (logBase 10 (3 / 1))
        ]

-- Tests for TF-IDF
tfidfTests : Test
tfidfTests =
    describe "TF-IDF Tests"
        [ test "TF-IDF of 'the' in the first document" <|
            \() ->
                let
                    result = tfidf "the" (List.head documents |> Maybe.withDefault []) documents
                in
                Expect.within (Absolute 0.0001) result ((2 / 6) * (logBase 10 (3 / 3)))

        , test "TF-IDF of 'cat' in the first document" <|
            \() ->
                let
                    result = tfidf "cat" (List.head documents |> Maybe.withDefault []) documents
                in
                Expect.within (Absolute 0.0001) result ((1 / 6) * (logBase 10 (3 / 2)))

        , test "TF-IDF of 'dog' in the first document" <|
            \() ->
                let
                    result = tfidf "dog" (List.head documents |> Maybe.withDefault []) documents
                in
                Expect.equal result 0
        ]

-- Main test runner
tests : Test
tests =
    describe "TF-IDF Module Tests"
        [ tfTests
        , idfTests
        , tfidfTests
        ]