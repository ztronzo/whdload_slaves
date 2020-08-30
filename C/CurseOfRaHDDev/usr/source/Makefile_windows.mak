PROGNAME = CurseOfRa
WHDLOADER = $(PROGNAME).slave
SOURCE = $(PROGNAME)HD.s
HDBASE = K:\jff\AmigaHD
WHDBASE = $(HDBASE)\PROJETS\HDInstall\DONE\WHDLoad
all :  $(WHDLOADER)

$(WHDLOADER) : $(SOURCE)
	wdate.py> datetime
	vasmm68k_mot -DDATETIME -IK:/jff/AmigaHD/amiga39_JFF_OS/include -I$(WHDBASE)\Include -I$(WHDBASE) -phxass -nosym -Fhunkexe -o $(WHDLOADER) $(SOURCE)
