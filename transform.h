#include "xmlbuff.h"
#include "fileinfo.h"
#include "stopif.h"

int transformLoad(const char *stylesheetData, size_t stylesheetSize);
int transformXML(XMLBuff *infile);
void transformCleanup();