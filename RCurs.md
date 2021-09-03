Introducción a R
========================================================
author: Iago Giné Vázquez
date: 2021-09-13
autosize: true
width: 2560
height: 1440
css: RCP.css





The R Project for Statistical Computing
========================================================

<img src="https://www.r-project.org/logo/Rlogo.svg" width="200" height="200">
<!-- ![Alt text](https://www.r-project.org/logo/Rlogo.svg) -->

- https://www.r-project.org
- Software estadístico libre, abierto y gratuito
- Miles de librerías y proyectos complementan el software base en distintas plataformas:
  + https://cran.r-project.org/
  + https://r-forge.r-project.org/
  + https://www.bioconductor.org/
- Una gran comunidad de usuarios escribe en blogs y foros:
  + https://www.r-bloggers.com/
  + https://rweekly.org/
  + https://stackoverflow.com/questions/tagged/r
- Por qué R?
  + Porque podéis escribir las instrucciones en R scripts, y ejecutarlas todas de una vez, sin tener que memorizar y repetir cada uno de los pasos.
  + Porque en Internet podréis encontrar solución a (casi) todos los problemas que os encontréis
  + Porque podréis personalizar/modificar cada instrucción con las opciones deseadas.
  + Porque podéis trabajar con más de una base de datos abierta simultáneamente y no tienen que estar guardadas en un formato específico para poder abrirlas.



R como calculadora
========================================================
- R es esencialmente una consola en la que el cursor se sitúa tras el símbolo `>`. Ahí se escriben las instrucciones. Se ejecutan con `Enter`.
- Para empezar, R permite realizar las operaciones de cualquier calculadora científico.
- Incluye además instrucciones específicas para operaciones estadísticas.

<img src="Rterm2.png" width="1200" height="100%">



Necesitamos un editor
========================================================
- Más práctico: ejecutar múltiples operaciones simultáneamente.
- Para ello: se escriben todas en un fichero de texto simple, pero con extensión `.r` en lugar de `.txt`.
- Es suficiente un editor de texto simple. En Windows: **Bloc de notas** (en OS X: **TextEdit**).
- Otros editores facilitan la introducción y ejecución de las instrucciones.
- Ej.: **Notepad++**, **Sublime Text**, **Visual Studio Code**, **Geany**, **Nano**, **Emacs**, **VIM**, ...
- Enfocado al uso de **R** y el más usado para ello: **RStudio** (nombre del editor y de la empresa que lo produce y comercializa).
  + RStudio no es software libre, aunque su edición básica es de código abierto y gratuita.
  + https://www.rstudio.com/
  
<img src="4panels1.png">

Algunas nociones sobre RStudio
========================================================
- Las instrucciones en el R-script en RStudio se ejecutan con `Control+Enter`

<img src="4panels2.png" width = "100%">

Qué nos encontraremos en R?
========================================================
- Objetos elementales de las siquientes clases:
    + Lógicos (`TRUE` y `FALSE`)
    + Numéricos
    + Cadenas de caracteres
- Se pueden crear objetos más complejos añadiéndoles atributos, como pueden ser las dimensiones o las etiquetas, o modificando su estructura.
- A partir de los anteriores se pueden crear objetos compuestos con diferentes estructuras, como pueden ser: 
    + Vectores
      * Todos los elementos del vector han de ser de la misma clase.
      * Se crean y se unen con la función `c(...)`
      * Se usa `vector[i]` para acceder al i-ésimo elemento del vector
      * Una matriz es un vector con 2 dimensiones
    + Factores (para las variables categóricas; pueden ser o no ordenados)
    + Listas (colección ordenada de objetos no necesariamente del mismo tipo)
    + Data frames (para las bases de datos)
- R es un lenguaje orientado a objetos. Para asignar nombre a los objetos usamos el símbolo `<-`
- Funciones: evalúan objetos. La evaluación de un objeto `x` con una función `f` se codifica `f(x)`. Por ejemplo, para conocer la clase, estructura y atributos de un objeto `x` escribiríamos `class(x)`, `str(x)` y `attributes(x)` respectivamente.
- R dispone de una ayuda muy completa sobre todas las funciones, procedimientos y elementos que configuran el lenguaje
- Se puede acceder a ella con la función `help()` o mediante `?`. Por ejemplo, `help(class)` o `?attributes`.
- Se pueden escribir comentarios (secciones de código que el programa no ejecuta), situando antes un símbolo `#`
- Los missings en R se representan con el símbolo `NA` (cualquier clase de objetos) o también  `NaN` (objetos numéricos).


Empecemos
========================================================

```r
install.packages("tidyverse") # instala la librería tidyverse, que a su vez instala las librerías dplyr, tidyr, haven, y otras (https://www.tidyverse.org, https://github.com/tidyverse/tidyverse)
#getwd() # Cuál es el directorio de trabajo actual?
setwd("~/Documents/PSSJD/Curso-R/") # En qué directorio de trabajo nos situamos ahora
```

O bien, mediante RStudio:
+ Panel `Packages > Install`
+ `Session > Set Working Directory > Choose Directory`
+ `Session > Set Working Directory > To Source File Location`

Para abrir ficheros de excel disponemos de diversas funciones en las librerías `readxl` y `openxlsx` entre muchas otras. Aunque la segunda librería tiene más funciones para manipular y escribir ficheros `.xlsx`, la primera dispone de funciones que nos permiten leer también ficheros `.xls`

```r
library(readxl)
#help(package = "readxl") # Informémonos acerca de la librería readxl
#?read_excel # ayuda de la función read_excel
read_excel("data_curs_stat/EP1.xls")
```

```
# A tibble: 4,753 × 12
   q0002_hhid sex   age   mar_1 edu1      phys_hea1                    hea1 dep1  score_lon1 score_sup1 income1 income_inf1
        <dbl> <chr> <chr> <chr> <chr>     <chr>                       <dbl> <chr>      <dbl>      <dbl>   <dbl> <chr>      
 1          1 fem   35-49 Yes   Tertiary  None                         70.5 No             3         12      15 Normal     
 2          2 masc  35-49 Yes   Tertiary  None                         78.9 No             3         12      17 Normal     
 3          3 masc  65-79 Yes   Primary   None                         66.6 No             3         12      15 Normal     
 4          4 masc  50-64 Yes   Primary   1 physical health problem    77.4 No             3         11      18 Normal     
 5          5 fem   50-64 No    Tertiary  None                         52.5 No             3         12      29 Normal     
 6          6 fem   50-64 No    Tertiary  None                         53.7 No             3         13      25 Normal     
 7          7 masc  50-64 Yes   Secondary None                         59.1 No             6         10      12 Good       
 8          8 masc  50-64 Yes   Primary   None                         76.4 No             3         12      14 Normal     
 9          9 fem   50-64 No    Secondary None                         73.7 No             3         11      26 Good       
10         10 fem   80+   No    Primary   2+ physical health problems  28.0 No             6         13      10 Normal     
# … with 4,743 more rows
```

Abrir bases de datos y ejecutar funciones: R no es como Stata.
========================================================
La función `read_excel` abre la base de datos, pero a diferencia de instrucciones como `use` o `import excel` en Stata, no la copia a memoria. Así, si en Stata podríamos ejecutar `describe` o `summarize`, si en R ejecutamos una función como `summary` el resultado es la propia función.

```r
summary
```

```
function (object, ...) 
UseMethod("summary")
<bytecode: 0x56108a6220f8>
<environment: namespace:base>
```

Tenemos que evaluar la función `summary` en la base de datos que abrimos con `read_excel`:

```r
summary(read_excel("data_curs_stat/EP1.xls"))
```

```
   q0002_hhid        sex                age               mar_1               edu1            phys_hea1              hea1           dep1             score_lon1     score_sup1   
 Min.   :    1   Length:4753        Length:4753        Length:4753        Length:4753        Length:4753        Min.   : 0.00   Length:4753        Min.   :3.00   Min.   : 3.00  
 1st Qu.: 1327   Class :character   Class :character   Class :character   Class :character   Class :character   1st Qu.:42.83   Class :character   1st Qu.:3.00   1st Qu.:10.00  
 Median : 2615   Mode  :character   Mode  :character   Mode  :character   Mode  :character   Mode  :character   Median :55.64   Mode  :character   Median :3.00   Median :12.00  
 Mean   : 3145                                                                                                  Mean   :53.97                      Mean   :3.74   Mean   :11.53  
 3rd Qu.: 3807                                                                                                  3rd Qu.:66.06                      3rd Qu.:4.00   3rd Qu.:13.00  
 Max.   :92755                                                                                                  Max.   :92.82                      Max.   :9.00   Max.   :14.00  
                                                                                                                NA's   :187                        NA's   :285    NA's   :414    
    income1       income_inf1       
 Min.   : 1.000   Length:4753       
 1st Qu.: 2.000   Class :character  
 Median : 5.000   Mode  :character  
 Mean   : 8.989                     
 3rd Qu.:15.000                     
 Max.   :35.000                     
 NA's   :1067                       
```

Primeros pasos con una base de datos 
========================================================
No es práctico. Asignamos la base de datos a una variable que llamamos `dataw1`:

```r
dataw1 <- read_excel("data_curs_stat/EP1.xls")
#summary(dataw1)
#str(dataw1)
class(dataw1)
```

```
[1] "tbl_df"     "tbl"        "data.frame"
```

```r
head(dataw1) # primeras (6) filas
```

```
# A tibble: 6 × 12
  q0002_hhid sex   age   mar_1 edu1     phys_hea1                  hea1 dep1  score_lon1 score_sup1 income1 income_inf1
       <dbl> <chr> <chr> <chr> <chr>    <chr>                     <dbl> <chr>      <dbl>      <dbl>   <dbl> <chr>      
1          1 fem   35-49 Yes   Tertiary None                       70.5 No             3         12      15 Normal     
2          2 masc  35-49 Yes   Tertiary None                       78.9 No             3         12      17 Normal     
3          3 masc  65-79 Yes   Primary  None                       66.6 No             3         12      15 Normal     
4          4 masc  50-64 Yes   Primary  1 physical health problem  77.4 No             3         11      18 Normal     
5          5 fem   50-64 No    Tertiary None                       52.5 No             3         12      29 Normal     
6          6 fem   50-64 No    Tertiary None                       53.7 No             3         13      25 Normal     
```

```r
#head(dataw1, 3) # primeras 3 filas
#tail(dataw1) # últimas (6) filas
```

**Ejercicio:** 

*Usando las funciones `setwd` y `read_excel` convenientemente (hay varias posibilidades), guardar también las bases de datos `EP2.xls` y `EP3.xls` en dos variables que llamaremos `dataw2` y `dataw3`. Podéis ver `dataw1`, `dataw2`, `dataw3` y sus dimensiones en el panel `Environment` de RStudio?*



**Nota:** _Para abrir ficheros `*.csv` disponemos de la función `read.csv` en R y de la función `read_csv` de la librería `readr` entre otras. La librería `haven` dispone de diversas funciones que permiten abrir y escribir ficheros en formatos de Stata, SPSS y SAS (pueden consultarse en su ayuda, `package(help = "haven")`). Por otra parte la librería `readspss` (https://github.com/JanMarvin/readspss) tiene funciones que permiten abrir bases de datos en formato de SPSS encriptadas con contraseña._


Acceso a las variables de una base de datos: `$` y `[[`
========================================================

```r
# dataw1$phys_hea1
# dataw1[["phys_hea1"]]
class(dataw1$phys_hea1) # chr quiere decir que está guardada como una cadena de carácteres
```

```
[1] "character"
```

```r
#summary(dataw1$phys_hea1)
str(dataw1$phys_hea1)
```

```
 chr [1:4753] "None" "None" "None" "1 physical health problem" "None" "None" "None" "None" "None" "2+ physical health problems" "None" "None" "2+ physical health problems" ...
```

```r
#attributes(dataw1$phys_hea1)
table(dataw1$phys_hea1)
```

```

  1 physical health problem 2+ physical health problems                        None 
                       1538                         887                        1723 
```

```r
#?table
table(dataw1$phys_hea1, useNA = "ifany")
```

```

  1 physical health problem 2+ physical health problems                        None                        <NA> 
                       1538                         887                        1723                         605 
```

```r
prop.table(table(dataw1$phys_hea1))
```

```

  1 physical health problem 2+ physical health problems                        None 
                  0.3707811                   0.2138380                   0.4153809 
```

Guardando los resultados
========================================================
Hemos dicho que R es como una calculadora, y que si no asignamos los objetos a variables, se muestran en consola pero no quedan guardados en ningún sitio.
- Los objetos de R (como una base de datos o dataframe) se pueden guardar con la función `save` en ficheros con la extensión `.rda` o `.rdata` (aunque a veces también se escribe la `r` e incluso la `d` en mayúscula, por ejemplo `.RData`)
- Los resultados, si son matrices, data frames o tablas, además, también se pueden guardar en ficheros `.csv` o con formatos de excel (a menudo, las funciones mencionadas de la forma `read_` o `read.` tienen correspondientes `write_` o `write.`).
- Los resultados y más generalmente todo aquello que aparece por consola puede ser guardados en ficheros de texto con la función `sink`.
- A no ser que se especifique la dirección del fichero, serán guardados en el directorio donde R está trabajando (`getwd()`)

```r
#?sink
sink("Summary_Estudi_poblacional_w1.txt", split = TRUE)
table(dataw1$phys_hea1)
```

```

  1 physical health problem 2+ physical health problems                        None 
                       1538                         887                        1723 
```

```r
summary(dataw1$hea1)
```

```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
   0.00   42.83   55.64   53.97   66.06   92.82     187 
```

```r
sink()
```

**Ejercicio:**

*Qué aparece en el fichero Summary_Estudi_poblacional_w1.txt?*


Transformación de variables (I)
========================================================
- La función `as.factor` permite transformar a una variable categórica

```r
class(as.factor(dataw1$phys_hea1))
```

```
[1] "factor"
```

```r
table(as.factor(dataw1$phys_hea1), useNA = "ifany")
```

```

  1 physical health problem 2+ physical health problems                        None                        <NA> 
                       1538                         887                        1723                         605 
```

- En formatos de fichero distintos de `.xls` o `.csv`, como pueden ser los formatos de Stata o SPSS, las categorías de las variables categóricas pueden estar grabadas como etiquetas, mientras los valores son numéricos. En esos casos, para recuperar las etiquetas como categorías es más conveniente usar la función `as_factor` de la librería `haven`.


Guardamos la transformación en la base de datos. Para ello usaremos la función `mutate` de la librería `dplyr`, que permite realizar varias transformaciones separadas por comas

```r
library(dplyr)
#?mutate

dataw1 <- dataw1 %>% #partimos de la base de datos dataw1 y entonces
  mutate(phys_hea1 = as.factor(phys_hea1)) # transformamos la variable y la guardamos con el mismo nombre

# finalmente la base de datos queda guardada con el mismo nombre mediante la asignación inicial (dataw1 <- ...)
```


Transformación de variables (II)
========================================================

Como la variable `q0002_hhid` es un id podría interesarnos que fuera de clase cadena

```r
#class(dataw1$q0002_hhid)
#?as.character
```


Varias transformaciones seguidas las podemos evaluar:
- Aplicando varias veces `mutate`:

```r
dataw1 <- dataw1 %>% #partimos de la base de datos dataw1 y entonces
  mutate(phys_hea1 = as.factor(phys_hea1))  %>% # transformamos la variable phys_hea1 y la guardamos con el mismo nombre, y entonces
  mutate(dep1 = as.factor(dep1)) %>% # transformamos la variable dep1 y la guardamos con el mismo nombre
  mutate(q0002_hhid = as.character(q0002_hhid)) # transformamos la variable q0002_hhid y la guardamos con el mismo nombre
```

- Pero en lugar de eso, habitualmente se separan las instrucciones por comas en un sólo `mutate`:

```r
dataw1 <- dataw1 %>% #partimos de la base de datos dataw1 y entonces
  mutate(phys_hea1 = as.factor(phys_hea1), dep1 = as.factor(dep1), q0002_hhid = as.character(q0002_hhid)) # transformamos las variables phys_hea1,  dep1 y q0002_hhid y las guardamos con los mismos nombres
```
- O bien, cuando estamos aplicando la misma transformación (en este caso `as.factor`) a varias variables (y guardándolas con el mismo nombre), podemos usar `across(vector de variables, función)` dentro de `mutate`:

```r
dataw1 <- dataw1 %>% #partimos de la base de datos dataw1 y entonces
  mutate(across(c(phys_hea1, dep1), as_factor), q0002_hhid = as.character(q0002_hhid)) # evaluamos as_factor a través de las variables phys_hea1 y dep1 y transformamos también number_id
```


**Ejercicio:** 

*Buscar todas las variables categóricas en las 3 bases de datos y transformar estas bases de datos de manera que esas variables sean factores. Mostrar las frecuencias de las categorías de algunas de esas variables. Transformar la variable `q0002_hhid` a cadena de carácteres. Consultar también la ayuda de `as.numeric`, `as.integer` y `as.factor`*





Otras operaciones con funciones de la librería `dplyr`
========================================================
- Ejemplo 1


```r
dataw1 %>% #partimos de la base de datos dataw1 y entonces
  select(q0002_hhid, hea1, dep1) %>% # mantenemos sólo las columnas q0002_hhid, hea1 y dep1, y entonces
  filter(dep1 == "Yes") %>% # nos quedamos con las filas de quienes padecen depresión, y entonces
  arrange(desc(hea1)) %>% # ordenamos las filas por de mayor a menor valor de estado de salud, y entonces
  head(3) # nos quedamos con los 3 pacientes con depresión con mayor valor de Health state
```

```
# A tibble: 3 × 3
  q0002_hhid  hea1 dep1 
  <chr>      <dbl> <fct>
1 4941        82.1 Yes  
2 4339        80.2 Yes  
3 1299        79.8 Yes  
```

- Ejemplo 2 (uso de funciones de R como `mean`, `median` o `quantile`; se puedn usar otras como `var`, `sd`, `min`, `max`, `IQR`, etc.)


```r
dataw1 %>% #partimos de la base de datos dataw1 y entonces
  select(q0002_hhid, hea1, dep1) %>% # mantenemos sólo las columnas number_id, hea1 y dep1, y entonces
  group_by(dep1) %>% # agrupamos por las categorías de depresión, y entonces
  summarise(mean_hea1 = mean(hea1, na.rm = TRUE), median_hea1 = median(hea1, na.rm = TRUE), tercil_hea1 = quantile(hea1, probs = 1/3, na.rm = TRUE), n = n()) # calculamos la media, la mediana y el primer tercil de hea1 para cada categoría de depresión y el número de observaciones por cada categoría
```

```
# A tibble: 3 × 5
  dep1  mean_hea1 median_hea1 tercil_hea1     n
  <fct>     <dbl>       <dbl>       <dbl> <int>
1 No         55.9        57.4        50.2  4073
2 Yes        38.4        37.9        31.1   510
3 <NA>      NaN          NA          NA     170
```

**Nota:** *usamos `na.rm = TRUE` dentro de `mean`, de `median` y de `quantile` para que calcule la media de aquellos valores que no son missing. En caso contrario, cuando hay missings el resultado es `NA`.*

**Nota:** *Todo lo anterior se puede realizar también con funciones de R sin necesidad de acudir a la librería `dplyr`, pero no tenemos posibilidades como el uso de `across`, o las alternativas pueden ser más complejas.*




Cálculo de prevalencias:
========================================================
Prevalencia de depresión:

```r
dataw1 %>% 
  count(dep1) %>% # Contamos los individuos en cada categoría de depresión y
  mutate(prop = 100*n/sum(n)) # calculamos el %
```

```
# A tibble: 3 × 3
  dep1      n  prop
  <fct> <int> <dbl>
1 No     4073 85.7 
2 Yes     510 10.7 
3 <NA>    170  3.58
```

Prevalencia de depresión por grupos de edad:

```r
dataw1 %>% 
  group_by(age) %>% 
  count(dep1) %>% # Contamos los individuos en cada categoría de depresión por grupo de edad y
  filter(!is.na(dep1)) %>% # eliminamos los missings si nos interesa contar el porcentaje sobre el total de respuestas válidas
  mutate(prop = 100*n/sum(n)) # Calculamos el %
```

```
# A tibble: 10 × 4
# Groups:   age [5]
   age   dep1      n  prop
   <fct> <fct> <int> <dbl>
 1 18-34 No      382 93.9 
 2 18-34 Yes      25  6.14
 3 35-49 No      500 90.7 
 4 35-49 Yes      51  9.26
 5 50-64 No     1558 88.5 
 6 50-64 Yes     202 11.5 
 7 65-79 No     1298 87.3 
 8 65-79 Yes     188 12.7 
 9 80+   No      335 88.4 
10 80+   Yes      44 11.6 
```

Variables y dimensiones de las bbdd
========================================================




```r
names(dataw1)
```

```
 [1] "q0002_hhid"  "sex"         "age"         "mar_1"       "edu1"        "phys_hea1"   "hea1"        "dep1"        "score_lon1"  "score_sup1"  "income1"     "income_inf1"
```

```r
dim(dataw1)
```

```
[1] 4753   12
```

```r
ncol(dataw1); nrow(dataw1)
```

```
[1] 12
```

```
[1] 4753
```

```r
names(dataw2); dim(dataw2)
```

```
[1] "q0002_hhid" "dep2"       "score_lon2" "score_sup2" "income2"    "phys_hea2"  "hea2"      
```

```
[1] 2400    7
```

```r
names(dataw3); dim(dataw3)
```

```
[1] "q0002_hhid" "dep3"       "score_lon3" "score_sup3" "income3"    "phys_hea3"  "health3"   
```

```
[1] 1512    7
```

Fusión (merge) de bbdd
========================================================



```r
#Cuántos missings tiene la variable `q0002_hhid`?
#?is.na
#table(is.na(dataw1$q0002_hhid)); table(is.na(dataw2$q0002_hhid)); table(is.na(dataw3$q0002_hhid))# contamos el número de missings de q0002_hhid
```

En Stata:

```stata
. use "...\Estudi_pob_w1.dta", clear
merge 1:1 q0002_hhid using "...\Estudi_pob_w2.dta"
merge 1:1 q0002_hhid using "...\Estudi_pob_w3.dta", generate(_merge2)
```

En R, donde ya tenemos las bbdd abiertas y guardadas:

```r
data <- dataw1 %>% # partimos de la base de datos dataw1 y entonces
  full_join(dataw2, by = "q0002_hhid") %>% # unimos horizontalmente con todas las observaciones de dataw2 con q0002_hhid iguales a los de dataw1 y añadimos las nuevas, y entonces
  full_join(dataw3, by = c("q0002_hhid"))# unimos horizontalmente con todas las observaciones de dataw3 con q0002_hhid iguales a los que ya había y añadimos las nuevas
names(data)
```

```
 [1] "q0002_hhid"  "sex"         "age"         "mar_1"       "edu1"        "phys_hea1"   "hea1"        "dep1"        "score_lon1"  "score_sup1"  "income1"     "income_inf1"
[13] "dep2"        "score_lon2"  "score_sup2"  "income2"     "phys_hea2"   "hea2"        "dep3"        "score_lon3"  "score_sup3"  "income3"     "phys_hea3"   "health3"    
```

```r
dim(data)
```

```
[1] 4753   24
```


```r
?full_join
```

**Ejercicio 4**:

*Con `full_join` creamos una base de datos resultado de fusionar las 3 iniciales e incluír todas las observaciones de cada una de ellas. Mirando en la ayuda, este ejercicio consiste en fusionar las 3 bases de datos, pero incluyendo sólo aquellas observaciones de comunes a las 3. Cuántas observaciones tiene?*


Combinar bases de datos
========================================================
Abrimos las 3 olas de un ensayo clínico en fichero separados.







































```
Error in read_dta("data_curs_stat/Assaig_clinic_w1.dta") : 
  could not find function "read_dta"
```
