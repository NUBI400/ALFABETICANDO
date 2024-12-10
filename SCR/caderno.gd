extends Node2D

# Modo de jogo: 0 = escolher letras de uma sílaba de uma palavra, 1 = escolher letras de sílabas aleatórias, 2 = escolher letras de palavras inteiras
var modo_jogo = 0

var primeira_vez = false
@onready var inicio: Node2D = $".."
@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"



@onready var nomes_creditos: ColorRect = $nomes_creditos


# Carregar a cena 'Letras'
var letras_scene = preload("res://TSCN/letra.tscn")

@onready var letras_container: VBoxContainer = $LetrasContainer
@onready var h_box_container_1: HBoxContainer = $LetrasContainer/HBoxContainer
@onready var h_box_container_2: HBoxContainer = $LetrasContainer/HBoxContainer2
@onready var h_box_container_4: HBoxContainer = $LetrasContainer/HBoxContainer4
@onready var h_box_container_5: HBoxContainer = $LetrasContainer/HBoxContainer5
@onready var h_box_container_6: HBoxContainer = $LetrasContainer/HBoxContainer6



@onready var palavra_label: Label = $PALAVRA
@onready var silaba_label: Label = $silaba


@onready var dicionario: ColorRect = $Dicionario

@onready var fundo_grande: Sprite2D = $fundo_grande
@onready var fundo_pequeno: Sprite2D = $fundo_pequeno



@onready var palavra_simbolos_hbox: HBoxContainer = $PALAVRA_SIMBOLOS


const ALFABETO_HIHIHA_1 = preload("res://TSCN/simbolos/alfabeto_hihiha_1.tscn")
const ALFABETO_HIHIHA_2 = preload("res://TSCN/simbolos/alfabeto_hihiha_2.tscn")
const ALFABETO_HIHIHA_3 = preload("res://TSCN/simbolos/alfabeto_hihiha_3.tscn")
const ALFABETO_HIHIHA_4 = preload("res://TSCN/simbolos/alfabeto_hihiha_4.tscn")
const ALFABETO_HIHIHA_5 = preload("res://TSCN/simbolos/alfabeto_hihiha_5.tscn")
const ALFABETO_HIHIHA_6 = preload("res://TSCN/simbolos/alfabeto_hihiha_6.tscn")
const ALFABETO_HIHIHA_7 = preload("res://TSCN/simbolos/alfabeto_hihiha_7.tscn")
const ALFABETO_HIHIHA_8 = preload("res://TSCN/simbolos/alfabeto_hihiha_8.tscn")
const ALFABETO_HIHIHA_9 = preload("res://TSCN/simbolos/alfabeto_hihiha_9.tscn")
const ALFABETO_HIHIHA_10 = preload("res://TSCN/simbolos/alfabeto_hihiha_10.tscn")
const ALFABETO_HIHIHA_11 = preload("res://TSCN/simbolos/alfabeto_hihiha_11.tscn")
const ALFABETO_HIHIHA_12 = preload("res://TSCN/simbolos/alfabeto_hihiha_12.tscn")
const ALFABETO_HIHIHA_13 = preload("res://TSCN/simbolos/alfabeto_hihiha_13.tscn")
const ALFABETO_HIHIHA_14 = preload("res://TSCN/simbolos/alfabeto_hihiha_14.tscn")
const ALFABETO_HIHIHA_15 = preload("res://TSCN/simbolos/alfabeto_hihiha_15.tscn")
const ALFABETO_HIHIHA_16 = preload("res://TSCN/simbolos/alfabeto_hihiha_16.tscn")


# Dicionário de palavras com suas respectivas sílabas
var dicionario_silabas = {
	"bola": ["bo", "la"],
	"gato": ["ga", "to"],
	"casa": ["ca", "sa"],
	"peixe": ["pei", "xe"],
	"flor": ["flor"],
	"árvore": ["ár", "vo", "re"],
	"sol": ["sol"],
	"carro": ["car", "ro"],
	"pato": ["pa", "to"],
	"pão": ["pão"],
	"uva": ["u", "va"],
	"sapato": ["sa", "pa", "to"],
	"lua": ["lu", "a"],
	"cama": ["ca", "ma"],
	"fogo": ["fo", "go"],
	"nuvem": ["nu", "vem"],
	"brinquedo": ["brin", "que", "do"],
	"abacaxi": ["a", "ba", "ca", "xi"],
	"galo": ["ga", "lo"],
	"livro": ["li", "vro"]
}

var dicionario_simbolos = {
	"a": "*",
	"b": "#",
	"c": "@",
	"d": "&",
	"e": "%",
	"f": "^",
	"g": "+",
	"h": "=",
	"i": "-",
	"j": "/",
	"k": "<",
	"l": ">",
	"m": "?",
	"n": "[",
	"o": "]",
	"p": "{",
	"q": "}",
	"r": "|",
	"s": ":",
	"t": ";",
	"u": ",",
	"v": ".",
	"x": "(",
	"y": ")",
	"z": "!",
	"á": "¡",
	"é": "€",
	"í": "™",
	"ó": "£",
	"ú": "¢",
	"â": "∞",
	"ê": "§",
	"ô": "¶"
}

var dicionario_simbolos_imagens = {
	"a": ALFABETO_HIHIHA_1,
	"b": ALFABETO_HIHIHA_2,
	"c": ALFABETO_HIHIHA_3,
	"d": ALFABETO_HIHIHA_4,
	"e": ALFABETO_HIHIHA_5,
	"f": ALFABETO_HIHIHA_6,
	"g": ALFABETO_HIHIHA_7,
	"h": ALFABETO_HIHIHA_8,
	"i": ALFABETO_HIHIHA_9,
	"j": ALFABETO_HIHIHA_10,
	"k": ALFABETO_HIHIHA_11,
	"l": ALFABETO_HIHIHA_12,
	"m": ALFABETO_HIHIHA_13,
	"n": ALFABETO_HIHIHA_14,
	"o": ALFABETO_HIHIHA_15,
	"u": ALFABETO_HIHIHA_16
}


var dicionario_palavras_simbolos = {
	"bola": ["bola"],
	"boca": ["boca"],
	"dado": ["dado"],
	"medo": ["medo"],
	"gelo": ["gelo"],
	"ilha": ["ilha"],
	"alce": ["alce"],
	"lua": ["lua"],
	"nome": ["nome"],
	"doce": ["doce"],
	"mole": ["mole"]
}



# Lista de palavras possíveis (as chaves do dicionário)
var lista_palavras = dicionario_silabas.keys()
var palavra = ""  # Palavra atual a ser formada
var silabas = []
var silaba_atual = 0
var letra_selecionada = 0
var combinacao_atual = ""  # String para armazenar a combinação correta selecionada
var silaba_corrente = ""  # Armazena a sílaba atual para o modo aleatório
var palavra_corrente = ""  # Armazena a palavra corrente para o modo 2

# Arrays de consoantes e vogais
var vogais = ["a", "e", "i", "o", "u", "á", "é", "í", "ó", "ú", "â", "ê", "ô"]
var consoantes = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "x", "z"]

# Número de letras aleatórias a serem instanciadas junto com as corretas
var num_letras_aleatorias = 6

# Armazena as últimas três palavras selecionadas
var ultimas_palavras = []

# Armazena as últimas quatro sílabas selecionadas
var ultimas_silabas = []


func _physics_process(delta: float) -> void:
	
	if Global.timer_acabou:
		Global.timer_acabou = false  # Resetar o timer
		animation_player.play("fade_off")
	
	
	if modo_jogo == 0:
		fundo_grande.visible = true
		fundo_pequeno.visible = true
		dicionario.visible = false
		silaba_label.visible = true
		nomes_creditos.visible = false
		
	elif modo_jogo == 1:
		fundo_grande.visible = true
		fundo_pequeno.visible = false
		dicionario.visible = false
		silaba_label.visible = true
		nomes_creditos.visible = false
		
	elif modo_jogo == 2:
		fundo_grande.visible = true
		fundo_pequeno.visible = false
		dicionario.visible = true
		silaba_label.visible = false
		nomes_creditos.visible = false
		
	elif modo_jogo == 3:
		fundo_grande.visible = false
		fundo_pequeno.visible = false
		dicionario.visible = false
		silaba_label.visible = false
		nomes_creditos.visible = true
	
	
# Função para escolher uma palavra aleatória, evitando as últimas três
func escolher_palavra_aleatoria() -> void:
	var palavras_disponiveis = lista_palavras.duplicate()  # Faz uma cópia da lista original

	# Remove as últimas três palavras da lista disponível
	for palavra_anterior in ultimas_palavras:
		palavras_disponiveis.erase(palavra_anterior)

	# Escolhe uma palavra aleatória da lista disponível
	palavra = palavras_disponiveis[randi() % palavras_disponiveis.size()]

	# Busca as sílabas da palavra selecionada no dicionário
	silabas = dicionario_silabas[palavra]

	# Armazena a palavra atual nas últimas palavras
	ultimas_palavras.append(palavra)
	if ultimas_palavras.size() > 3:
		ultimas_palavras.pop_front()  # Remove a palavra mais antiga se houver mais de três armazenadas

	# Exibir a primeira sílaba
	if silabas.size() > 0:
		silaba_atual = 0  # Resetar o índice da sílaba
		instanciar_letras(silabas[silaba_atual])

# Função para escolher uma sílaba aleatória sem uma palavra de base
func escolher_silaba_aleatoria() -> void:
	# Cria uma lista de todas as sílabas possíveis do dicionário, excluindo sílabas de uma letra só
	var todas_silabas = []
	for palavra_key in dicionario_silabas.keys():
		for silaba in dicionario_silabas[palavra_key]:
			if silaba.length() > 1:
				todas_silabas.append(silaba)

	# Remove as últimas quatro sílabas da lista disponível
	for silaba_anterior in ultimas_silabas:
		todas_silabas.erase(silaba_anterior)

	# Escolhe uma sílaba aleatória da lista filtrada
	silaba_corrente = todas_silabas[randi() % todas_silabas.size()]

	# Adiciona a sílaba corrente à lista das últimas sílabas selecionadas
	ultimas_silabas.append(silaba_corrente)
	if ultimas_silabas.size() > 4:
		ultimas_silabas.pop_front()  # Remove a sílaba mais antiga se houver mais de quatro armazenadas

	# Exibe a sílaba escolhida
	instanciar_letras(silaba_corrente)

# Função para escolher uma palavra aleatória para o modo 2, evitando as últimas três
func escolher_palavra_aleatoria_modo2() -> void:
	var palavras_disponiveis = dicionario_palavras_simbolos.keys().duplicate()  # Faz uma cópia da lista original

	# Remove as últimas três palavras da lista disponível
	for palavra_anterior in ultimas_palavras:
		palavras_disponiveis.erase(palavra_anterior)

	# Escolhe uma palavra aleatória da lista disponível
	palavra_corrente = palavras_disponiveis[randi() % palavras_disponiveis.size()]


	# Instancia as letras da palavra corrente
	instanciar_letras(palavra_corrente)

	# Armazena a palavra atual nas últimas palavras
	ultimas_palavras.append(palavra_corrente)
	if ultimas_palavras.size() > 3:
		ultimas_palavras.pop_front()  # Remove a palavra mais antiga se houver mais de três armazenadas


func instanciar_letras(palavra_ou_silaba: String) -> void:
	if primeira_vez == false:
		primeira_vez = true
	else:
		Global.pontos +=1
	
	
	print("Instanciando letras para:", palavra_ou_silaba)  # Debug
	if modo_jogo != 2:
		silaba_label.text = palavra_ou_silaba  # Sempre mostrar a sílaba

	# Mostrar a palavra somente no modo 0
	if modo_jogo == 0:
		palavra_label.text = palavra  # Use 'palavra' para o modo 0
	else:
		palavra_label.text = ""  # Limpar o texto da palavra nos outros modos

	# Limpar apenas os HBoxContainers
	clear_hbox_containers()

	letra_selecionada = 0  # Reiniciar a seleção de letras
	combinacao_atual = ""  # Reiniciar a combinação selecionada

	var letras_instantiate = []
	var letras_palavra_ou_silaba = []  # Lista para armazenar letras da palavra ou sílaba
	
	if modo_jogo == 2:
		for letra in palavra_ou_silaba:
			var imagem = dicionario_simbolos_imagens.get(letra, null)
			if imagem:
				var instancia_imagem = imagem.instantiate()  # Instancia a imagem correspondente
				palavra_simbolos_hbox.add_child(instancia_imagem)  # Adiciona a imagem ao HBox


	# Adicionar letras da palavra ou sílaba à lista
	for i in range(palavra_ou_silaba.length()):
		var letra_instance = letras_scene.instantiate() as Letras  # Instanciar a cena de letras
		letra_instance.letra = palavra_ou_silaba[i]  # Definir a letra no Node
		letra_instance.letra_selecionada.connect(_on_letra_selecionada, i)
		letras_instantiate.append(letra_instance)  # Adicionar à lista temporária
		letras_palavra_ou_silaba.append(palavra_ou_silaba[i])  # Adicionar a letra à lista

	# Adicionar letras aleatórias à lista, evitando repetições das letras da palavra ou sílaba
	for i in range(num_letras_aleatorias):
		var letra_aleatoria = gerar_letra_aleatoria()
		while letra_aleatoria in letras_palavra_ou_silaba:
			letra_aleatoria = gerar_letra_aleatoria()  # Gerar uma nova letra se a letra aleatória for uma das da palavra ou sílaba
		var letra_instance = letras_scene.instantiate() as Letras
		letra_instance.letra = letra_aleatoria
		letra_instance.letra_selecionada.connect(_on_letra_selecionada, i)  # -1 para não confundir com as letras corretas
		letras_instantiate.append(letra_instance)  # Adicionar à lista temporária

	# Embaralhar a lista de letras
	letras_instantiate.shuffle()

	# Adicionar as letras embaralhadas ao container
	add_letras_to_hbox(letras_instantiate)

# Função para limpar apenas os HBoxContainers
func clear_hbox_containers() -> void:
	
	
	
	for child in letras_container.get_children():
		if child is HBoxContainer:
			for grandchild in child.get_children():
				grandchild.queue_free()
				
	for child in palavra_simbolos_hbox.get_children():
		if child is TextureRect:
			child.queue_free()


# Função para adicionar letras aos HBoxContainers
func add_letras_to_hbox(letras: Array) -> void:
	var hbox_index = 0
	var letras_per_hbox = 3
	var current_hbox = get_hbox_container(hbox_index)

	for i in range(letras.size()):
		if i > 0 and i % letras_per_hbox == 0:
			hbox_index += 1
			current_hbox = get_hbox_container(hbox_index)
		current_hbox.add_child(letras[i])

# Função para obter o HBoxContainer correto com base no índice
func get_hbox_container(index: int) -> HBoxContainer:
	match index:
		0: return h_box_container_1
		1: return h_box_container_2
		2: return h_box_container_4
		3: return h_box_container_5
		4: return h_box_container_6
		_:
			print("Índice de HBoxContainer fora do alcance:", index)
			return null

# Função para gerar uma letra aleatória (consoante ou vogal)
func gerar_letra_aleatoria() -> String:
	var todas_letras = consoantes + vogais
	return todas_letras[randi() % todas_letras.size()]

func _on_letra_selecionada(letra: String) -> void:
	if modo_jogo == 0:
		# Lógica do modo de jogo 0: escolher letras da sílaba de uma palavra
		if letra == silabas[silaba_atual][letra_selecionada]:
			letra_selecionada += 1
			combinacao_atual += letra  # Adicionar letra à combinação atual
			print("Combinação atual:", combinacao_atual)  # Imprimir a combinação atual

			# Iterar sobre todos os HBoxContainers e seus filhos
			for hbox in letras_container.get_children():
				if hbox is HBoxContainer:
					for child in hbox.get_children():
						if child is Letras and child.letra == letra:
							child.set_modulate(Color(0.529412, 0.807843, 0.980392, 1))  # Deixa a letra vermelha
							break  # Para após encontrar a letra correta

			if letra_selecionada >= silabas[silaba_atual].length():
				silaba_atual += 1
				if silaba_atual < silabas.size():
					print("Próxima sílaba:", silabas[silaba_atual])  # Debug
					instanciar_letras(silabas[silaba_atual])  # Mostrar a próxima sílaba
					combinacao_atual = ""  # Reiniciar a combinação ao mudar de sílaba
				else:
					print("Palavra completa! Combinação correta:", palavra)  # Imprimir a palavra completa
					escolher_palavra_aleatoria()  # Escolher nova palavra
		else:
			print(combinacao_atual)
			letra_selecionada = 0
			combinacao_atual = ""  # Reiniciar a combinação em caso de erro
			# Iterar sobre todos os HBoxContainers e seus filhos
			for hbox in letras_container.get_children():
				if hbox is HBoxContainer:
					for child in hbox.get_children():
						if child is Letras:
							child.set_modulate(Color(1, 1, 1))  # Muda a cor de volta para branco

	elif modo_jogo == 1:
		# Lógica do modo de jogo 1: escolher letras de sílabas aleatórias
		if letra == silaba_corrente[letra_selecionada]:
			letra_selecionada += 1
			combinacao_atual += letra  # Adicionar letra à combinação atual
			print("Combinação atual:", combinacao_atual)  # Imprimir a combinação atual

			# Iterar sobre todos os HBoxContainers e seus filhos
			for hbox in letras_container.get_children():
				if hbox is HBoxContainer:
					for child in hbox.get_children():
						if child is Letras and child.letra == letra:
							child.set_modulate(Color(0.529412, 0.807843, 0.980392, 1))  # Deixa a letra vermelha
							break  # Para após encontrar a letra correta

			if letra_selecionada >= silaba_corrente.length():
				print("Sílaba completa:", silaba_corrente)  # Debug
				escolher_silaba_aleatoria()  # Escolher nova sílaba aleatória
				combinacao_atual = ""  # Reiniciar a combinação ao mudar de sílaba
		else:
			print("Letra incorreta:", letra)
			letra_selecionada = 0
			combinacao_atual = ""  # Reiniciar a combinação em caso de erro
			# Iterar sobre todos os HBoxContainers e seus filhos
			for hbox in letras_container.get_children():
				if hbox is HBoxContainer:
					for child in hbox.get_children():
						if child is Letras:
							child.set_modulate(Color(1, 1, 1))  # Muda a cor de volta para branco

	elif modo_jogo == 2:
		# Lógica do modo de jogo 2: escolher letras de palavras inteiras
		if letra == palavra_corrente[letra_selecionada]:
			letra_selecionada += 1
			combinacao_atual += letra  # Adicionar letra à combinação atual
			print("Combinação atual:", combinacao_atual)  # Imprimir a combinação atual

			# Iterar sobre todos os HBoxContainers e seus filhos
			for hbox in letras_container.get_children():
				if hbox is HBoxContainer:
					for child in hbox.get_children():
						if child is Letras and child.letra == letra:
							child.set_modulate(Color(0.529412, 0.807843, 0.980392, 1))  # Deixa a letra vermelha
							break  # Para após encontrar a letra correta

			if letra_selecionada >= palavra_corrente.length():
				print("Palavra completa:", palavra_corrente)  # Debug
				escolher_palavra_aleatoria_modo2()  # Escolher nova palavra
				combinacao_atual = ""  # Reiniciar a combinação ao mudar de palavra
		else:
			print("Letra incorreta:", letra)
			letra_selecionada = 0
			combinacao_atual = ""  # Reiniciar a combinação em caso de erro
			# Iterar sobre todos os HBoxContainers e seus filhos
			for hbox in letras_container.get_children():
				if hbox is HBoxContainer:
					for child in hbox.get_children():
						if child is Letras:
							child.set_modulate(Color(1, 1, 1))  # Muda a cor de volta para branco

# Função para remover todas as letras do container
func queue_free_children(node: Node) -> void:
	for child in node.get_children():
		child.queue_free()


func _folha_animation_finished(anim_name: StringName) -> void:


	if anim_name == "fade_off":
		clear_hbox_containers()
		if modo_jogo == 3:
			modo_jogo = -1
		
		if modo_jogo < 2:
			primeira_vez = false
			modo_jogo += 1  # Aumentar o modo de jogo'

		else:
			modo_jogo = 3
			Global.pontos = 0





func _on_animation_player_current_animation_changed(name: String) -> void:
	if name == "fade_on":
		if modo_jogo == 0:
			Global.time_left = 30
			escolher_palavra_aleatoria()

		elif modo_jogo == 1:
			Global.time_left = 30
			escolher_silaba_aleatoria()
		elif modo_jogo == 2:
			Global.time_left = 60
			escolher_palavra_aleatoria_modo2()
		
		elif modo_jogo == 3:
			Global.creditos = true
			Global.timer = false
		
