#include <stdio.h>
#include <string.h>
#include "transform.h"
#include "zip.h"
#include "stopif.h"
#include "extractHistory.h"

void usage(const char *name) {
	printf("%s inputFile\n", name);
}

int main(int argc, char **argv) {
	if (argc < 2) {
		usage(argv[0]);
		return 1;
	}

	char *dot = strrchr(argv[1], '.');
	Stopif(!dot, return 1, "Bad input file name!\n");

	Stopif(!transformLoad(mqxliffHistory, sizeof(mqxliffHistory)), return 1, "Can't load transform!\n");
	readZIP(argv[1], historyFile);
	transformCleanup();	

}
