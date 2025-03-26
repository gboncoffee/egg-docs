#!/bin/env bash

pandoc --standalone src/en/index.md \
	src/en/riscv.md \
	src/en/mips.md \
	src/en/sagui.md \
	src/en/reduxv.md \
	-o docs/en/index.html \
	--toc \
	--metadata title="EGG Docs"

pandoc --standalone src/pt/index.md \
	src/pt/riscv.md \
	src/pt/mips.md \
	src/pt/sagui.md \
	src/pt/reduxv.md \
	-o docs/pt/index.html \
	--toc \
	--metadata title="EGG Docs"
