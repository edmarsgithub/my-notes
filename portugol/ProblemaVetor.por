
/* Função do algoritmo:
 *  Ler valores de 4 notas que serão informadas pelo usuário e calcular a média ao final
 *  Autor: Edmar Santos
 */ 
programa
{
		
	funcao inicio(){
		real media = 0.0
		real soma = 0.0
		cadeia nome
		real nota[4]

		escreva("Digite o nome do aluno: ")
		leia(nome)

		//aqui é usado uma variável 'n' para controle da repetição da leitura de 4 notas
		para(inteiro n = 0 ; n < 4; n++){
			//aqui 'n' é usado para mostrar o número da iteração e qual nota deverá ser digitado
			escreva("Digite a nota " + (n+1) + "\n")
			//aqui é atribuído o valor da nota digitada no vetor 'nota[]' na posição 'n'
			leia(nota[n])
			//aqui é feita a soma acumulativa das notas digitadas.
			soma = soma + nota[n]
		}

		//aqui basta dividir 'soma' por 4 para obter o valor da média
		media = soma / 4

		escreva("A média é: "+media)
	}	
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 856; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */