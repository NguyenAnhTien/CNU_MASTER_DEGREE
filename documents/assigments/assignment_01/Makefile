SRCS = assignment_01.tex 
OBJECTS = $(SRCS:.tex=.dvi)
TARGET = $(OBJECTS:.dvi=.pdf)

.phony: $(OBJECTS) $(TARGET)
all: $(OBJECTS) $(TARGET)

%.dvi: %.tex
	-@latex $< 

%.pdf: %.dvi
	-@dvipdf $<
clean:
	-rm *.pdf
	-rm *.dvi
