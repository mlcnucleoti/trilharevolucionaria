# trilharevolucionaria

==============================================================================================================================================================================================================
                                                                                        OVERVIEW
==============================================================================================================================================================================================================

"Trilha Revolucionária" é um jogo de quizz competitivo e colaborativo para círculos de estudo, sindicatos e movimentos sociais. Diferente de um teste comum, é uma ferramenta de formação política: cada erro vira aprendizado sobre mais-valia, luta de classes e materialismo histórico.

Ambientação: O jogador controla um personagem da classe trabalhadora (operário, camponês, professor precário ou trabalhador de aplicativo). A pontuação é medida em "Consciência de Classe".

Os Corretores: A cada resposta, quatro personagens históricos comentam o desempenho.

- Rosa (inspirada em Rosa Luxemburgo) – calorosa e incentivadora. Fala: "Excelente, camarada! A teoria é a bússola da revolução!" 
- Karl (inspirado em Marx) – direto e rigoroso. Fala: "Correto. O materialismo não mente." 
- Vladi (inspirado em Lênin) – prático e estratégico. Fala: "Boa leitura de conjuntura!" 
- Olga (Inspirada em Olga Benário) - aguerrida e inspiradora. Acerto: 

Rodadas:

- "O Chão da Fábrica" – Perguntas objetivas sobre conceitos básicos (ex: mais-valia). Tempo: 15 segundos.
- "A Dialética em Ação" – Análise de conjuntura. O jogador interpreta uma notícia e escolhe a leitura marxista correta. Tempo: 30 segundos.
- "A Práxis" – Cenários de conflito. O jogador escolhe estratégias baseadas em teóricos revolucionários. Tempo: 45 segundos.

Sistema de Correção Progressiva: Se errar, o jogador ganha automaticamente uma explicação de texto com o personagem correspondente ao tema. 

Eventos Aleatórios: podem ocorrer a qualquer momento no jogo para dar mais dinamismo.
- Greve Geral – o jogagor ganha um bônus de consciência, mas a próxima resposta um erro pode tirar 20 pontos.
- Revisionismo – pergunta-pegadinha; se cair, perde 2 turnos e Karl faz uma correção irônica.

Vitória: Ao final, o jogador recebe um diagnóstico: "Iniciante", "Leitor" ou "Revolucionário". Sempre com uma indicação de filiação a UP no final das rodadas
==============================================================================================================================================================================================================
 ADICIONANDO NOVAS PERGUNTAS
==============================================================================================================================================================================================================
Passo 1: Criar o recurso QuizzTheme
No painel FileSystem, clique com botão direito

Selecione New Resource...

Procure por QuizzTheme

Nomeie como MeuQuiz.tres

Clique em Create

Passo 2: Editar o QuizzTheme
Selecione o arquivo MeuQuiz.tres

No Inspector, expanda a propriedade Questions

Clique em Add Element para cada pergunta

Preencha os campos de cada pergunta:

text
Question Text: "Qual é a fórmula da água?"
Options: ["H2O", "CO2", "NaCl", "O2"]
Correct Index: 0
Question Image: [opcional]
Question Audio: [opcional]
Passo 3: Atribuir ao GameController
Selecione o nó GameController na cena

No Inspector, localize Quiz Theme

Arraste o arquivo MeuQuiz.tres para este campo
