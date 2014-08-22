KITTEN?=kitten
TARGETS:=. documentation faq intro tutorial
MAKEFLAGS+=--warn-undefined-variables

.PHONY : default clean

default : $(foreach TARGET,$(TARGETS),$(TARGET)/index.html)

clean :
	find . -name '*.html' -exec rm {} +

define HTML_KTN_RULE
$1/index.html : $1/index.ktn
	$(KITTEN) "$$<" > "$$@"
endef

define DEP_CORE_RULE
$1/index.ktn $1/index.html : Kittenlang.ktn Makefile
endef

$(foreach TARGET,$(TARGETS),$(eval $(call HTML_KTN_RULE,$(TARGET))))
$(foreach TARGET,$(TARGETS),$(eval $(call DEP_CORE_RULE,$(TARGET))))
