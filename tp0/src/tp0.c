/*
 ============================================================================
 Name        : tp0.c
 Author      : grupo orga 66.20
 Version     : 1.1
 Copyright   : Orga6620
 Description : Trabajo practico 0: Infraestructura basica
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define VERSION "1.1"

#define TRUE 0
#define FALSE 1


enum ParameterState {
	 OKEY = 0, INCORRECT_QUANTITY_PARAMS = 1, INCORRECT_MENU = 2, ERROR_FILE = 3, ERROR_MEMORY = 4
};

char * toLowerCase(char * word, int quantityCharacterInWord) {
	char * wordLowerCase = (char *) malloc(quantityCharacterInWord);
	if (wordLowerCase){

		int i;
		for (i = 0; i < quantityCharacterInWord; i++) {
			/* ASCII:
			 * 		A - Z = [65 - 90]
			 * 		a - z = [97 - 122]
			 * 		0 - 9 = [48 - 57]
			 * 		- =  45
			 * 		_ = 95
			 */
			char character =  word[i];
			if (character >= 65 && character <= 90) {
				character += 32;
			}

			wordLowerCase[i] = character;
		}

		wordLowerCase[quantityCharacterInWord] = '\0';

	}
	return wordLowerCase;
}

int verifyPalindromic(char * word, int quantityCharacterInWord) {
	int quantityCharacterInWordWithoutEnd = quantityCharacterInWord - 1;
	if (word == NULL || quantityCharacterInWordWithoutEnd <= 0) {
		return FALSE;
	}

	if (word != NULL && quantityCharacterInWord && quantityCharacterInWordWithoutEnd == 1) {
		// The word has one character
		return TRUE;
	}

	char * wordReverse = (char *) malloc(quantityCharacterInWord);
	if (*wordReverse == ERROR_MEMORY){
		return ERROR_MEMORY;
	}
	int last = quantityCharacterInWordWithoutEnd - 1; // I take the end of word and keep in mind that it starts at zero.

	int i;
	for (i = 0; i < quantityCharacterInWordWithoutEnd; i++) {
		wordReverse[i] = word[last];
		last --;
	}

	wordReverse[quantityCharacterInWordWithoutEnd] = '\0';

	char * wordInLowerCase = toLowerCase(word, quantityCharacterInWord);
	char * wordReverseInLowerCase = toLowerCase(wordReverse, quantityCharacterInWord);

	if (!wordInLowerCase || !wordReverseInLowerCase){
		fprintf(stderr, "[Error] Hubo un error en memoria \n");
		return ERROR_MEMORY;
	}

	int result = FALSE;
	if (strcmp(wordInLowerCase, wordReverseInLowerCase) == 0) {
		result = TRUE;
	}

	free(wordReverse);
	wordReverse = NULL;

	free(wordInLowerCase);
	wordInLowerCase = NULL;

	free(wordReverseInLowerCase);
	wordReverseInLowerCase = NULL;

	return result;
}

int isKeywords(char character) {
	/* ASCII:
	 * 		A - Z = [65 - 90]
	 * 		a - z = [97 - 122]
	 * 		0 - 9 = [48 - 57]
	 * 		- =  45
	 * 		_ = 95
	 */
	if ((character >= 65 && character <= 90) || (character >= 97 && character <= 122)
			|| (character >= 48 && character <= 57)
			|| character == 45 || character == 95) {
		return TRUE;
	}

	return FALSE;
}

int executeProcess(FILE * fileInput, FILE * fileOutput) {
	// Precondition: Files must be open.
	int icharacter = fgetc(fileInput);
	char * buffer = NULL;
	int quantityCharacterInWord = 0;
	while (icharacter != EOF) {
		char character = icharacter;

		if (isKeywords(character) == TRUE) {
			buffer = (char *) realloc(buffer, 1);
			if (!buffer){
				fprintf(stderr, "[Error] Hubo un error en memoria \n");
				return ERROR_MEMORY;
			}
			buffer[quantityCharacterInWord] = character;
			quantityCharacterInWord ++;
		} else {
			buffer = (char *) realloc(buffer, 1);
			if (!buffer){
				fprintf(stderr, "[Error] Hubo un error en memoria \n");
				return ERROR_MEMORY;
			}
			buffer[quantityCharacterInWord] = '\0';
			quantityCharacterInWord ++;
			int itsPalindromic = verifyPalindromic(buffer, quantityCharacterInWord);
			if (itsPalindromic != ERROR_MEMORY){
				if (itsPalindromic == TRUE) {
					int result = fputs(buffer, fileOutput);
					if (result == EOF) {
						fprintf(stderr, "[Error] Error al escribir en el archivo output la palabra %s", buffer);
						return ERROR_FILE;
					}

					result = fputc('\n', fileOutput);
					if (result == EOF) {
						fprintf(stderr, "[Error] Error al escribir en el archivo output el salto de línea.");
						return ERROR_FILE;
					}
				}
			}else{
				return ERROR_MEMORY;
			}

			free(buffer);
			buffer = NULL;
			quantityCharacterInWord = 0;
		}

		icharacter = fgetc(fileInput);
	}

	return OKEY;
}

int executeWithDefaultParameters() {
	FILE * fileInput = stdin;
	FILE * fileOutput = stdout;

	return executeProcess(fileInput, fileOutput);
}

int executeHelp() {
	/*
	Usage:
		tp0 -h
		tp0 -V
		tp0 [options]
	Options:
		-V, --version Print version and quit.
		-h, --help Print this information.
		-i, --input Location of the input file.
		-o, --output Location of the output file.
	*/

	fprintf(stdout, "Usage: \n");
	fprintf(stdout, "	tp0 -h \n");
	fprintf(stdout, "	tp0 -V \n");
	fprintf(stdout, "	tp0 [options] \n");
	fprintf(stdout, "Options: \n");
	fprintf(stdout, "	-V, --version	Print version and quit. \n");
	fprintf(stdout, "	-h, --help	Print this information. \n");
	fprintf(stdout, "	-i, --input	Location of the input file. \n");
	fprintf(stdout, "	-o, --output	Location of the output file. \n");

	return OKEY;
}

int executeVersion() {
	fprintf(stdout, "Version: \"%s\" \n", VERSION);

	return OKEY;
}

int executeWithDefaultOutput(char * pathInput) {
	FILE * fileInput = fopen(pathInput, "r"); // Opens an existing text file for reading purpose.
	if (fileInput == NULL) {
		fprintf(stderr, "[Error] El archivo de input no pudo ser abierto para lectura: %s \n", pathInput);
		return ERROR_FILE;
	}

	FILE * fileOutput = stdout;

	int executeResult = executeProcess(fileInput, fileOutput);

	if (fileInput != NULL) {
		int result = fclose(fileInput);
		if (result == EOF) {
			fprintf(stderr, "[Warning] El archivo de input no pudo ser cerrado correctamente: %s \n", pathInput);
			return ERROR_FILE;
		}
	}
	if (executeResult == ERROR_MEMORY){
		return ERROR_MEMORY;
	}

	return OKEY;
}

int executeWithDefaultInput(char * pathOutput) {
	FILE * fileInput = stdin;

	FILE * fileOutput = fopen(pathOutput, "w"); // Opens a text file for writing. Pace the content.
	if (fileOutput == NULL) {
		fprintf(stderr, "[Error] El archivo de output no pudo ser abierto para escritura: %s \n", pathOutput);
		return ERROR_FILE;
	}

	int executeResult = executeProcess(fileInput, fileOutput);

	if (fileOutput != NULL) {
		int result = fclose(fileOutput);
		if (result == EOF) {
			fprintf(stderr, "[Warning] El archivo de output no pudo ser cerrado correctamente: %s \n", pathOutput);
			return ERROR_FILE;
		}
	}
	if (executeResult == ERROR_MEMORY){
		return ERROR_MEMORY;
	}

	return OKEY;
}

int executeWithParameters(char * pathInput, char * pathOutput) {
	FILE * fileInput = fopen(pathInput, "r"); // Opens an existing text file for reading purpose.
	if (fileInput == NULL) {
		fprintf(stderr, "[Error] El archivo de input no pudo ser abierto para lectura: %s \n", pathInput);
		return ERROR_FILE;
	}

	FILE * fileOutput = fopen(pathOutput, "w"); // Opens a text file for writing. Pace the content.
	if (fileOutput == NULL) {
		fprintf(stderr, "[Error] El archivo de output no pudo ser abierto para escritura: %s \n", pathOutput);
		return ERROR_FILE;
	}

	int executeResult = executeProcess(fileInput, fileOutput);

	if (fileInput != NULL) {
		int result = fclose(fileInput);
		if (result == EOF) {
			fprintf(stderr, "[Warning] El archivo de input no pudo ser cerrado correctamente: %s \n", pathInput);
			return ERROR_FILE;
		}
	}

	if (fileOutput != NULL) {
		int result = fclose(fileOutput);
		if (result == EOF) {
			fprintf(stderr, "[Warning] El archivo de output no pudo ser cerrado correctamente: %s \n", pathOutput);
			return ERROR_FILE;
		}
	}

	if (executeResult == ERROR_MEMORY){
		return ERROR_MEMORY;
	}
	return OKEY;
}

int executeByMenu(int argc, char *argv[]) {
	// Always begins with /
	if (argc == 1) {
		// Run with default parameters
		return executeWithDefaultParameters();
	}

	if (argc == 2) {
		char * key = argv[1];

		// / -h
		if (strcmp("-h", key) == 0 || strcmp("--help", key) == 0) {
			return executeHelp();
		}

		// / -V
		if (strcmp("-V", key) == 0 || strcmp("--version", key) == 0) {
			return executeVersion();
		}

		return INCORRECT_MENU;
	}

	if (argc == 3) {
		char * key = argv[1];
		char * value = argv[2];

		// / -i fileInput
		if (strcmp("-i", key) == 0 || strcmp("--input", key) == 0) {
			if (strcmp("-",value) == 0) {
				return executeWithDefaultParameters();
			}else{
				return executeWithDefaultOutput(value);
			}
		}

		// / -o fileOutput
		if (strcmp("-o", key) == 0 || strcmp("--output", key) == 0) {
			if (strcmp("-",value) == 0) {
				return executeWithDefaultParameters();
			}else{
				return executeWithDefaultInput(value);
			}
		}

		return INCORRECT_MENU;
	}

	if (argc == 4) {
	    char * firstKey = argv[1];
	    char * firstValue = argv[2];

	    char * secondKey = argv[3];

	    // / -i fileInput -o fileOutput
	    if ((strcmp("-i", firstKey) == 0 || strcmp("--input", firstKey) == 0)
	        && (strcmp("-o", secondKey) == 0 || strcmp("--output", secondKey) == 0)) {
	      	if (strcmp("-",firstValue) == 0) {
				return executeWithDefaultParameters();
			}else{
	      		return executeWithDefaultOutput(firstValue);
	      	}
	    }

	    // / -o fileOutput -i fileInput
	    if ((strcmp("-i", secondKey) == 0 || strcmp("--input", secondKey) == 0)
	        && (strcmp("-o", firstKey) == 0 || strcmp("--output", firstKey) == 0)) {
			if (strcmp("-",firstValue) == 0) {
				return executeWithDefaultParameters();
			}else{
	      		return executeWithDefaultInput(firstValue);
	  		}
	    }

	    return INCORRECT_MENU;
	  }

	if (argc == 5) {
		char * firstKey = argv[1];
		char * firstValue = argv[2];

		char * secondKey = argv[3];
		char * secondValue = argv[4];

		// / -i fileInput -o fileOutput
		if ((strcmp("-i", firstKey) == 0 || strcmp("--input", firstKey) == 0)
				&& (strcmp("-o", secondKey) == 0 || strcmp("--output", secondKey) == 0)) {
			if (strcmp("-",firstValue) == 0 && strcmp("-",secondValue) == 0) {
				return executeWithDefaultParameters();
			}

			if (strcmp("-",firstValue) == 0 && strcmp("-",secondValue) != 0) {
				return executeWithDefaultInput(secondValue);
			}

			if (strcmp("-",firstValue) != 0 && strcmp("-",secondValue) == 0) {
				return executeWithDefaultOutput(firstValue);
			}

			return executeWithParameters(firstValue, secondValue);
		}

		// / -o fileOutput -i fileInput
		if ((strcmp("-i", secondKey) == 0 || strcmp("--input", secondKey) == 0)
				&& (strcmp("-o", firstKey) == 0 || strcmp("--output", firstKey) == 0)) {
			if (strcmp("-",firstValue) == 0 && strcmp("-",secondValue) == 0) {
				return executeWithDefaultParameters();
			}

			if (strcmp("-",firstValue) == 0 && strcmp("-",secondValue) != 0) {
				return executeWithDefaultOutput(secondValue);
			}

			if (strcmp("-",firstValue) != 0 && strcmp("-",secondValue) == 0) {
				return executeWithDefaultInput(firstValue);
			}

			return executeWithParameters(secondValue, firstValue);
		}

		return INCORRECT_MENU;
	}

	return INCORRECT_MENU;
}

int main(int argc, char *argv[]) {
	// / -i lalala.txt -o pepe.txt  => 5 parameters as maximum
	if (argc > 5) {
		fprintf(stderr, "[Error] Cantidad máxima de parámetros incorrecta: %d \n", argc);
		return INCORRECT_QUANTITY_PARAMS;
	}

	return executeByMenu(argc, argv);
}
