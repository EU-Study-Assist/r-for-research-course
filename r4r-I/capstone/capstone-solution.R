
# =========================================================================

# ZAMA FRUIT STORE CAPSTONE PROJECT
# Student Name: EU StudyAssist
# Course: R for Research I
# Submission Date: 23rd June 2025

# =========================================================================

# Task I: Creating a Master Fruit Inventory -------------------------------

## Create a variable containing all the fruits

fruits <- c("grapes", "peach", "strawberries", "apples", "banana", 
            "banana", "coconut", "apples", "mango", "orange", "pineapple",
            "plantain", "coconut", "banana", "watermelon", "mango",
            "pumpkin", "watermelon", "mango", "avocado", "plantain", 
            "coconut", "banana", "kiwi", "mango", "passion fruit",
            "pear", "coconut", "banana"
)



## how many types of fruits are imported by ZFS
length(unique(fruits))

## Create a frequency table of the fruits. 
fruit_frequency <- table(fruits)
fruit_frequency
## Which fruit(s) is/are imported from only one of the region?
names(fruit_frequency[fruit_frequency == 1])

## Which fruit(s) is/are imported from all the regions?
names(which.max(fruit_frequency))

## Which fruit has the highest number of characters (including spaces)?
fruits[which(nchar(fruits) == max(nchar(fruits)))] # passion fruit

## Which fruit has the lowest number of characters (including spaces)?

fruits[which(nchar(fruits) ==min(nchar(fruits)))] #kiwi and pear


# Task II: Country Specific Tasks -----------------------------------------

## Create separate vectors for each country's fruit exports to ZFS.

ukraine <- c("grapes", "peach", "strawberries", "apples", "banana")
nigeria <- c("banana", "coconut", "apples", "mango", "orange", "pineapple", "plantain")
vietnam <- c("coconut", "banana", "watermelon", "mango", "pumpkin")
guatemala <- c("watermelon", "mango", "avocado", "plantain", "coconut", "banana") 
brazil <- c("kiwi", "mango", "passion fruit", "Pear", "coconut", "banana")

## Is the number of distinct fruits imported from Ukraine greater than that of Brazil?
length(ukraine) > length(brazil)

## Is the number of fruits imported from Vietnam less than that of Nigeria?
length(vietnam) < length(nigeria)

## Is the number of fruits imported from Brazil equal to that imported from Guatemala?
length(brazil) == length(guatemala)

## From which countries is coconut exported? Print the countries.
coconut_countries <- c() # Create a empty vector to hold data of the country with coconut as its export

### Test for fruits
if ("coconut" %in% ukraine) {
  coconut_countries <- append(coconut_countries, "Ukraine")
}
if ("coconut" %in% nigeria) {
  coconut_countries <- append(coconut_countries, "Nigeria")
}
if ("coconut" %in% vietnam) {
  coconut_countries <- append(coconut_countries, "Vietnam")
}
if ("coconut" %in% guatemala) {
  coconut_countries <- append(coconut_countries, "Guatemala")
}
if ("coconut" %in% brazil) {
  coconut_countries <- append(coconut_countries, "Brazil")
}

cat("The countries ", paste(coconut_countries, collapse = " ,"))

# Which country has the highest number of fruit exports?
all_countries = list(
  ukr = ukraine, 
  nga = nigeria, 
  vtn = vietnam, 
  gua = guatemala, 
  bra = brazil
)

names(which.max(sapply(all_countries, length)))

# Which fruit(s) is/are common to all countries?
Reduce(intersect, all_countries)


# Task III:  Create Inventory Data Frame  --------------------------------

zfs_inv <- data.frame(
  origin = c(
    rep("Ukraine", length(ukraine)),
    rep("Nigeria", length(nigeria)),
    rep("Vietnam", length(vietnam)),
    rep("Guatemala", length(guatemala)),
    rep("Brazil", length(brazil))
  ),
  fruit = fruits
)

## To add cost you can use several methods

### Method I
zfs_inv$cost <- ifelse(
  zfs_inv$fruit == "grapes", 0.6, ifelse(
    zfs_inv$fruit == "peach", .4, ifelse(
      zfs_inv$fruit == "strawberries", 1.3, ifelse(
        zfs_inv$fruit == "apples", 2, ifelse(
          zfs_inv$fruit == "banana", 1.2, ifelse(
            zfs_inv$fruit == "coconut", 2.1, ifelse(
              zfs_inv$fruit == "mango", 2.4, ifelse(
                zfs_inv$fruit == "orange", 1.8, ifelse(
                  zfs_inv$fruit == "pineapple", 5, ifelse(
                    zfs_inv$fruit == "plantain", 1.7, ifelse(
                      zfs_inv$fruit == "pumpkin", 0.9, ifelse(
                        zfs_inv$fruit == "watermelon", 2.2, ifelse(
                          zfs_inv$fruit == "avocado", 4.2, ifelse(
                            zfs_inv$fruit == "kiwi", 3.1, 4.3
                          )
                        )
                      )
                    ) 
                  )
                )
              )
            )
          )
        )
      )
    )
  )
) # You can also use if and else combined with the for loops


zfs_inv[zfs_inv$fruit == "grapes", "cost"] = .6
zfs_inv[zfs_inv$fruit == "peach", "cost"] = .4
zfs_inv[zfs_inv$fruit == "strawberries", "cost"] = 1.3
zfs_inv[zfs_inv$fruit == "apples", "cost"] = 2
zfs_inv[zfs_inv$fruit == "banana", "cost"] = 1.2
zfs_inv[zfs_inv$fruit == "coconut", "cost"] = 2.1
zfs_inv[zfs_inv$fruit == "mango", "cost"] = 2.4
zfs_inv[zfs_inv$fruit == "orange", "cost"] = 1.8
zfs_inv[zfs_inv$fruit == "pineapple", "cost"] = 5
zfs_inv[zfs_inv$fruit == "plantain", "cost"] = 1.7
zfs_inv[zfs_inv$fruit == "pumpkin", "cost"] = 0.9
zfs_inv[zfs_inv$fruit == "watermelon", "cost"] = 2.2
zfs_inv[zfs_inv$fruit == "avocado", "cost"] = 4.2
zfs_inv[zfs_inv$fruit == "kiwi", "cost"] = 3.1
zfs_inv[zfs_inv$fruit == "pear", "cost"] = 4.3


### alternatively to prevent continuous copy and paste, you can create a simple function for this
set_fruit_cost <- function(fruit_name, fruit_cost) {
  # Check inputs
  if (!is.character(fruit_name) || length(fruit_name) != 1) {
    stop("`fruit_name` must be a single character string.")
  }
  if (!is.numeric(fruit_cost) || length(fruit_cost) != 1) {
    stop("`fruit_cost` must be a single numeric value.")
  }
  
  # Next, it is necessary to check if the fruit exists in the data frame
  if (!fruit_name %in% zfs_inv$fruit) {
    stop(paste("Fruit", fruit_name, "not found in inventory."))
  }
  
  # Update cost
  zfs_inv[zfs_inv$fruit == fruit_name, "cost"] <<- fruit_cost
  
  # Optionally return updated data frame invisibly
  invisible(zfs_inv)
}

### Try with this
set_fruit_cost("grapes", .5)

fruits_cost <- data.frame(
  fruit = c(
    "grapes", "peach", "strawberries", "apples", "banana", "coconut", "mango",
    "orange", "pineapple", "plantain", "pumpkin", "watermelon", "avocado", 
    "kiwi", "pear"
  ),
  cost = c(
    0.6, 0.4, 1.3, 2.0, 1.2, 2.1, 2.4, 1.8, 5.0, 1.7, 0.9, 2.2, 4.2, 3.1, 4.3)
)

for (j in 1:nrow(fruits_cost)){  
    set_fruit_cost(
      fruit_name = fruits_cost$fruit[j],
      fruit_cost = fruits_cost$cost[j]
    )
}

### Print the first 6 rows
head(zfs_inv)

### Print the last 6 rows
tail(zfs_inv)


# Task IV: Create the Quantity Column -------------------------------------

zfs_inv$quantity <- ifelse(
  zfs_inv$origin == "Ukraine",  150, ifelse(
    zfs_inv$origin == "Nigeria", 318, ifelse(
      zfs_inv$origin == "Vietnam", 347, ifelse(
        zfs_inv$origin == "Guatemala", 197, 237
      )
    ) 
  )
)

## Calculate Price

zfs_inv$price <- zfs_inv$cost + (.5 * zfs_inv$cost)

## Calculate total revenue for each fruit for each country

zfs_inv$total_revenue <- zfs_inv$price * zfs_inv$quantity

## Total revenue for ZFS store
sum(zfs_inv$total_revenue)

## Total cost of product

zfs_inv$total_cost <- zfs_inv$cost * zfs_inv$quantity
sum(zfs_inv$total_cost)

























