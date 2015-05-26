#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(void){
	
	int nivel, num, ajuda, iPerg, iResp;
	int resp, alt;

	nivel = ajuda = 1;

	char *perguntas1[] = {
		"Pergunta 1?", " 1) Alternativa;", " 2) Alternativa;", " 3) Alternativa;", " 4) Alternativa;",
		"Pergunta 2?", " 1) Alternativa;", " 2) Alternativa;", " 3) Alternativa;", " 4) Alternativa;",
		"Pergunta 3?", " 1) Alternativa;", " 2) Alternativa;", " 3) Alternativa;", " 4) Alternativa;",
		"Pergunta 4?", " 1) Alternativa;", " 2) Alternativa;", " 3) Alternativa;", " 4) Alternativa;",
		NULL
	};

	char *perguntas2[] = {
		"Pergunta 1?", " 1) Alternativa;", " 2) Alternativa;", " 3) Alternativa;", " 4) Alternativa;",
		"Pergunta 2?", " 1) Alternativa;", " 2) Alternativa;", " 3) Alternativa;", " 4) Alternativa;",
		"Pergunta 3?", " 1) Alternativa;", " 2) Alternativa;", " 3) Alternativa;", " 4) Alternativa;",
		"Pergunta 4?", " 1) Alternativa;", " 2) Alternativa;", " 3) Alternativa;", " 4) Alternativa;",
		NULL
	};

	char *perguntas3[] = {
		"Pergunta 1?", " 1) Alternativa;", " 2) Alternativa;", " 3) Alternativa;", " 4) Alternativa;",
		"Pergunta 2?", " 1) Alternativa;", " 2) Alternativa;", " 3) Alternativa;", " 4) Alternativa;",
		"Pergunta 3?", " 1) Alternativa;", " 2) Alternativa;", " 3) Alternativa;", " 4) Alternativa;",
		"Pergunta 4?", " 1) Alternativa;", " 2) Alternativa;", " 3) Alternativa;", " 4) Alternativa;",
		NULL
	};	

	int respostas[] = { 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4 };

	printf(">>>>> Bem vindo ao Assembler Quiz <<<<<\n\n");
	printf(">> Você terá apenas uma ajuda durante o jogo e 30 segundos para responder cada pergunta \n");
	printf("Você está no NIVEL 1\n");

	srand(time(NULL));

	/* NIVEL 1 */
	num = rand()%4;

	iPerg = num*5;
	iResp = nivel*4 + num;

	printf("%s\n", perguntas1[iPerg]);
	printf("%s\n", perguntas1[iPerg+1]);
	printf("%s\n", perguntas1[iPerg+2]);
	printf("%s\n", perguntas1[iPerg+3]);
	printf("%s\n", perguntas1[iPerg+4]);

	if(ajuda == 1){
		printf("Deseja utilizar sua ajuda (Não: 0)?\n");
		scanf("%i", &resp);
		if(resp != 0){
			alt = rand()%4;
			while(alt == respostas[iResp]){
				alt = rand()%4;
			}
			printf("A alternativa %i está errada!\n", alt);
			ajuda--;
		}
	}

	printf("Qual sua resposta? \n");
	scanf("%i", &resp);

	if(resp == respostas[iResp] && nivel == 1){
		printf("Resposta certa!\n Você passou para o NIVEL 2");
		nivel++;
	}else{
		goto PERDEU;
	}


	/* NIVEL 2 */
	num = rand()%4;

	iPerg = num*5;
	iResp = nivel*4 + num;

	printf("%s\n", perguntas2[iPerg]);
	printf("%s\n", perguntas2[iPerg+1]);
	printf("%s\n", perguntas2[iPerg+2]);
	printf("%s\n", perguntas2[iPerg+3]);
	printf("%s\n", perguntas2[iPerg+4]);	

	if(ajuda == 1){
		printf("Deseja utilizar sua ajuda (Não: 0)?\n");
		scanf("%i", &resp);
		if(resp != 0){
			alt = rand()%4;
			while(alt == respostas[iResp]){
				alt = rand()%4;
			}
			printf("A alternativa %i está errada!\n", alt);
			ajuda--;
		}
	}

	printf("Qual sua resposta? \n");
	scanf("%i", &resp);

	if(resp == respostas[iResp] && nivel == 2){
		printf("Resposta certa! Você passou para o NILVE 3\n");
		nivel++;
	}else{
		goto PERDEU;
	}
	

	/* NIVEL 3 */
	num = rand()%4;

	iPerg = num*5;
	iResp = nivel*4 + num;

	printf("%s\n", perguntas3[iPerg]);
	printf("%s\n", perguntas3[iPerg+1]);
	printf("%s\n", perguntas3[iPerg+2]);
	printf("%s\n", perguntas3[iPerg+3]);
	printf("%s\n", perguntas3[iPerg+4]);	

	if(ajuda == 1){
		printf("Deseja utilizar sua ajuda (Não: 0)?\n");
		scanf("%i", &resp);
		if(resp != 0){
			alt = rand()%4;
			while(alt == respostas[iResp]){
				alt = rand()%4;
			}
			printf("A alternativa %i está errada!\n", alt);
			ajuda--;
		}
	}

	printf("Qual sua resposta? \n");
	scanf("%i", &resp);

	if(resp == respostas[iResp] && nivel == 3){
		printf("Resposta certa!\n");
		printf("PARABÉNS! Você venceu o Assembler Quiz\n");
		return 0;		
	}else{
		goto PERDEU;
	}

	PERDEU:
		printf("Resposta errada! Você perdeu.\n");
		return 0;
}
