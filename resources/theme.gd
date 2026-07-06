extends Resource
class_name QuizzThemeComunismo

@export var questions: Array = []

func _init() -> void:
	questions = [
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
