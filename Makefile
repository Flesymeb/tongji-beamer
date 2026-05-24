# Makefile for TJBeamer demo
# - make / make all   : 编译当前模式（默认简洁版）
# - make simple       : 强制简洁版输出 main-simple.pdf
# - make bg           : 强制背景版输出 main-bg.pdf
# - make both         : 同时生成两版
# - make clean        : 清中间文件
# - make cleanall     : 清所有产物

THESIS = main
LATEXMK = latexmk -xelatex -interaction=nonstopmode -file-line-error -shell-escape -synctex=1

.PHONY: all view simple bg both clean cleanall

all: $(THESIS).pdf

$(THESIS).pdf: $(THESIS).tex
	$(LATEXMK) $<

# 简洁版：把 \tjbgmodetrue 行注释掉再编译
simple:
	@sed -i.bak 's/^\\tjbgmodetrue/% \\tjbgmodetrue/' $(THESIS).tex
	$(LATEXMK) $(THESIS).tex
	@cp $(THESIS).pdf $(THESIS)-simple.pdf
	@mv $(THESIS).tex.bak $(THESIS).tex
	@echo "Built $(THESIS)-simple.pdf"

# 背景版：把 \tjbgmodetrue 行取消注释再编译
bg:
	@sed -i.bak 's/^% \\tjbgmodetrue/\\tjbgmodetrue/' $(THESIS).tex
	$(LATEXMK) $(THESIS).tex
	@cp $(THESIS).pdf $(THESIS)-bg.pdf
	@mv $(THESIS).tex.bak $(THESIS).tex
	@echo "Built $(THESIS)-bg.pdf"

both: simple bg

view: $(THESIS).pdf
	xdg-open $< 2>/dev/null || open $<

clean:
	@latexmk -c -silent $(THESIS).tex 2>/dev/null || true
	@rm -f *.nav *.snm *.synctex.gz *.vrb *.toc *.aux

cleanall:
	@latexmk -C -silent $(THESIS).tex 2>/dev/null || true
	@rm -f $(THESIS).pdf $(THESIS)-simple.pdf $(THESIS)-bg.pdf
	@rm -f *.nav *.snm *.synctex.gz *.vrb *.toc *.aux
