PROGNAME = Ugh
WHDBASE = K:\jff\AmigaHD\PROJETS\WHDLoad
all :  $(PROGNAME).slave 

$(PROGNAME).slave : $(PROGNAME)HD.s
	wdate.py> datetime
	vasmm68k_mot -DDATETIME -IK:/jff/AmigaHD/amiga39_JFF_OS/include -IK:/jff\AmigaHD\PROJETS\HDInstall\DONE\WHDLoad -IK:/jff\AmigaHD\PROJETS\HDInstall\DONE\generic -devpac -nosym -Fhunkexe -o $(PROGNAME).slave  $(PROGNAME)HD.s 

