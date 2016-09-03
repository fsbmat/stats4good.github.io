---
title: "RMarkdown: Just do it"
author: "Larissa Sayuri Futino C. dos Santos"
date: "11 de agosto de 2016"
output: html_document
fontsize: 10pt
fig_caption: true
bibliography: minha_bib.bib
---
<!-- Antes de mais nada: Esse eh o eito usual de comentar código em HTML -->
<!-- Esse script descreve e implementa umm documento simples RMarkdown em HTML para que sirva de referencia para o Stats4Good. Apresentado em 11/08/2016 por Larissa Sayuri Santos. -->
<!-- Nas primeiras linhas: Informacoes basicas do documento -->

<!-- Inserindo a imagem do logo so grupo em linguagem HTML -->
<img src="logo-stats4good.png" style="position:absolute; top:-3px; right:0px; width: 170px; heigth: 150px;" />

<!-- ------------------------------------------------------------------------------------ -->
<!-- ------------------- Texto do nosso documento digitado livremente. ------------------ -->
<!-- Repare que a gente nao chamou pacote e as acentuaçoe e pontuaçoes foram preservadas. -->
<!-- ------------------------------------------------------------------------------------ -->

<!-- Tres ou mais asteriscos denotam: pular linha (ou como dizem: horizontal rule) -->
*** 

<!-- Quero criar uma organizaçao do tipo: seçao e sub-seçoes. -->
<!-- Vou usar o '#' para isso. Ele é uma especie de operador de fonte no corpo do texto -->
<!-- O numero de '#' eh inversamente proporcional ao tamanho da fonte adotada. -->
<!-- Sao 6 tamanhos possiveis: '#' ao '######' -->

<!-- Secao 01 -->
# Introdução

<!-- Sub-secao 01.01 -->
### Objetivos

A gente começa o Semestre 2/2016 com um grande exercício de metalinguagem. Vamos usar uma linguagem para descrever a si própria. Esse é um documento R Markdown com os objetivos de apresentar a linguagem, suas vantagens e usos e servir de modelo/base para futuras postagens do grupo.

<!-- Sub-secao 01.02 -->
### Conceitos e História

<img src="markdown.png" alt="Drawing" style="width: 60px; heigth: 60px; float: right;"/>

*Markdown*  é uma linguagem simples para formatar
sintaxe de arquivos a serem escritos em HTML, PDF e Word. Trata-se de uma
*lightweight markup language (LML)*, ou seja, ela foi concebida para ser de fácil
utilização a partir do uso de qualquer editor de texto genérico e de fácil 
leitura.

O primeiro pacote em R chamava-se *markdown* que tinha como objetivo principal
gerar documentos em HTML. Para estatísticos, que usualmente precisam de citações, notas de rodapé e informações documentais como autor, data e título, o *markdown* não se mostrava uma ferramente realmente conveniente.

A necessidade de conversão para outros formatos também ficou muito recorrente e, nesses casos, recorria-se ao [Pandoc][link_Pandoc]. *What?* Trata-se de um conversor universal de documentos com possibilidade de uso de:

<!-- Uma estrutura de tópicos não numerados: basta usar '*' -->
* notas de rodapé; 
* tabelas; 
* listas de definição; 
* aspas, sub-escritos e super-escritos;
* listas ordenadas e
* citações automáticas e bibliografias
* sintaxe LaTeX dentre muitos outros

Entretanto, o Pandoc todo poderoso exige o uso de muitos comandos de linha. O mesmo problema do knit, que é usado conjuntamente com o primeiro.

<img src="RStudio.jpg" alt="Drawing" style="width: 50px; heigth: 50px; float: right;"/>

Logo, a equipe do [RStudio][link_RStudio] criou a segunda geração do R Markdown, que está sendo usada agora, com o objetivo de acrescentar uma interface amigável para customizar opções do Pandoc. 

Em uma definição do R-bloggers:  
<center> [R-Markdown][link_RMarkdown] *is a great way to create dynamic documents with embedded chunks of R code*. <center>

***

<!-- Secao 02 -->
# Vantagens

E realmente vale a pena usar o rmarkdown?

<!-- Uma estrutura de sub-tópicos não numerados: basta usar '+' -->

* O documento é 
+ auto-contido
+ altamente reproduzível o que o torna facilmente compartilhável

* Você pode definir seus próprios _templates_ e _outputs_

* O código R pode ser incluído ao relatório/documento de sorte que não o primeiro não se separa do segundo. A facilidade de um documento unificado evita re-trabalho.

* Especificamente para documentos HTML:
+ O texto é escrito como um texto usual, ou seja, não há necessidade de conhecimento de linguagem HTML.

+ O _output_ inclui figuras, blocos de códigos e/ou resultados além do próprio texto. É um arquivo fácil de enviar por email ou de postar em um _website_.

+ Um arquivo HTML facilita colaboração: É muito mais simples comentar uma análise quando o código, _output_ e imagens estão disponíveis no mesmo arquivo. 

***

<!-- Secao 03 -->

# Mãos à obra!

Pressupondo que você é um usuário RStudio, ok? Se você não é... Instale! Vale a pena.

<!-- Sub-secao 03.01 -->
### Começando...

<!-- Sub-sub-secao 03.01.01 -->
#### Criando um documento markdown 

<!-- Inserindo uma imagem de arquivo no PC centralizada com 'caption' -->
<center><img src = "Tela01ComecaRmarkdown.png"></center>
<center>Passo 01: Clique em: File -> New File -> R Markdown. </center>

****

<center><img src = "Tela02ComecaRmarkdown.png"></center>
<center>Passo 02: Na caixa de diálogo clique em Document e selecione o tipo HTML (o formato de postagens em blog que o grupo adotou). </center>

****
<!-- Inserindo uma imagem em página web alinhada à esquerda com 'caption' -->
![Passo 03: Você deve se deparar com um documento similar a esse. Salve-o e repare que a extensão será .Rmd e é só começar! ](https://i0.wp.com/moderndata.plot.ly/wp-content/uploads/2015/12/Part1Figure3.png?w=456)

<!-- Sub-sub-secao 03.01.02 -->
#### Compilando

<!-- Inserindo uma imagem em página web alinhada à direita com 'caption' -->
![Passo 04: Para gerar o seu documento de interesse basta apertar o botão knit.
](https://raw.githubusercontent.com/bbest/rmarkdown-example/master/screenshots/rstudio_knit-button.png)

***

<!-- Sub-secao 03.02 -->
### _Chunks_, códigos, _outputs_, equações e gráficos 

Quando o interesse é acrescentar partes do código R em meio ao documento utiliza-se o conceito de _chunk_ de código (_code chunk_). Em uma tradução literal, são pedaços do código.

***

<!-- Sub-sub-secao 03.02.01 -->
#### _Inline_

Se vc quer inserir um pedaço de código _inline_ use apenas uma aspa simples para começar e terminar o _chunk_. Ao abrir o _chunk_ comece pela letra 'r' e acrescente seu código. 
Botando os pingos nos i's segue um _output_ de código R: `r paste("Mole, né? Tão fácil quanto 2 + 2 = " , 2 + 2)`.

E se fosse uma equação? É muito parecido com o Latex; entre dois cifrões ($) insere-se a expressão de interesse, por exemplo:  $t^{'} = t \frac{1}{\sqrt{ 1 -\frac{v^{2}}{c^{2}}  }}$

***

<!-- Sub-sub-secao 03.02.01 -->
#### Entre linhas de texto

Basicão:

* Para abrir: três aspas invertidas seguidas da letra r entre chaves ({r})
* Para fechar: três aspas invertidas

A seguir, o código em um _chunk_ e seu respectivo resultado:

```{r}
## Um classico: (Repare bem! Eh assim que se comenta codigo em um chunk do rmarkdown!)
paste("Alô Mundo RMarkdown!")
``` 

Um  _chunk_ pode contemplar tudo de um código R usual: Chamada de pacotes, bases de dados, declaração e uso de funções e objetos além de _outputs_.

Vamos fazer um pequeno script para exemplificar.

```{r, echo = TRUE, results = 'hide', message = FALSE, warning = FALSE}
rm(list = ls())
gc()

require(googleVis)
op <- options(gvis.plot.tag="chart")

## Criando a nossa base
id <- 1:20
classif <- c(rep( "GrandMaster", 15), "Master", "GrandMaster", "Master", "GrandMaster", "Master")
exp <- c(4, 3, 3, 5, 3, 3, 5, 2, 6, 5, 4, 2, 5, 5, 3, 3, 4, 2, 5, 3)
Ouro <- c(24, 22, 18, 9, 5, 13, 18, 10, 16, 8 , 6, 6, 23, 5, 5, 3, 5, 4, 9, 7)
Prata <- c(20, 7, 20, 23, 6, 10, 14, 6, 20, 13, 25, 7, 10, 6, 5, 0 , 24, 0, 8 , 13)
Bronze <- c(18, 0, 20, 13, 4, 5, 4, 1, 12, 3, 16, 1, 5, 2, 5, 6, 9, 0, 10, 10)
pont <- c(216.177, 212.096, 193.549, 135.847, 127.354, 127.013, 121.055, 119.520, 112.719, 106.700,
          105.547, 105.539, 104.601, 98.255, 97.703, 97.514, 97.309, 97.307, 90.787, 87.930)

basecompet <- data.frame(id, classif, exp, Ouro, Prata, Bronze, pont)
rm(id, classif, exp, Ouro, Prata, Bronze, pont)
```

```{r, echo = TRUE, results = 'asis', message = FALSE, warning = FALSE}
## Criando uma funcao
fGrafColEmpil <- function(BASE, XVAR, YVAR, TITULO){
  Grafico <- gvisColumnChart(BASE, 
                             xvar = XVAR,
                             yvar = YVAR, 
                             options = list(isStacked = TRUE,
                                            title = TITULO,
                                            vAxes = "[{viewWindowMode:'explicit', 
                                          viewWindow:{min:0, max:70}}]",
                                          legend ="{position: 'bottom', textStyle:                                                                            {fontSize:12}}",
                                          width = '900px', height = '400px',
                                          colors = "['#FFD700', '#CDC5BF', '#DAA520']"))
  return(Grafico)
}
```

```{r, echo = TRUE, results = 'asis', message = FALSE, warning = FALSE}
## Chamando a funcao
graficoColEmpil <- fGrafColEmpil(BASE = basecompet, 
                                 XVAR = "id", 
                                 YVAR = colnames(basecompet)[-c(1, 2, 3, ncol(basecompet))], 
                                 TITULO = "Distribuição do total de medalhas por competidor")


plot(graficoColEmpil)

```

Mostrar o código e os _outputs_ pode ser útil mas e quando esse não é o caso? Os _chunks_ são muito flexíveis para serem discretos na medida necessária pelo autor. Vamos evitar o _print_ de um bloco de código nas linhas a seguir.

```{r, echo = FALSE, results = 'asis', message = FALSE, warning = FALSE}
## Criando outra funcao
fGrafBubble <- function(BASE, IDVAR, XVAR, YVAR, COLORVAR){ ##, SIZEVAR
  GraficoBolha <- gvisBubbleChart(BASE, 
                                  idvar = IDVAR, 
                                  xvar = XVAR, 
                                  yvar = YVAR,
                                  colorvar = COLORVAR, 
                                  ##sizevar = SIZEVAR,
                                  options = list(vAxes = "[{viewWindowMode:'explicit', 
                                          viewWindow:{min:65, max:250},
                                          }]",
                                          width = "900px", height = "400px"))
  
  return(GraficoBolha)
}
```

```{r, echo = FALSE, results = 'asis', message = FALSE, warning = FALSE}
## Acrescentando uma variavel à base
basecompet <- transform(basecompet, TotalMed = Ouro + Prata + Bronze)

## Chamando a funcao
graficoBubble <- fGrafBubble(BASE = basecompet, 
                             IDVAR = "id", 
                             XVAR = "TotalMed", 
                             YVAR = "pont", 
                             COLORVAR = "exp")


plot(graficoBubble)

```

O controle de todos os argumentos de um _chunk_ não é imediato, você provavelmente vai procurar a sintaxe específica para o seu problema enquanto estiver trabalhando no seu documento. A vantagem é que tudo é bem documentado como por exemplo o [RMarkdownReference][link_RMarkdownReference].

Obviamente, introduzir uma equação do Latex também é possível com a vantagem de que a sintaxe é exatamente igual ao mesmo.

\begin{equation}\label{fun1} 
F_{T}(t; \alpha, \beta) = P(T \leq t) = \Phi\left[\dfrac{1}{\alpha}\left(\sqrt{\frac{t}{\beta}}-\sqrt{\frac{\beta}{t}}\right)\right],\ t>0 \end{equation}

***

<!-- Sub-secao 03.03 -->
### Bibliografia e citações 

Em se tratando de referências e citações, em geral pouca dor de cabeça é coisa rara. No RMarkdown existem boas referências e uma delas chama a atenção: [Bibliografia e Citações][link_Bibliog].

No diretório onde está o seu script RMarkdown, deixe um arquivo em extensão .bib com as referências do seu trabalho. Claro, há outras extensões... Mas é bom lembrar que há uma fonte fácil de referências em sintaxe .bib: o Google Scholar. 

É importante notar que para ter uma seção de Referências adicionamos nas primeiras linhas do código essa informação com o respectivo nome do arquivo .bib. 

Além disso, a princípio, a sequência de referências vai constar depois da última linha de código, a qual equivale propositalmente à seção de Referências.

E que, assim como no Latex, um ícone bibliográfico aparece exclusivamente quando ele é referenciado. No meu script .bib existem três referências e eu vou referenciar apenas uma delas para que conste nesse arquivo,
como uma forma didática e explicativa como sempre sugerem os sábios @spGoogleMANUAL.


***

<!-- Secao 04 -->
# Mãos à Obra

<img src="maosaobra.png" alt="capacete" style="width: 150px; heigth: 150px; float: left;"/>

Fazendo jus ao título desse documento: é preciso começar!

Sugestão de Exercício: Temos uma página no github que é um tipo de identidade e a nossa voz. Cada um de nós agrega um valor muito específico em um grupo constituído exclusivamente de capital humano. 

Faça uma apresentação à sua maneira em um formato de postagem para blog (HTML). Inclua seus dados, preferências, linhas de pesquisa e, se quiser, adicione algo pessoal como uma foto, seus _hobbies_ e citações. Se todos concordarem, essas apresentações estarão na nossa página do github, ampliando nossa visibilidade individualmente e trazendo mais conhecimento sobre nós mesmos!

***

<!-- Secao 05 -->
# Trabalhos Futuros

Dominar especificidades e minúcias do uso do RMarkdown e de HTML.

***

<!-- Descriçao dos links -->
[link_Pandoc]: <http://pandoc.org/> "Pandoc"
[link_RMarkdown]: <http://rmarkdown.rstudio.com> "RMarkdown"
[link_RStudio]: <https://blog.rstudio.org/2014/06/18/r-markdown-v2/> "RStudio"
[link_RMarkdownReference]: <https://www.rstudio.com/wp-content/uploads/2015/03/rmarkdown-reference.pdf/> "RMarkdownReference"
[link_Bibliog]: <http://rmarkdown.rstudio.com/authoring_bibliographies_and_citations.html/> "Bibliografia"

# Referências




