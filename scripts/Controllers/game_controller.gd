extends Control
class_name GameController

var buttons: Array[Button] = []
var current_index: int = 0
var score: int = 0
var correct_index: int = -1
var is_answering: bool = false

@export var quiz_theme: QuizzTheme
@export var color_correct: Color = Color.GREEN
@export var color_wrong: Color = Color.RED

@onready var question_label: Label = %QuestionLabel
@onready var question_image: TextureRect = %QuestionImage
@onready var question_audio: AudioStreamPlayer = %QuestionAudio
@onready var progress_bar: ProgressBar = %ProgressBar
@onready var result_panel: Panel = %ResultPanel
@onready var result_label: Label = %ResultLabel

func _ready() -> void:
	print("=== INICIANDO QUIZ ===")
	
	# Resetar barra
	progress_bar.min_value = 0
	progress_bar.max_value = 100
	progress_bar.value = 0
	
	# Carregar botões
	for button in %QuestionHolder.get_children():
		if button is Button:
			buttons.append(button)
	
	for i in buttons.size():
		buttons[i].pressed.connect(_on_button_pressed.bind(i))
	
	# ✅ VERIFICAR SE O TEMA EXISTE E CRIAR SE NECESSÁRIO
	if not quiz_theme:
		print("⚠️ Nenhum tema atribuído! Criando tema padrão...")
		quiz_theme = QuizzTheme.new()
		quiz_theme.questions = criar_perguntas_padrao()
	
	if quiz_theme.questions.is_empty():
		push_error("Nenhuma pergunta carregada!")
		return
	
	current_index = 0
	load_question()

# ✅ FUNÇÃO PARA CRIAR PERGUNTAS PADRÃO
func criar_perguntas_padrao() -> Array:
	return [
		{
			"question_text": "O que é o comunismo?",
			"options": [
				"Um sistema econômico onde os meios de produção são de propriedade privada",
				"Um sistema político e econômico que busca a propriedade coletiva e a eliminação das classes sociais",
				"Um sistema onde apenas o governo possui empresas",
				"Uma forma de democracia direta"
			],
			"correct_index": 1,
			"question_image": null,
			"question_audio": null
		},
		{
			"question_text": "Quem foi o principal autor do 'Manifesto Comunista'?",
			"options": [
				"Vladimir Lenin",
				"Joseph Stalin",
				"Karl Marx e Friedrich Engels",
				"Leon Trotsky"
			],
			"correct_index": 2,
			"question_image": null,
			"question_audio": null
		},
		{
			"question_text": "Qual foi o primeiro país a se tornar oficialmente comunista?",
			"options": [
				"China",
				"Cuba",
				"União Soviética (Rússia)",
				"Vietnã"
			],
			"correct_index": 2,
			"question_image": null,
			"question_audio": null
		},
		{
			"question_text": "Qual é um dos principais objetivos do comunismo?",
			"options": [
				"Criar uma sociedade sem classes sociais",
				"Aumentar os lucros das grandes empresas",
				"Estabelecer uma monarquia absoluta",
				"Privatizar todos os serviços públicos"
			],
			"correct_index": 0,
			"question_image": null,
			"question_audio": null
		},
		{
			"question_text": "O que significa 'ditadura do proletariado' no pensamento comunista?",
			"options": [
				"Um governo militar autoritário",
				"O domínio político da classe trabalhadora sobre a burguesia",
				"Um sistema onde os operários não têm direitos",
				"Uma forma de governo fascista"
			],
			"correct_index": 1,
			"question_image": null,
			"question_audio": null
		}
	]

func load_question() -> void:
	if quiz_theme and current_index < quiz_theme.questions.size():
		var current_question = quiz_theme.questions[current_index]
		
		print("\n=== CARREGANDO PERGUNTA ", current_index + 1, " ===")
		
		# Texto
		question_label.text = current_question.question_text
		
		# Imagem
		if current_question.question_image:
			question_image.texture = current_question.question_image
			question_image.visible = true
		else:
			question_image.visible = false
		
		# Áudio
		if current_question.question_audio:
			question_audio.stream = current_question.question_audio
			question_audio.play()
		
		# Opções
		for i in buttons.size():
			if i < current_question.options.size():
				buttons[i].text = current_question.options[i]
				buttons[i].visible = true
				buttons[i].disabled = false
				buttons[i].modulate = Color.WHITE
			else:
				buttons[i].visible = false
		
		correct_index = current_question.correct_index
	else:
		finish_quiz()

func _on_button_pressed(button_index: int) -> void:
	if is_answering:
		return
	
	is_answering = true
	var selected_button = buttons[button_index]
	
	if button_index == correct_index:
		print("✅ CORRETO!")
		selected_button.modulate = color_correct
		score += 1
	else:
		print("❌ ERRADO!")
		selected_button.modulate = color_wrong
		if correct_index >= 0:
			buttons[correct_index].modulate = color_correct
	
	for button in buttons:
		button.disabled = true
	
	# ✅ VERIFICAR SE quiz_theme NÃO É NULL ANTES DE ACESSAR
	if quiz_theme:
		var total = quiz_theme.questions.size()
		var respondidas = current_index + 1
		var progresso_float = float(respondidas) / float(total)
		var progresso_percent = progresso_float * 100.0
		
		progress_bar.max_value = 100.0
		progress_bar.value = progresso_percent
		
		print("Progresso: ", progresso_percent, "% (", respondidas, "/", total, " respondidas)")
	
	await get_tree().create_timer(1.5).timeout
	is_answering = false
	current_index += 1
	load_question()

func finish_quiz() -> void:
	print("\n=== FIM DO QUIZ ===")
	
	# ✅ GARANTIR 100% NO FINAL
	progress_bar.max_value = 100.0
	progress_bar.value = 100.0
	
	result_panel.visible = true
	
	if quiz_theme:
		result_label.text = "Você acertou %d de %d perguntas!" % [
			score,
			quiz_theme.questions.size()
		]
	else:
		result_label.text = "Você acertou %d perguntas!" % score
