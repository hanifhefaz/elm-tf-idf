module Documents exposing (documents)

{-| 

#Sample Documents

@docs documents

-}

{-|
The `documents` module contains a list of documents, where each document is represented 
as a list of words (fruits in this case). This structure can be utilized for various 
text processing tasks, such as calculating term frequency-inverse document frequency (TF-IDF).

Each document showcases a mixture of fruit names to provide a diverse vocabulary for analysis.
-}
documents : List (List String)
documents =
    [ [ "apple", "orange", "banana", "kiwi", "grape" ]
    , [ "banana", "orange", "apple", "mango", "peach" ]
    , [ "apple", "kiwi", "pear", "banana", "grape" ]
    , [ "kiwi", "apple", "banana", "orange", "strawberry" ]
    , [ "apple", "banana", "kiwi", "orange", "watermelon" ]
    , [ "banana", "apple", "grapefruit", "kiwi", "melon" ]
    , [ "orange", "banana", "apple", "blueberry", "kiwi" ]
    , [ "peach", "plum", "kiwi", "banana", "apple" ]
    , [ "grape", "orange", "apple", "banana", "pear" ]
    , [ "kiwi", "bananas", "apple", "mango", "cantaloupe" ]
    , [ "apple", "banana", "kiwi", "orange", "grape" ]
    , [ "orange", "apple", "banana", "pear", "peach" ]
    , [ "kiwi", "grape", "watermelon", "apple", "strawberry" ]
    , [ "banana", "kiwi", "apple", "orange", "pineapple" ]
    , [ "grape", "banana", "kiwi", "apple", "berry" ]
    , [ "apple", "orange", "banana", "kiwi", "mango" ]
    , [ "kiwi", "banana", "apple", "passionfruit", "grape" ]
    , [ "orange", "kiwi", "banana", "apple", "melon" ]
    , [ "apple", "banana", "kiwi", "grapefruit", "orange" ]
    , [ "banana", "apple", "kiwi", "berry", "peach" ]
    , [ "kiwi", "orange", "banana", "apples", "papaya" ]
    ]