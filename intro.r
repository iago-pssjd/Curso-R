# intro.r



# línea de código de R que no hace nada

nombre <- "Luis"
nombre # para ver el contenido de un objeto, basta escribir su nombre
varon <- TRUE
edad <- 23; edad # se pueden introducir diferentes instrucciones en una misma línea separadas por ; (indiferentemente de los espacios en blanco en medio)
estatura <- 1.77

### Vectores

nombre <- c("Luis","Maria")
edad <- c(23,24)
varon <- c(TRUE,FALSE)
estatura <- c(1.77, 1.64) # entre los objetos y las comas puede haber espacios

length(edad)
estatura[2]

### Factores

f <- as.factor(c(1,2,3,1,2,1,1,3,2)) #Factor Nominal
f
levels(f) <- c("Bajo","Medio","Alto")
ford <- as.ordered(f) #Factor Ordinal
ford

### Matrices

ejema <- matrix(c(1,2,3,4,5,6,7,8,9,10,11,12), ncol=3, byrow=TRUE)
ejema

dim(ejema)

ejema[1,1]

### Listas

ejemplolista <- list(nombre="Pedro", casado=T, esposa="Maria", no.hijos=3, edad.hijos=c(4,7,9))
ejemplolista

ejemplolista[[5]]

ejemplolista[[5]][2]


### Data frames

BD <- data.frame(nombre = c("Luis","Maria","Jesus"), edad = c(23,24,50), varon = c(TRUE,FALSE, TRUE), estatura = c(1.77,1.64,1.50))
BD

dim(BD)
names(BD)
names(BD)[4] <- "altura"
names(BD)

BD$nombre

BD[1,2]
BD[1,]
BD[,2]


ls() 
rm(f, ford) # para eliminar objetos del entorno
ls()

## Funciones básicas

class(ejema)
class(BD) 
class(ejemplolista)


attributes(ejema) 
attributes(BD) 
attr(BD, "class")
attributes(ejemplolista) 


str(ejema)
str(BD)
str(ejemplolista)


length(ejema)
length(BD)
length(ejemplolista)


is.character(4) # podemos comprobar si un objeto es de una determinada clase
is.character(BD$nombre)

as.character(4) # un objeto numérico se puede coercionar a un carácter

as.numeric("a") # al revés, no

as.numeric(FALSE) # un objeto lógico se puede coercionar a uno numérico
as.numeric(TRUE)

strDates <- c("01/05/1965", "08/16/1975")
dates <- as.Date(strDates, "%m/%d/%Y") # damos formato de fecha a objetos de clase carácter

strDates2 <- c("01-05-1965", "08-16-1975")
dates <- as.Date(strDates2, "%m-%d-%Y") # damos formato de fecha a objetos de clase carácter


is.na(BD$edad) # podemos ver si un objeto tiene valores missing


# Enteros consecutivos
1:10

# Generar secuencias de números
seq(from = 0, to = 1, by = 0.1)
seq(from = 5, to = 20, by = 2)
seq(0,10,2)

# Repetir secuencias
rep(x = 1, times = 5)
rep(x = c(1,3,5), times = 2)
rep(c(1,3,5), each = 5)


x <- 4

paste("a", x)
paste("a", x, sep = "_")

paste0("a", x, "b", 3)
paste0("x", c(1:10))
paste0(c("a","b"), c(1,2))
names(BD) <- paste0(names(BD),"_BD")
names(BD)
names(BD) <- c("nombre","edad","varon","estatura")
names(BD)


x <- "R"

if(x==5){
  x <- x+2
} else if (x=="R"){
  cat("El programa se llama",x)
} else{
  cat("Qué es ",x,"?", sep = "")
}

for(i in 1:10){
  print(2*i)
}

x <- c(20:5)

while (length(x) > 5) {
  print(x)
  x <- x[-1]
}


xlist <- list(a = 1:10, logic = c(TRUE,FALSE,FALSE,TRUE), b = c(1,0,0,1)); xlist

lapply(xlist, quantile, probs = 1:3/4)
sapply(xlist, quantile, probs = 1:3/4)

x <- cbind(x1 = 3, x2 = c(4:1, 2:5)) # columnas enlazadas
x; dimnames(x)
dimnames(x)[[1]] <- letters[1:8]; x

apply(x, 2, sum)
apply(x, 1, sum)
mapply(paste, 1:4, 4:1)


x <- 4       # asignamos el nombre x al objeto 4
w <- "x"     # guardamos el nombre x en la variable w
x
w
get(w)       # con la función get recuperamos el objeto asignado al nombre (x) guardado en la variable w
assign(w,5)  # asignamos el valor 5 al caracter guardado en w (x)
get(w)

## Directorio

getwd() # el directorio donde R está trabajando
# setwd("C:/...") # para cambiarlo


list.files() 


save(x, ejema, file = "example.rda")
rm(x, ejema)

test_table <- table(BD$edad,BD$varon)

sink("output.log") # se crea el fichero donde se quieren guardar los resultados
# si el fichero ya existe con resultados anteriores que no se quieren borrar, se tiene que poner sink("output.log", append = TRUE)
test_table
cor.test(BD$edad,BD$estatura)
sink()


load(file = "example.rda") # carga los objetos guardados con el mismo nombre con el que fueron guardados; sobreescribe los objetos cargados con el mismo nombre

## Ayuda de R

help(print)
?cat
?as.POSIXct

## Librerías

install.packages("magrittr") # para instalar librerías
library(magrittr) # para cargar librerías
(.packages()) # para ver qué librerías tenemos cargadas en este momento


# cargamos la librería
library(car)

BD$nombre 
recode(BD$nombre, "'Maria' = 'Nuria'")

# Para guardar este cambio en nuestra base de datos:
BD$nombre <- recode(BD$nombre, "'Maria' = 'Nuria'")

# También funciona con variables numéricas
BD$edad
recode(BD$edad, "50 = 45; 24 = 30")

# se pueden recodificar múltiples valores a uno simultáneamente
recode(c(1:10), "seq(0,10,2) = 0; seq(1,11,2) = 1")

## Operadores aritméticos y lógicos

x <- 4
2+3
x+5
y <- x-3*7 + 24/2 # los espacios aquí no afectan

y
y^x # potencia

y %% x # residuo

# floor()
# log(), log10(), log2()
# exp()
# sqrt()
# factorial()
round(21.53667674,3)

3 == 4
3 == 3
3 != 5
3 != 3
3 < 3
3 <= 3
3 %in% c(1:5)
!3 %in% c(1:5)
3 %in% c(5:50)
!3 %in% c(5:50)

TRUE & TRUE
TRUE & FALSE
FALSE | FALSE
FALSE | TRUE

nchar(paste(x, 4)) == 3 # el número de caracteres de la cadena "x 4" es 3

length(c(1:3,7,10)) > 6

x <- c(1,3,5,7, NA, 8,5, NA)
sum(is.na(x))

# Funciones y librerías para interaccionar con otros softwares estadísticos como SPSS o STATA

?read.csv
md_data <- read.csv("MissingData.csv")
str(md_data)
View(md_data)
md_data$Response <- car::recode(md_data$Response,"'Not Available' = NA")
str(md_data)
md_data$Response <- as.numeric(as.character(md_data$Response))
str(md_data)


# Para guardar una matriz o data frame en un fichero csv podemos usar write.csv
write.csv(test_table, file = "foo.csv")


library(readxl)
df <- read_excel("example_sheets2.xlsx")
head(df)
str(df)
df <- as.data.frame(df)

library(openxlsx)
df <- read.xlsx("readTest.xlsx",sheet = 1, skipEmptyRows = FALSE); df
df <- read.xlsx("readTest.xlsx",sheet = 3, skipEmptyRows = TRUE); str(df)
df$Date <- convertToDate(df$Date)
str(df)
df2 <- read.xlsx("readTest.xlsx", sheet = 3, skipEmptyRows = TRUE, detectDates = TRUE)
str(df2)

wb <- loadWorkbook("readTest.xlsx") # útil para trabajar con un fichero de excel y escribir en él junto a funciones como writeData y saveWorkbook
df3 <- read.xlsx(wb, sheet = 2, skipEmptyRows = FALSE, colNames = TRUE)
str(df3)
df4 <- read.xlsx("readTest.xlsx", sheet = 2, skipEmptyRows = FALSE, colNames = TRUE)
identical(df3,df4)


library(haven)
dta_data <- read_dta("carsdata.dta") # con un archivo de stata 10
dta_data
str(dta_data)

# file from https://digitalcommons.usu.edu/all_datasets/27/
dta_data2 <- foreign::read.dta("Jakus_NCDA.dta") # con un archivo de stata 15
dta_data2 <- read_dta("Jakus_NCDA.dta")
str(dta_data2)
write_dta(dta_data2, "Jakus_NCDA2.dta", version = 12)
dta_data2 <- foreign::read.dta("Jakus_NCDA2.dta")

dta_data3 <- read_dta("gss_sample.dta")
dim(dta_data3)
table(is.na(dta_data3$prestg10)) # cuántos valores missing hay?
table(na_tag(dta_data3$prestg10), useNA = "ifany") # cuántos hay de cada categoría?

# Se pueden guardar datos en un fichero dta con la función write_dta
?write_dta


sav_data <- read_sav("survey.sav")
dim(sav_data)
str(sav_data[,1:10])

# Se pueden guardar datos en un fichero sav con la función write_sav
?write_sav


sas_data <- read_sas(data_file = "nyts2017.sas7bdat", catalog_file = "formats.sas7bcat")
head(sas_data[, 1:5])
names(sas_data)

sapply(sas_data,class)
sapply(sas_data,mode)

# Se pueden guardar datos en un fichero sav con la función write_sas
?write_sas


library(oro.nifti)
library(neurobase)
t1 = readnii("Template-T1-U8-RALPFH-BR.nii.gz")
# t1 = readnii("Template-T2-U8-RALPFH-BR.nii.gz")
class(t1)
dim(t1)
t1
image(t1, z = 225, plot.type = "single")
# image(t1) # tarda algo de tiempo en ejecutarse
orthographic(t1)
ortho2(t1)

# Manejo de datos con las librerías dplyr & tidyr 

head(names(sav_data))

sav_data %>% # la pipa más habitual: envía los datos de la izquierda a la función que sigue (a la derecha o abajo) y retorna su evaluación
  names() %>% # está incluida en la librería dplyr
  head()

sav_data %T>% # como la anterior, pero retorna de nuevo los datos de la izquierda
  View() %>% # sirve para usar los datos en más de una función, cuando las intermedias no retornan nada, como View, plot, ...
  names() %>%
  head()

sav_data %$% # para funciones sin un argumento para data.frame's
  cor.test(age,educ)

sas_data %$%
  table(Q2, Q3)


library(dplyr)

band_members
band_instruments
band_instruments2

band_members %>% inner_join(band_instruments)
band_members %>% inner_join(band_instruments, by = "name")
band_members %>% left_join(band_instruments)
band_members %>% right_join(band_instruments)
band_members %>% full_join(band_instruments)
band_members %>% full_join(band_instruments2, by = c("name" = "artist"))
?join


BD <- data.frame(nombre = c("Luis","Maria","Jesus"), edad = c(23,24,50), varon = c(TRUE,FALSE, TRUE), estatura = c(1.77,1.64,1.50))

BD2 <- data.frame(nombre = c("Julian", "Laura", "Cristina"), varon = c(TRUE,TRUE, FALSE), edad = c(20, 65, 41),estatura = c(1.6, 1.75, 1.72), peso = c(71,67,65))

bind_rows(BD, BD2)

mtcars %>%
  str()

one <- mtcars[1:4, ]; one
two <- mtcars[11:14, ]; two
bind_cols(one, two)

## Selección y filtro de variables 

mtcars %>%
  select(drat:qsec)

mtcars %>%
  select(-drat:-qsec)

mtcars %>%
  select(-c(2,8:9))

iris %>%
  str()

select(iris, starts_with("Petal"))

iris %>% select(ends_with("Width")) %>% head()

iris %>% 
  select(-contains("Length")) %>%
  head()

iris %>%
  pull(Species) %>% # pull extrae una variable del data frame como vector
  table()

iris %>%
  pull(Species) %>%
  class()

iris %>%
  filter(Species == "setosa") # el outpup de filter es el subdata.frame cumpliendo la condición dada

# ordenar observaciones por una o más variables
iris %>% arrange(Sepal.Length)
iris %>% arrange(Sepal.Length, Petal.Length)

# filtrar casos únicos
dta_data
dta_data %>% distinct(cars)
dta_data %>% distinct(cars, .keep_all = TRUE)
dta_data %>% distinct(cars, hhsize)

## Transformación de variables 

iris %>% 
  mutate(
    SL2 = Sepal.Length * 2,
    SL44 = SL2 * 2
  ) %>%
  head()

iris %>%
  mutate(PW05 = Petal.Width / 2) %>%
  head()
iris %>%
  transmute(PW05 = Petal.Width / 2) %>%
  head()


?mutate_all

sas_data %>%
  select(Q1:Q4C) %>%
  mutate_all(zap_empty) %>% # transforma todas las celdas "" en NA's
  mutate(QAN = paste(Q1,Q3)) %>%
  head()

iris %>% head()
iris %>% 
  mutate_at(vars(matches("Sepal")), log) %>%
  head()

x <- 1:50
case_when(
  x %% 35 == 0 ~ "fizz buzz",
  x %% 5 == 0 ~ "fizz",
  x %% 7 == 0 ~ "buzz",
  TRUE ~ as.character(x)
)

iris %>%
  mutate(size = case_when(
    Sepal.Length < 5.0 ~ "small",
    TRUE ~ "big"
  )) %>% # case_when permite multiples outputs según las condiciones sin tener que recurrir a múltiples if-else y, a diferencia de una función de recode, permite condiciones complejas
  head()


mtcars
mtcars %>%
  group_by(cyl) %>%
  summarise(disp = mean(disp),
            hp = mean(hp),
            n = n(),
            distinct_gear = n_distinct(gear)) # medias por grupo, casos en cada grupo y observaciones diferentes en cada grupo

md_data %>%
  group_by(Age) %>%
  summarise(rmaxR = max(Response), 
            maxR = max(Response, na.rm = TRUE), 
            fR = sum(Response, na.rm = TRUE)) # sumario por grupo

md_data %>%
  group_by(Age) %>%
  mutate(rmaxR = max(Response), maxR = max(Response, na.rm = TRUE), fR = sum(Response, na.rm = TRUE)) %>%
  ungroup() %>%
  View() #estadísticos por grupo añadidos al data frame original


library(tidyr)

dta_data
dta_data %>% 
  group_by(cars) %>% 
  mutate(wave=dplyr::row_number())

dta_data %>% 
  group_by(cars) %>% 
  mutate(wave=dplyr::row_number())

dta_data %>% 
  group_by(cars) %>% 
  mutate(wave=dplyr::row_number()) %>%  # si no tenemos una variable que indique la ola y suponemos que los datos empiezan desde la primera hasta que se acaban, la creamos
  # ungroup() %>% 
  pivot_wider(names_from = wave, values_from = "hhsize", names_prefix = "hhsize_wave")


data("anscombe")
anscombe
anscombe %>%
  tibble::rownames_to_column('id')
# 1) pasar de forma ancha a larga las x's

anscombe %>%
  pivot_longer(cols = c(starts_with("x")),
               names_to = "x_cases",
               values_to = "x") %T>%
  View() %>%
  str()

# 1.1) además, renombrar la columna resultante

anscombe %>%
  pivot_longer(cols = c(starts_with("x")),
               names_to = "x_cases",
               names_prefix = "x",
               values_to = "x") %T>%
  View() %>%
  str()

# 2) pasar de forma ancha a larga las x's y las y's

anscombe2 <- anscombe %>%
  tibble::rownames_to_column('id') %>%
  pivot_longer(cols = c(starts_with("x"),starts_with("y")),
               names_to = c(".value", "id_cases"),
               names_pattern = "([a-z]+)([0-9]+)")
anscombe2 %T>%
  View() %>%
  str()

anscombe2

?pivot_wider

anscombe2 %>%
  pivot_wider(names_from = "id_cases", values_from = c("x","y"), names_sep = "")

anscombe3 <- anscombe2 %>%
  pivot_wider(names_from = "id_cases", values_from = c("x","y"), names_sep = "") %>%
  select(x1:y4) %>%
  as.data.frame()

identical(anscombe,anscombe3)


# solucion 1

anscombe %>%
  tibble::rownames_to_column('id') %>% # asignamos un número a cada individuo
  pivot_longer(cols = c(starts_with("x"),starts_with("y")),
               names_to = c(".value", "id_cases"),
               names_pattern = "([a-z]+)([0-9]+)") %>% # pivotamos creando dos columnas con las observaciones respectivas de x e y
  group_by(id) %>% # agrupamos por individuo
  mutate(his_y = sum(y < x & y >= x[id_cases == 4])) %>% # calculamos cuántas observaciones cumplen la condición por grupo (individuo)
  ungroup() %>%
  pivot_wider(names_from = "id_cases", values_from = c("x","y"), names_sep = "") %>%  # se transforma al formato original
  as.data.frame()

# solución 2

library(purrr)
?map_dfc

# map_dfc crea un data.frame de 4 columnas (1:4) y tantas filas como el original, anscombe
# el valor en la columna i es TRUE o FALSE según se cumple o no la condición yi < xi & yi >= x4
# con rowSums, sumamos para cada fila del data frame creado cuántas veces se cumple la condición

anscombe %>%
  mutate(hist_y = rowSums(map_dfc(
    1:4,
    ~ get(paste0("y",.)) < get(paste0("x",.)) & get(paste0("y",.)) >= x4
  ), na.rm = T)) 

?sample # tanto la función de R sample como las funciones de dplyr sample_n y sample_frac son interesantes


iris %>%
  group_by(Species) %>%
  sample_n(3) # escogemos 3 observaciones al azar para cada especie


# Estadísticos descriptivos 

head(iris)
?iris

library(dplyr)
?starwars
starwars %>%
  names()
starwars %>%
  View()


mean(iris$Sepal.Length) # Media
sd(iris$Sepal.Length) # Desviación típica
var(iris$Sepal.Length) # Varianza
median(iris$Sepal.Length) # Mediana
min(iris$Sepal.Length) # Mínimo
max(iris$Sepal.Length) # Máximo
range(iris$Sepal.Length) # Rango
quantile(iris$Sepal.Length, probs = c(0.025, 0.975)) # Cuartiles


summary(iris$Sepal.Length) 
summary(iris)


table(iris$Species)
prop.table(table(iris$Species))


mean(starwars$height) 
sd(starwars$height)

dim(starwars)
table(starwars$gender)


mean(starwars$height, na.rm = TRUE) 
sd(starwars$height, na.rm = TRUE) 

table(starwars$gender, useNA = 'always')
table(starwars$gender, useNA = 'ifany')


table(starwars$hair_color, starwars$eye_color)

# Gráficos con la librería ggplot2
### Gráfico de puntos

library(ggplot2)

SW <- starwars %>% 
  select(height:species) %>% 
  mutate(hair_color = as.factor(hair_color), 
         skin_color = as.factor(skin_color), 
         eye_color = as.factor(eye_color), 
         gender = as.factor(gender), 
         homeworld = as.factor(homeworld), 
         species = as.factor(species))


ggplot(SW, aes(x = mass, y = height)) + 
  geom_point()

ggplot(SW, aes(x = mass, y = height, colour = "red")) + 
  geom_point() + 
  annotate("text", label = paste("cor:", round(cor(SW$height,SW$mass, use = "complete.obs"),3)), x = 1000, y = 250)

ggplot(SW, aes(x = mass, y = height, colour = gender)) + 
  geom_point()

ggplot(SW, aes(x = mass, y = height, colour = gender, size=birth_year, alpha = 0.5)) + 
  geom_point(shape=23)

ggplot(SW, aes(x = mass, y = height, colour = gender, fill = gender, size=birth_year, alpha = 0.5)) + 
  geom_point(shape=23)

ggplot(BD, aes(x=nombre,y=edad)) + geom_point() + theme(axis.text.x = element_text(angle = 10))

### Gráfico de histogramas

ggplot(dta_data2, aes(x=Age)) + geom_histogram()

ggplot(dta_data2, aes(x=Age)) + geom_histogram(color = "green", fill = "blue", bins = 50)

ggplot(dta_data2, aes(x=Age)) + geom_histogram(color = "green", fill = "blue", bins = 50) + ylab("Frecuencia") + ggtitle("Histograma de edad")

### Boxplot

SW %>%
  ggplot(aes(y=mass)) + geom_boxplot()


SW %>%
  ggplot(aes(x = gender, y=mass)) + geom_boxplot()

SW %>%
  ggplot(aes(x = gender, y=mass)) + geom_boxplot() + coord_flip()

### Guardar gráficos

# Para guardar el último gráfico generado
ggsave(filename = "graf.tiff", dpi = "print")

#para más información sobre cómo especificar el tamaño o qué otros formatos de imagen admite:
?ggsave

# Si previamente se ha guardado un gráfico mediante
# p <- ggplot(...)
# también se puede especificar
# ggsave(filename = "graf.tiff", plot = p, dpi = "print")


# Tests estadísticos y modelos de regresión habituales para el análisis estadístico

## Tests de hipótesis

#### Prueba t de Student


summary(iris)

?t.test
t.test(iris$Sepal.Length, iris$Sepal.Width, alternative = "two.sided")
t.test(iris$Sepal.Length, iris$Sepal.Width, alternative = "less")
t.test(iris$Sepal.Length, iris$Sepal.Width, alternative = "greater")

t.test(iris$Sepal.Length, iris$Sepal.Width, alternative = "two.sided", mu = 2.8)

#### Prueba Wilcoxon-Mann-Whitney

wilcox.test(x = iris$Sepal.Length, y = iris$Sepal.Width, alternative = "two.sided", mu = 0,
            paired = FALSE, conf.int = 0.95)

#### Prueba de Shapiro-Wilk

shapiro.test(starwars$height)

#### Prueba chi-cuadrado de Pearson 

tt <- table(starwars$gender, starwars$hair_color)
chisq.test(tt)
tt
tt[-2,]
chisq.test(tt[-2,])

#### ANOVA

library(ggplot2)
ggplot(data = starwars, aes(x = gender, y = height, color= gender)) +
  geom_boxplot()

anova <- aov(iris$Petal.Length ~ iris$Species)
summary(anova)


## Regresiones

#### Regresión Lineal simple

pairs(SW)

# Se puede crear una gráfica similar creada a partir de ggplot gracias a la función ggpairs de la librería GGally

ggplot(SW, aes(x = mass, y = height)) + geom_point(shape = 1)+ scale_x_continuous(breaks = seq(0, 1400,200))+theme_bw()

mod0 <- lm(SW$height ~ SW$mass, data = iris)
summary(mod0)

mode(mod0)
mod0$coefficients

confint(object = mod0, level = 0.95 ) #Intervalo de confianza de los coeficientes de la regressión 

plot(mod0) # Diagnóstico del modelo:

# La librería ggfortify nos pemite crear gráficos equivalentes de diagnóstico del modelo a partir de ggplot, tanto para lm como para glm

library(ggfortify)
autoplot(mod0, which = 1:6, ncol = 2, label.size = 3) # Diagnóstico del modelo:


starwars$name[starwars$mass == 1358]

SW <- SW[-which(starwars$mass == 1358),]
ggplot(SW, aes(x = mass, y = height)) + geom_point(shape = 1)+ scale_x_continuous(breaks = seq(20, 160,20))+theme_bw()

mod0_1 <- lm(SW$height ~ SW$mass, data = iris)
summary(mod0_1)

mod0_1$coefficients

confint(object = mod0_1, level = 0.95 ) #Intervalo de confianza de los coeficientes de la regressión 

plot(mod0_1) # Diagnóstico del modelo:


library(ggpmisc)
ggplot(SW, aes(x = mass, y = height)) + 
  geom_point(shape = 1)+
  geom_smooth(method = 'lm')+ 
  # scale_x_continuous(breaks = seq(20, 160,20))+
  # theme_bw()+
  stat_poly_eq(formula = y~x, aes(label = ..eq.label..), parse = TRUE, coef.digits = 4)


# Creamos un data.frame con los valores de la variable independiente de los que queremos hacer la predicción:
nuevas <- data.frame(mass = c(80, 60, 20))

# Calculamos las predicciones:
predict(mod0_1, nuevas)

#### Regresión Lineal múltiple

mod1 <- lm(height ~ mass + gender, data = SW)
summary(mod1)
confint(object = mod1, level = 0.95 )
plot(mod1)

# Predicciones:
nuevas <- data.frame(mass = c(80, 60, 20), gender = c('male', 'female', 'female'))
predict(mod1, nuevas)

#### Regresión Logística

SW$gender <- car::recode(SW$gender, "'none' = NA")
SW$gender <- factor(SW$gender)

mod2 <- glm(gender ~ height + mass + hair_color + eye_color + birth_year, data = SW, family="binomial")
summary(mod2)
plot(mod2)

exp(mod2$coefficients)

# Apéndice

lapply(paste('package:',names(sessionInfo()$otherPkgs),sep=""),detach,character.only=TRUE,unload=TRUE)

library(dplyr)
library(plyr)
?rename # con la ayuda podemos ver que esta función está en varias librerías actualmente cargadas

names(mtcars)
names(rename(mtcars, x = gear)) # error
names(dplyr::rename(mtcars, x = gear)) # especificamos que la función que queremos es la de dplyr
names(plyr::rename(mtcars, x = gear)) # comprobamos que la función que estaba usando antes era la de plyr, ya que genera el mismo error
rename <- dplyr::rename # otra solución es asignar al nombre la función de dplyr
names(rename(mtcars, x = gear)) # ya no hay error


detach("package:plyr", unload=TRUE)
detach("package:dplyr", unload=TRUE)

