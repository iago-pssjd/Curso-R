# intro.r


# código de R que no hace nada

x <- 4 # aisgnamos a la variable x el número 4
class(x)
is.character(4)
as.character(4) # un objeto numérico se puede coercionar a un carácter
as.numeric("a") # al revés, no
as.numeric(FALSE) # un objeto lógico se puede coercionar a uno numérico
as.numeric(TRUE)

y <- c(2:4)
y
class(y)
length(y)

getwd()
# setwd("C:/...")
list.files()

2+3
x+5
y <- x-3*7 + 24 # los espacios aquí no afectan
y

library(haven)
dta_data <- read_dta("carsdata.dta") # con un archivo de stata 10
dta_data
str(dta_data)

# file from https://digitalcommons.usu.edu/all_datasets/27/
foreign::read.dta("Jakus_NCDA.dta") # archivo de stata 15
dta_data2 <- read_dta("Jakus_NCDA.dta")
str(dta_data2)
write_dta(dta_data2, "Jakus_NCDA2.dta", version = 13)
