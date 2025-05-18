
# Atomic Vectors ----------------------------------------------------------

my_favorite_fish <- "Mackerel"

fish_type <- c("mackerel", "catfish", "tilapia", "cod", "salmon")

my_mackerel_weight <- 500

# Vector Operations -------------------------------------------------------

my_mackerel_weight + 3000

toupper(fish_type)

fish_detail <- c("mackerel", 500, TRUE)

class(fish_detail)


fish_detail_2 <- c(500, TRUE)

class(fish_detail_2)

# Accessing Vector Elements -----------------------------------------------

fish_type[3]
toupper(fish_type[3])

fish_type[2]

laptop_brands <- c("hp", "dell", "msi", "acer", "lenovo", "chromebook",
                   "microsoft", "asus", "samsung", "fijitsu", "gigabyte",
                   "apple")


laptop_brands[8]

which(laptop_brands == "asus")
laptop_brands[8]


laptop_brands[c(1, 3, 5, 8, 12, 9)]


# Modifying Vectors -------------------------------------------------------

# Adding Elements ---------------------------------------------------------
fish_type[6] <- "herring"

fish_type[length(fish_type) + 1] <- "boarfish"


append(fish_type, c("eel", "firefish", "dogfish"), after = 2)

append(fish_type, "eel")

fish_type[14] <- "eel"


# Altering / Changing Elements --------------------------------------------


fish_type


fish_type[8] <- "pike"
fish_type[c(9, 10)] <- c("aye", "haddock")



# bluegill, puffer, bass
fish_type[11:13] <- c("bluegill", "puffer", "bass")

fish_type[which(fish_type =="cod")] <- "carp"
fish_type

# Removing Elements -------------------------------------------------------


fish_type[-12]

fish_type[-c(12, 11, 13, 14, 10)]



# Matrices ----------------------------------------------------------------

my_num <- 1:12

my_matrix <- matrix(data = my_num, nrow = 3, ncol = 4, byrow = TRUE)


dim(my_matrix)
my_matrix[2, 3]

my_matrix[3, 4]
my_matrix[ ,2]
my_matrix[2, ]



# Short exercise ----------------------------------------------------------

# 1. Create a sequence of number from 1 to 20
# 2. Create a matrix from this sequence of number of dimension 5 rows 4 colummns
# 3. Access the number 10, 11, and 15 from the created matrix
# 4. Return whatever value is present in row 3 and column 4 of the matrix
# 5. Lastly, return the value of all the elements in row 5

my_seq <- 1:20

my_seq_mat <- matrix(my_seq, nrow = 5)

my_seq_mat[5, 2] # 10
my_seq_mat[1, 3] # 11
my_seq_mat[5, 3] # 15

my_seq_mat[3, 4] # 18

my_seq_mat[5, ]


# Basic Matrix Operations -------------------------------------------------

my_matrix + 10
my_matrix - 10 


dim(my_matrix)


set.seed(123)
my_rand_num <- round(rnorm(12, 10, 1), 0)
my_rand_num

my_rand_matrix <- matrix(my_rand_num, nrow = 3)
dim(my_rand_matrix)


my_matrix + my_rand_matrix
round(my_rand_matrix / my_matrix, 2)


dim(my_seq_mat)

my_seq_mat + my_matrix

my_vec <- c(3, 6, 7)

my_seq_mat + my_vec

my_vec_2 <- 1:5


colnames(my_seq_mat) <- LETTERS[1:4]
rownames(my_seq_mat) <- letters[1:5]

colnames(my_seq_mat)  <- c("Michael", "Dennis", "Funke", "Foluke")


class_score <- my_seq_mat 


# Transpose ---------------------------------------------------------------


class_score_transposed <- t(class_score)
colnames(class_score_transposed) <- c("Maths", "English", "Art", "Science", "Economics")
class_score_transposed


colMeans(class_score_transposed)
rowMeans(class_score_transposed)


# Short Exercise II -------------------------------------------------------


# 1. Set seed to 123
# 2. Create a vector of score of nine elements of random numbers with mean 70 and standard deviation 20, assign this to the variable "scores"
# 3. Create a 3 * 3 matrix arranged by rows with variable name student_score
# 4. Change the column names to "Test 1", "Test 2", and "Test 3"
# 5. Assign the names "Hammed", "Clara", "Hlombe" to the students
# 6. Find the average student score. Which student performed the best?
# 7. Find the average test score. In which of the tests did the student perform their best?

set.seed(123)

scores <- rnorm(9,  mean = 70, sd = 20)
student_score <- matrix(scores, nrow = 3, byrow = TRUE)
colnames(student_score) <- c("Test 1", "Test 2", "Test 3")
rownames(student_score) <- c("Hammed", "Clara", "Hlombe")

rowMeans(student_score) # Clara
colMeans(student_score) # Test 3



# Adding more rows and columns to a Matrix --------------------------------


my_seq_mat

my_mat_2 <- matrix(1:4, ncol = 4)

rbind(my_seq_mat, my_mat_2)

my_mat_3 <- matrix(1:5, nrow = 5, dimnames = )

my_mat_3
cbind(my_seq_mat, my_mat_3)



# Data.Frames -------------------------------------------------------------

x <- 1:10
y <- letters[1:10]

my_mat <- matrix(c(x), nrow = 5)

dt <- data.frame(
  col_x = x,
  col_y = y
)

colnames(dt)
rownames(dt)

?str()

str(dt)

my_mat * 2

dt[2, 2]
dt[, 2]
is.vector(dt[, 1] * 10)
is.data.frame( dt[, 1] * 10 )


dt[1, 1] * 2
dt[1, 1] <- dt[1, 1] * 2

dt[, 1] <- dt[, 1] * 10

dt


dt[, 2] <- toupper(dt[, 2] )
dt

dt$col_x
dt$col_y

dt$col_z <- dt$col_x / 15

dt


# Exercise ----------------------------------------------------------------

# Round up the value of col_z in the dt object to 2 decimal places, do this using the
# dollar sign. Ensure you reassign the result to a new column col_w.


dt$col_w <- round(dt$col_z, 2)

dt


# Lists -------------------------------------------------------------------

x <- 1:10
y <- LETTERS[1:10]
my_mat <- matrix(x, nrow = 5)
dt <- data.frame(
  col_x = x,
  col_y = y
)

my_list <- list(x, y, my_mat, dt, "my_obj", typeof)


odd_list <- list(my_list, list(mean(x), tolower(y), my_mat * 2, my_list[1]))
odd_list



# Naming in List ----------------------------------------------------------
str(my_list)
names(my_list) <- c("x", "y", "my_mat", "dt", "my_obj", "typeof")

str(dt)

# Accessing List Values ---------------------------------------------------

my_list$dt
my_list$typeof


my_list["dt"]
my_list[3]
length(my_list)


length(odd_list)
odd_list

odd_list[[1]][[2]]



# Exercise ----------------------------------------------------------------

# Access the lower case letters in odd_list and the object with my_mat * 2
# What would odd_list[[1]][[1]][[1]] return?

length(odd_list)

odd_list[[2]][[2]]
odd_list[[2]][[3]]


odd_list[[1]][[1]][[3]]


# Converting Data Structures ------------------------------------------

x <- 1:10
y <- LETTERS[1:10]
my_mat <- matrix(x, nrow = 5)
dt <- data.frame(
  col_x = x,
  col_y = y
)

my_list <- list(x, y, my_mat, dt, "my_obj")


my_mat

my_mat_vec <- as.vector(my_mat)
is.vector(my_mat_vec)

as.data.frame(my_mat)

unlist(as.vector(dt))

as.vector(dt$col_x)

dt$col_x

is.vector(unlist(dt, use.names = FALSE))

as.data.frame(y)

names(as.data.frame(my_list))

as.list(dt)














