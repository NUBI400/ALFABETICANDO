extends HBoxContainer


# Função auxiliar para limpar todos os filhos de um node
func queue_free_children():
	for child in get_children():
		child.queue_free()
