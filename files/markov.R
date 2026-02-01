text <- paste(
  "this is a small example text.",
  "it does not need to be large.",
  "markov models learn transitions.",
  sep = " "
)
t1<-readLines("~/Documents/GitHub/R-essais/data/corpus/benjamin/guhl_benjaminbuch1.txt")

text <- tolower(text)
text <- tolower(t1)
chars <- unlist(strsplit(text, ""))
k <- 6   # trigram character model
states <- c()
next_chars <- c()

for (i in 1:(length(chars) - k)) {
  states[i] <- paste(chars[i:(i + k - 1)], collapse = "")
  next_chars[i] <- chars[i + k]
}

transitions <- data.frame(
  state = states,
  nxt = next_chars,
  stringsAsFactors = FALSE
)
counts <- table(transitions$state, transitions$nxt)
counts
probs <- prop.table(counts, margin = 1)
probs
generate_text <- function(
    probs,
    start,
    n = 500
) {
  state <- start
  output <- state
  
  for (i in 1:n) {
    if (!state %in% rownames(probs)) break
    
    next_char <- sample(
      colnames(probs),
      size = 1,
      prob = probs[state, ]
    )
    
    output <- paste0(output, next_char)
    state <- substring(output, nchar(output) - nchar(state) + 2)
  }
  
  output
}
set.seed(42)

start_state <- sample(rownames(probs), 1)
for(k in 1:100){
  start_state <- sample(rownames(probs), 1)
  text_generated <- generate_text(probs, start_state, n = 300)

cat(text_generated)
}
sample(letters,6)
