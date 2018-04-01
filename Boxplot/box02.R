## Criado por Obadowski
## Exemplo de boxplot - Acidentes de Trânsito em São Paulo (2017)

# Filtra apenas os acidentes ocorridos em 2017
# E que possua informações válidas sobre a idade das vítimas
aci_2017 <- acidentes %>%
  filter(Ano.Óbito == 2017 & !is.na(Idade))

# Determina os quartis (quantiles) para o data frame filtrado
quant <- quantile(aci_2017$Idade)

# Gráfico Boxplot usando o data frame filtrado (aci_2017)
# Mapeamento estético, x "Acidentes" e y variável de idades
# tema do Wall Street Journal. (Por quê? Porque eu gosto.)
# theme(), correção do tamanho da fonte para o ticker do eixo x
# ggtitle(), inseri título e subtítulo
# inserção das linhas dos quartis em vermelho escuro e de notações de valores para um cada
p <- aci_2017 %>%
  ggplot(aes(x = "Acidentes", y = Idade), show.legend = FALSE) +
  geom_boxplot(width = 0.5, fill = "darkgreen", color = "black", outlier.color = "blue") +
  theme_wsj(color = "white") +
  theme(axis.text.x = element_text(size = 14, hjust = 1, angle = 45)) +
  ggtitle('Acidentes Fatais em SP', subtitle = "Dados de 2017") +
  geom_hline(yintercept = quant[2], color = "darkred", size = 0.75, linetype = 2) +
  geom_text(aes(0.6, quant[2], label = quant[2], family = "Arial", vjust = 0.25), size = 8) +
  geom_hline(yintercept = quant[3], color = "darkred", size = 0.75, linetype = 2) +
  geom_text(aes(0.6, quant[3], label = quant[3], family = "Arial", vjust = 0.25), size = 8) +
  geom_hline(yintercept = quant[4], color = "darkred", size = 0.75, linetype = 2) +
  geom_text(aes(0.6, quant[4], label = quant[4], family = "Arial", vjust = 0.25), size = 8)

# Apresenta o gráfico
print(p)

p1 <- aci_2017 %>%
  filter(!is.na(Tipo.Veiculo)) %>%
  ggplot(aes(x = Tipo.Veiculo, y = Idade, fill = Tipo.Veiculo)) +
  geom_boxplot(show.legend = FALSE, width = 0.5) +
  theme_wsj(color = "white") +
  theme(axis.text.x = element_text(size = 14, hjust = 1, angle = 45)) +
  ggtitle('Acidentes Fatais em SP (2017)', subtitle = "Por tipo de Veículo") +
  scale_x_discrete(breaks = c("AUTOMOVEL", "BICICLETA", "CAMINHAO", "MOTOCICLETA",
                              "ONIBUS", "OUTROS", "PEDESTRE"),
                   labels = c("Automóvel", "Bicicleta", "Caminhão", "Motocicleta",
                              "Ônibus", "Outros", "Pedestres"))

print(p1)
