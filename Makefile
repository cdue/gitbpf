# Copyright (c) 2015 Cédric Dué
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE

prefix=/usr/local

# files that need mode 755
EXEC_FILES =git-bpf
EXEC_FILES+=hooks/git-bpf-post-checkout
EXEC_FILES+=hooks/git-bpf-pre-commit
EXEC_FILES+=hooks/git-bpf-post-commit
EXEC_FILES+=hooks/git-bpf-pre-push

# files that need mode 644
SCRIPT_FILES =git-bpf-init
SCRIPT_FILES+=git-bpf-feature
#SCRIPT_FILES+=git-bpf-hotfix
#SCRIPT_FILES+=git-bpf-release
#SCRIPT_FILES+=git-bpf-support
SCRIPT_FILES+=git-bpf-rerere
SCRIPT_FILES+=git-bpf-version
SCRIPT_FILES+=gitbpf-common
SCRIPT_FILES+=gitbpf-shFlags


all:
	@echo "usage: make install"
	@echo "       make uninstall"

install:
	@test -f gitbpf-shFlags || (echo "Run 'git submodule init && git submodule update' first." ; exit 1 )
	install -d -m 0755 $(prefix)/bin
	install -m 0755 $(EXEC_FILES) $(prefix)/bin
	install -m 0644 $(SCRIPT_FILES) $(prefix)/bin

uninstall:
	test -d $(prefix)/bin && \
	cd $(prefix)/bin && \
	rm -f $(EXEC_FILES) $(SCRIPT_FILES)
