% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lorem-provider.R
\docType{data}
\name{LoremProvider}
\alias{LoremProvider}
\alias{lorem_provider_locales}
\title{LoremProvider}
\format{An object of class \code{character} of length 9.}
\usage{
lorem_provider_locales
}
\arguments{
\item{locale}{(character) the locale to use. See
\code{lorem_provider_locales} for locales supported (default: en_US)}

\item{sentence_punctuation}{(character) End of sentence punctuation}

\item{word_connector}{(character) Default connector between words}
}
\description{
LoremProvider
}
\details{
\strong{Methods}
\itemize{
\item \code{word(ext_words = NULL)} - Generate a random word
\itemize{
\item ext_words: a character vector of words you would like to have
instead of 'Lorem ipsum'
\item returns: a random word
}
\item \code{words(nb = 3, ext_words = NULL)} - Generate a character vector of random words
\itemize{
\item nb: how many words to return
\item ext_words: a character vector of words you would like to have
instead of 'Lorem ipsum'
\item returns: many words
}
\item \code{sentence(nb_words, variable_nb_words, ext_words)} - Generate a random sentence
\itemize{
\item nb_words around how many words the sentence should contain
\item variable_nb_words set to false if you want exactly \code{nb}
words returned, otherwise the result may include a number of words
of \code{nb} +/-40% (with a minimum of 1)
\item ext_words a character vector of words you would like to have instead of
'Lorem ipsum'.
\item returns: a single sentence
}
\item \code{sentences(nb, ext_words)} - Generate a character vector of random sentences
\itemize{
\item nb: how many sentences to return
\item ext_words: a character vector of words you would like to have
instead of 'Lorem ipsum'.
\item returns: many sentences
}
\item \code{paragraph(nb_sentences, variable_nb_sentenc} -  ext_words)` - Generate a
single paragraph
\itemize{
\item nb_sentences: around how many sentences the paragraph should
contain
\item variable_nb_sentences: set to false if you want exactly \code{nb}
sentences returned, otherwise the result may include a number of
sentences of \code{nb} +/-40% (with a minimum of 1)
\item ext_words: a character vector of words you would like to have instead
of 'Lorem ipsum'
\item returns: a single paragraph
}
\item \code{paragraphs(nb, ext_words)} - Generate many paragraphs
\itemize{
\item nb: how many paragraphs to return
\item ext_words: a character vector of words you would like to have instead of
'Lorem ipsum'.
\item returns: many paragraphs
}
\item \code{text(max_nb_chars, ext_words)} - Generate a random text string. Depending on
the \code{max_nb_chars}, returns a string made of words, sentences, or paragraphs.
\itemize{
\item max_nb_chars: Maximum number of characters the text should contain
(minimum 5)
\item ext_words: a character vector of words you would like to have instead of
'Lorem ipsum'.
\item returns: character string of words
}
}
}
\examples{
(x <- LoremProvider$new())
x$locale
x$word()
x$words(3)
x$words(6)
x$sentence()
x$sentences(3)
x$sentences(6)
x$paragraph()
x$paragraphs(3)
x$paragraphs(6)
cat(x$paragraphs(6), sep = "\\n")
x$text(10)
x$text(25)
x$text(50)
x$text(300)
x$text(2000)

# set a different sentence_punctuation or word_connector
(x <- LoremProvider$new(sentence_punctuation = ";"))
x$paragraph(4)
(x <- LoremProvider$new(word_connector = " --- "))
x$paragraph(4)

# different locales
LoremProvider$new(locale = "ar_AA")$word()
LoremProvider$new(locale = "el_GR")$word()
LoremProvider$new(locale = "he_IL")$word()
LoremProvider$new(locale = "ja_JP")$word()
LoremProvider$new(locale = "zh_TW")$word()
}
\keyword{datasets}
\keyword{internal}
