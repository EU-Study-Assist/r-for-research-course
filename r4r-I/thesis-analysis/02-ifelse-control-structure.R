
# ifelse ------------------------------------------------------------------

x <-20:50
y <-  55


ifelse(test = x %% 2 == 0, yes = "even", no = "odd")

ifelse(x %% 2 == 0, paste0(x, " :even"), paste0(x, " :odd"))

ifelse(y %% 2 == 0, "even", "odd")



# Exercise ----------------------------------------------------------------

# create a vector of with the following object:
# novel
# orange
# mango
# clementine
# textbook
# Using the ifelse statement categorize them into fruit or book.
# Secondly ensure they have their name printed with a message in front of them
# for example "textbook is a book"


# Solution ----------------------------------------------------------------

my_objects <- c("novel", "orange", "mango", "clementine", "textbook")

ifelse(my_objects == "novel" | my_objects == "textbook", "book", "fruit")

ifelse(
  test = my_objects == "novel" | my_objects == "textbook",
  yes = paste0(my_objects, " is a book"),
  no = paste0(my_objects, " is a fruit")
)