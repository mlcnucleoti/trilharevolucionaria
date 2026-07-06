extends Resource
class_name QuizzQuestion

#A resposta correta já vem como índice e não uma String
@export var question_text: String
@export var question_image: Texture2D
@export var question_audio: AudioStream
@export var options: Array[String]
@export var correct_index: int
