#create a vector

mere <- c("rosii", "verzi", "galbene", "golden")
print(mere)

#Clasa din carre face parte vectorul
print(class(mere))

# Crearea uni liste
list1 <- list(c(2,3,4), 32.18, sin)
print(list1)

#create matrice'
M <- matrix(c('a','a','b','c','b', 'a'), nrow=2, ncol=3,byrow=TRUE)
print(M)

#create array
a <- array(c('verde', 'galben'), dim=c(3,3,2))
print(a)

#create a vector
apple_colors <- c('verde', 'verde', 'galben', 'rosu', 'rosu','rosu', 'verde')
factor_apple <- factor(apple_colors)
print(factor_apple)
print(nlevels(factor_apple))

#create dataframe
BMI <- data.frame(
  gender = c("male", "male", "Female"),
  height = c(152, 171.5, 234),
  weight = c(81, 97, 78),
  age = c(43, 45, 67)
)
print(BMI)


