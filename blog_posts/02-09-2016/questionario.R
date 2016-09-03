require(shiny)
require(stringr)

questionario <- function(){
  
  bancoLogin <<- data.frame("Login" = "douglasmesquita", "Senha" = "Stats4Good!", stringsAsFactors = F)
  
  shinyApp(
    ui = shinyUI(fluidPage(
      
      tags$head(tags$style("#text1{color: red;
                                 font-size: 20px;
                                 font-style: italic;
                                 }"
                         )
              ),
      
      navbarPage("Você considera o R uma ferramenta poderosa?", 
                 fluidRow(
                   
                   column(8,   
                          conditionalPanel(
                            condition = "(!input.flaglogin & !output.mensagemOk) | (input.logar & !output.mensagemOk)",
                            h3(strong("Faça o seu login")),
                            textInput(inputId = "login",
                                      label = "Insira seu login",
                                      placeholder = "No máximo 15 caracteres"),
                            textInput(inputId = "senha", 
                                      label = "Insira sua senha",
                                      placeholder = "No máximo 12 caracteres"),
                            column(4,
                                   actionButton("flaglogin", label = "Não possuo um login")
                            ),
                            column(3,
                                   actionButton(inputId = "entrar", label = "Entrar")
                            )
                          ),
                          
                          conditionalPanel(
                            condition = "input.flaglogin & !input.logar" ,
                            h3(strong("Defina um nome de usuário e senha")),
                            textInput(inputId = "novoLogin", 
                                      label = "Crie um login",
                                      placeholder = "No máximo 12 caracteres"),
                            textInput(inputId = "novaSenha", 
                                      label = "Crie uma senha",
                                      placeholder = "No máximo 8 caracteres"),
                            column(width = 2,
                                   actionButton("criar", label = "Criar")
                            ),
                            conditionalPanel(
                              condition = "output.novologinOk",
                              actionButton("logar", label = "Clique para fazer o login")
                            )
                          ),
                          
                          conditionalPanel(
                            condition = "output.mensagemOk",
                            h3(strong("Conte-nos sobre você")),
                            textInput(inputId = "nome", 
                                      label = "Qual o seu nome?",
                                      placeholder = "Digite o seu nome"),
                            textInput(inputId = "sexo", 
                                      label = "Qual o seu sexo?",
                                      placeholder = "Masculino ou feminino"),
                            textInput(inputId = "idade", 
                                      label = "Qual a sua idade?",
                                      placeholder = "Digite a sua idade"),
                            textInput(inputId = "cpf", 
                                      label = "Qual o seu cpf?",
                                      placeholder = "Use apenas números"),
                            textInput(inputId = "cep", 
                                      label = "Qual o seu CEP?",
                                      placeholder = "Utilize pontos e hífens"),
                            textInput(inputId = "telefone", 
                                      label = "Qual o seu telefone?",
                                      placeholder = "Não esqueça do DDD"),
                            textInput(inputId = "email", 
                                      label = "Qual o seu e-mail?",
                                      placeholder = "Digite o seu e-mail"),
                            textInput(inputId = "rpoder", 
                                      label = "Você considera o R uma ferramenta poderosa?",
                                      placeholder = "Sim ou Não"),
                            actionButton("verificar", label = "Verificar respostas e enviar")
                          )
                          
                   ),
                   column(4,
                          textOutput(outputId = "mensagemNaoOk"),
                          textOutput(outputId = "novologinNaoOk"),
                          textOutput(outputId = "novologinOk"),
                          textOutput(outputId = "mensagemOk"),
                          conditionalPanel(
                             condition = "output.mensagemOk",
                             textOutput(outputId = "nomeOk"),
                             textOutput(outputId = "sexoOk"),
                             textOutput(outputId = "idadeOk"),
                             textOutput(outputId = "cpfOk"),
                             textOutput(outputId = "cepOk"),
                             textOutput(outputId = "telefoneOk"),
                             textOutput(outputId = "emailOk"),
                             textOutput(outputId = "rpoderOk")
                          ),
                          conditionalPanel(
                            condition = "input.verificar",
                            textOutput(outputId = "agradecimento")
                          )
                   )
                 )
      )
    )
    ),
    
    server = function(input, output, session){
      
      login <- reactive({
        login <- input$login
        senha <- input$senha
        
        if(login != "" & senha != ""){
          loginValido <- any(str_detect(string = bancoLogin$Login, pattern = str_c("^", login, "$")))
          senhaValida <- any(str_detect(string = bancoLogin$Senha, pattern = str_c("^", senha, "$")))
        } else{
          loginValido <- FALSE
          senhaValida <- FALSE
        }
        
        return(list(loginValido = loginValido, senhaValida = senhaValida))
      })
      
      loginValido <- eventReactive(input$entrar,{
        
        loginsenha <- login()
        loginValido <- loginsenha$loginValido
        senhaValida <- loginsenha$senhaValida
        
        if(loginValido & senhaValida){
          mensagem <- paste("Bem vindo", input$login)
          ok <- TRUE
        } else{
          mensagem <- paste("Confira seus dados!")
          ok <- FALSE
        }
        
        return(list(mensagem = mensagem, ok = ok))
      })
      
      output$mensagemNaoOk <- renderText({
        loginValido <- loginValido()
        mensagem <- loginValido$mensagem
        if(!loginValido$ok){
          mensagem
        } else{
          NULL
        }
      })
      
      output$mensagemOk <- renderText({
        loginValido <- loginValido()
        mensagem <- loginValido$mensagem
        if(loginValido$ok){
          mensagem 
        } else{
          NULL
        }
      })
      
      novologin <- eventReactive(input$criar,{
        novoLogin <- input$novoLogin
        novaSenha <- input$novaSenha
        
        novoLoginPadrao <- str_detect(string = novoLogin, pattern = "^[a-zA-Z0-9]{1,15}$")
        
        if(novoLoginPadrao){
          novoLoginNchar <- ifelse(str_count(novoLogin) < 15, TRUE, FALSE)
        } else{
          novoLoginNchar <- FALSE
        }
        
        novaSenhaPadrao <- str_detect(string = novaSenha, pattern = "[a-zA-Z]")
        novaSenhaPadrao[2] <- str_detect(string = novaSenha, pattern = "[0-9]")
        novaSenhaPadrao[3] <- str_detect(string = novaSenha, pattern = "[:punct:]")
        novaSenhaNchar <- ifelse(str_count(novaSenha) < 12, TRUE, FALSE)
        
        novoLoginOk <- ifelse(novoLoginPadrao & novoLoginNchar, TRUE, FALSE)
        novaSenhaOk <- all(novaSenhaPadrao, novaSenhaNchar)
        novo <- all(novoLoginOk, novaSenhaOk)
        
        if(novo){
          n <- nrow(bancoLogin)
          bancoLogin[n+1, ] <<- c(novoLogin, novaSenha)
        }
        
        return(novo = novo)
      })
      
      output$novologinNaoOk <- renderText({
        novologinValido <- novologin()
        
        if(!novologinValido){
          "Confira seus dados pois esta não é uma configuração válida!"
        } else{
          NULL
        }
      })
      
      output$novologinOk <- renderText({
        novologinValido <- novologin()
        
        if(novologinValido){
          "Login criado com sucesso"
        } else
          NULL
      })
      
      output$nomeOk <-renderText({
        nome <- input$nome
        nomeOk <- str_detect(string = nome, pattern = "(^(?i)[a-z\\s]{1,50}$)|^$")
        
        if(!nomeOk){
          "Seu nome deve conter apenas letras"
        }
        
      })
      
      output$idadeOk <-renderText({
        idade <- input$idade
        idadeOk <- str_detect(string = idade, pattern = "(^[0-9]{1,3}$)|^$")
        
        if(!idadeOk){
          "Sua idade deve conter apenas números"
        }
        
      })
      
      output$sexoOk <-renderText({
        sexo <- input$sexo
        sexoOk <- str_detect(string = sexo, pattern = "(?i)(masculino|feminino)|^$")
        
        if(!sexoOk){
          "Seu sexo deve ser 'Masculino' ou 'Feminino'"
        }
        
      })
      
      output$cpfOk <-renderText({
        cpf <- input$cpf
        cpfOk <- str_detect(string = cpf, pattern = "^([0-9]{3}\\.[0-9]{3}\\.[0-9]{3}\\-[0-9]{2})$|^$")
        
        if(!cpfOk){
          "Seu CPF deve estar no formato 000.000.000-00"
        }
        
      })
      
      output$cepOk <-renderText({
        cep <- input$cep
        cepOk <- str_detect(string = cep, pattern = "^([0-9]{2}\\.[0-9]{3}\\.-[0-9]{3})$|^$")
        
        if(!cepOk){
          "Seu CEP deve estar no formato 00.000-000"
        }
        
      })
      
      output$telefoneOk <-renderText({
        telefone <- input$telefone
        telefoneOk <- str_detect(string = telefone, pattern = "^(\\([0-9]{2}\\)\\s[0-9]{4,5}-[0-9]{4})$|^$")
        
        if(!telefoneOk){
          "Seu telefone deve estar no formato (00) 0000-0000"
        }
        
      })
      
      output$emailOk <-renderText({
        email <- input$email
        emailOk <- str_detect(string = email, pattern = "^(?i)([a-z0-9]{1,20}@[a-z]{2,20}\\.[a-z0-9]{1,10}(\\.[a-z0-9]{1,10})?)$|^$")
        
        if(!emailOk){
          "Seu email deve estar no formato cara10@algumacoisa.sla.sla2"
        }
        
      })
      
      output$rpoderOk <-renderText({
        rpoder <- input$rpoder
        rpoderOk <- str_detect(string = rpoder, pattern = "(?i)^(Sim|s)$|^$")
        
        if(!rpoderOk){
          "A única resposta possível para este campo é Sim!!"
        }
        
      })
      
      agradecimento <- eventReactive(input$verificar,{
        
        mensagem <- "Muito obrigado!!"
        
        return(mensagem)
      })
      
      output$agradecimento <-renderText({
        agradecimento <- agradecimento()
        
        agradecimento
      })
       
    }
  )
}

questionario()