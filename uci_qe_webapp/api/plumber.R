library(plumber)
source("../Rpkg/R/choose_corr.R", local = TRUE)
# add any other helper sources as needed

#* @apiTitle UCI QE Prep API

#* Run arbitrary R code and return console output
#* @post /runCode
function(req, res){
  token <- req$HTTP_AUTHORIZATION
  if(is.null(token) || token != Sys.getenv("API_TOKEN")){
    res$status <- 401
    return(list(error="Unauthorized"))
  }
  code <- req$postBody
  if(is.raw(code)) code <- rawToChar(code)
  tmp <- tempfile(fileext = ".R")
  writeLines(code, tmp)
  out <- capture.output(source(tmp, echo = TRUE, max.deparse.length = 200))
  list(console = paste(out, collapse = "\n"))
}

#* Example flashcard endpoint
#* @get /flashcard
function(){
  list(question = "What does a GEE marginal coefficient represent?",
       answer   = "Population-average effect across subjects.")
}

