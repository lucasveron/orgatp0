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
	 OKEY = 0, INCORRECT_QUANTITY_PARAMS = 1, INCORRECT_MENU = 2, ERROR_FILE = 3
};

char * toLowerCase(char * word, int quantityCharacterInWord) {
	char * wordLowerCase = (char *) malloc(quantityCharacterInWord);

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
			switch (character) {
				case 'A':
					character = 'a';
					break;
				case 'B':
					character = 'b';
					break;
				case 'C':
					character = 'c';
					break;
				case 'D':
					character = 'd';
					break;
				case 'E':
					character = 'e';
					break;
				case 'F':
					character = 'f';
					break;
				case 'G':
					character = 'g';
					break;
				case 'H':
					character = 'h';
					break;
				case 'I':
					character = 'i';
					break;
				case 'J':
					character = 'j';
					break;
				case 'K':
					character = 'k';
					break;
				case 'L':
					character = 'l';
					break;
				case 'M':
					character = 'm';
					break;
				case 'N':
					character = 'n';
					break;
				case 'O':
					character = 'o';
					break;
				case 'P':
					character = 'p';
					break;
				case 'Q':
					character = 'q';
					break;
				case 'R':
					character = 'r';
					break;
				case 'S':
					character = 's';
					break;
				case 'T':
					character = 't';
					break;
				case 'U':
					character = 'u';
					break;
				case 'V':
					character = 'v';
					break;
				case 'W':
					character = 'w';
					break;
				case 'X':
					character = 'x';
					break;
				case 'Y':
					character = 'y';
					break;
				case 'Z':
					character = 'z';
					break;
				default:
					break;
			}
		}

		wordLowerCase[i] = character;
	}

	wordLowerCase[quantityCharacterInWord] = '\0';

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
	int last = quantityCharacterInWordWithoutEnd - 1; // I take the end of word and keep in mind that it starts at zero.

	int i;
	for (i = 0; i < quantityCharacterInWordWithoutEnd; i++) {
		wordReverse[i] = word[last];
		last --;
	}

	wordReverse[quantityCharacterInWordWithoutEnd] = '\0';

	char * wordInLowerCase = toLowerCase(word, quantityCharacterInWord);
	char * wordReverseInLowerCase = toLowerCase(wordReverse, quantityCharacterInWord);

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
	char character = fgetc(fileInput);
	char * buffer = NULL;
	int quantityCharacterInWord = 0;
	while (character != EOF) {
		if (isKeywords(character) == TRUE) {
			buffer = (char *) realloc(buffer, 1);
			buffer[quantityCharacterInWord] = character;
			quantityCharacterInWord ++;
		} else {
			buffer = (char *) realloc(buffer, 1);
			buffer[quantityCharacterInWord] = '\0';
			quantityCharacterInWord ++;
			if (verifyPalindromic(buffer, quantityCharacterInWord) == TRUE) {
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

			free(buffer);
			buffer = NULL;
			quantityCharacterInWord = 0;
		}

		character = fgetc(fileInput);
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

	int result = executeProcess(fileInput, fileOutput);

	if (fileInput != NULL) {
		result = fclose(fileInput);
		if (result == EOF) {
			fprintf(stderr, "[Warning] El archivo de input no pudo ser cerrado correctamente: %s \n", pathInput);
			return ERROR_FILE;
		}
	}

	return result;
}

int executeWithDefaultInput(char * pathOutput) {
	FILE * fileInput = stdin;

	FILE * fileOutput = fopen(pathOutput, "W"); // Opens a text file for writing. Pace the content.
	if (fileOutput == NULL) {
		fprintf(stderr, "[Error] El archivo de output no pudo ser abierto para escritura: %s \n", pathOutput);
		return ERROR_FILE;
	}

	int result = executeProcess(fileInput, fileOutput);

	if (fileOutput != NULL) {
		result = fclose(fileOutput);
		if (result == EOF) {
			fprintf(stderr, "[Warning] El archivo de output no pudo ser cerrado correctamente: %s \n", pathOutput);
			return ERROR_FILE;
		}
	}

	return result;
}

int executeWithParameters(char * pathInput, char * pathOutput) {
	FILE * fileInput = fopen(pathInput, "r"); // Opens an existing text file for reading purpose.
	if (fileInput == NULL) {
		fprintf(stderr, "[Error] El archivo de input no pudo ser abierto para lectura: %s \n", pathInput);
		return ERROR_FILE;
	}

	FILE * fileOutput = fopen(pathOutput, "W"); // Opens a text file for writing. Pace the content.
	if (fileOutput == NULL) {
		fprintf(stderr, "[Error] El archivo de output no pudo ser abierto para escritura: %s \n", pathOutput);
		return ERROR_FILE;
	}

	int result = executeProcess(fileInput, fileOutput);

	if (fileInput != NULL) {
		result = fclose(fileInput);
		if (result == EOF) {
			fprintf(stderr, "[Warning] El archivo de input no pudo ser cerrado correctamente: %s \n", pathInput);
			return ERROR_FILE;
		}
	}

	if (fileOutput != NULL) {
		result = fclose(fileOutput);
		if (result == EOF) {
			fprintf(stderr, "[Warning] El archivo de output no pudo ser cerrado correctamente: %s \n", pathOutput);
			return ERROR_FILE;
		}
	}

	return result;
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
			// TODO: PREGUNTAR SI VA LA v XQ NO ESTABA EN EL INFORME
			return executeVersion();
		}

		return INCORRECT_MENU;
	}

	if (argc == 3) {
		char * key = argv[1];
		char * value = argv[2];

		// / -i fileInput
		if (strcmp("-i", key) == 0 || strcmp("--input", key) == 0) {
			return executeWithDefaultOutput(value);
		}

		// / -o fileOutput
		if (strcmp("-o", key) == 0 || strcmp("--output", key) == 0) {
			return executeWithDefaultInput(value);
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
	      return executeWithDefaultOutput(firstValue);
	    }

	    // / -o fileOutput -i fileInput
	    if ((strcmp("-i", secondKey) == 0 || strcmp("--input", secondKey) == 0)
	        && (strcmp("-o", firstKey) == 0 || strcmp("--output", firstKey) == 0)) {
	      return executeWithDefaultInput(firstValue);
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
			return executeWithParameters(firstValue, secondValue);
		}

		// / -o fileOutput -i fileInput
		if ((strcmp("-i", secondKey) == 0 || strcmp("--input", secondKey) == 0)
				&& (strcmp("-o", firstKey) == 0 || strcmp("--output", firstKey) == 0)) {
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
