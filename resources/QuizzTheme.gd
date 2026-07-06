# QuizzTheme.gd
extends Resource
class_name QuizzTheme

@export var questions: Array = []

func _init(p_questions: Array = []) -> void:
	questions = p_questions
