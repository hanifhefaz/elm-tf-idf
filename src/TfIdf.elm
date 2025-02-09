module TfIdf exposing (tf, idf, tfidf, calculateTfidfForTerm)
{-| 

#Term Frequency TF

@docs tf

#Inverse Document Frequency IDF

@docs idf

#Calculate the TF-IDF score for a given term in a specific document 

@docs tfidf

#Calculate the TF-IDF score for a term across all documents.

@docs calculateTfidfForTerm

-}

import Basics exposing (logBase)

{-| 
    Calculate Term Frequency (TF) for a given term in a document.
    
    The term frequency is the number of times a term appears in a document 
    divided by the total number of terms in that document.
    
    ## Parameters
    - `term`: The term for which the frequency is to be calculated.
    - `document`: The list of terms (words) in the document.
    
    ## Returns
    A float representing the term frequency (TF) of the term in the document.
-}
tf : String -> List String -> Float
tf term document =
    let
        termCount = List.length (List.filter ((==) term) document)
        totalTerms = List.length document
    in
    if totalTerms == 0 then
        0
    else
        toFloat termCount / toFloat totalTerms

{-| 
    Calculate Inverse Document Frequency (IDF) for a given term across multiple documents.
    
    The inverse document frequency measures how important a term is by 
    determining how many documents contain the term.
    
    ## Parameters
    - `term`: The term for which the IDF is to be calculated.
    - `documents`: A list of documents, where each document is represented as a list of terms.
    
    ## Returns
    A float representing the inverse document frequency (IDF) of the term.
-}
idf : String -> List (List String) -> Float
idf term documents =
    let
        docCount = List.length documents
        containingDocs = List.filter (List.member term) documents
    in
    if List.isEmpty containingDocs then
        0
    else
        logBase 10 (toFloat docCount / toFloat (List.length containingDocs))

{-| 
    Calculate the TF-IDF score for a given term in a specific document 
    based on the set of documents.
    
    The TF-IDF score is a measure of how relevant a term is to a document 
    within a collection of documents.
    
    ## Parameters
    - `term`: The term for which the TF-IDF score is to be calculated.
    - `document`: The list of terms (words) in the document.
    - `documents`: A list of documents to compute the IDF.
    
    ## Returns
    A float representing the TF-IDF score of the term in the document.
-}
tfidf : String -> List String -> List (List String) -> Float
tfidf term document documents =
    let
        termTf = tf term document
        termIdf = idf term documents
    in
    termTf * termIdf

{-| 
    Calculate the TF-IDF score for a term across all documents.
    
    This function applies the TF-IDF calculation to each document in the 
    provided list of documents.
    
    ## Parameters
    - `term`: The term for which the TF-IDF scores are to be calculated.
    - `docs`: A list of documents, where each document is represented as a list of terms.
    
    ## Returns
    A list of floats representing the TF-IDF scores for the term in each document.
-}
calculateTfidfForTerm : String -> List (List String) -> List Float
calculateTfidfForTerm term docs =
    List.map (\doc -> tfidf term doc docs) docs