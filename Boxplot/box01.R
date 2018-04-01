## Criado por Obadowski
## Exemplo de boxplot - Acidentes de Trânsito em São Paulo (2017)

# Carregando bibliotecas
library(tidyverse)
library(dplyr)
library(ggthemes)
library(ggrepel)

# Obtendo Working Directory (Área de Trabalho)
wd <- getwd()

# Obtendo a base de dados a partir do arquivo .csv
# Pode ser baixado em: http://www.infosiga.sp.gov.br/Home/Relatorio
# 1) Possui cabeçalhos
# 2) Separador ; (ponto e vírgula)
# 3) separador decimal , (vírgula)
# 4) String NA (dados vazios, incompletos): NAO DISPONIVEL
# 5) Codificação do arquivo: UTF-8 (raro, normalmente arquivos brasileiros são ISO-8859-1)
# 
acidentes <- read.csv(file = paste(wd,"/Blog/Tutoriais/Boxplot/INFOSIGAFEV2018.csv", sep = ""),
                     header = TRUE,
                     sep = ";",
                     dec = ",",
                     na.strings = "NAO DISPONIVEL",
                     fileEncoding = "utf-8")

# Chama o script box02.R, onde estão os comandos de construção do gráfico
source(file = paste(wd, "/Blog/Tutoriais/Boxplot/box02.R", sep = ""))
