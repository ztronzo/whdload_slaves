PROGNAME = K240
WHDLOADER = $(PROGNAME).slave
WHDLOADER512 = $(PROGNAME)_512k.slave
SOURCE = $(PROGNAME)HD.s

all :  $(WHDLOADER) $(WHDLOADER512)

CMDL = -DDATETIME -IK:/jff/AmigaHD/amiga39_JFF_OS/include -IK:\jff\AmigaHD\PROJETS\HDInstall\DONE\WHDLoad -devpac -nosym -Fhunkexe -o 
$(WHDLOADER) : $(SOURCE)
	$(WDATE)
	vasmm68k_mot -DCHIPMEMSIZE="$$100000" $(CMDL) $(WHDLOADER) $(SOURCE)
	
$(WHDLOADER512) : $(SOURCE)
	$(WDATE)
	vasmm68k_mot -DCHIPMEMSIZE="$$80000" $(CMDL) $(WHDLOADER512) $(SOURCE)
