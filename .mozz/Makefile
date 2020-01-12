# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mozzart <mozzart@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/11 21:11:52 by tvanessa          #+#    #+#              #
#    Updated: 2020/01/12 04:32:28 by mozzart          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

MOZZ_DIR = .mozz
VS_DIR = .vscode
ZRC = .zshrc
WS_PATH = $(shell cd .. && pwd)
ZRC_STR = "[ -f $(WS_PATH)/$(MOZZ_DIR)/$(ZRC) ] && source $(WS_PATH)/$(MOZZ_DIR)/$(ZRC)"

ifndef proj
$(error Set project name with arg proj proj=project_name)
else
PROJ_NAME = $(proj)
endif

all: gitreset clonews setscripts clonesubmod

gitreset:
	@echo "Undo initial commit"
	@git reset HEAD

clonews:
	@echo "Cloning VSCode settins"
	@git -C .. clone https://github.com/Mozzart88/21-c-debugger-vscode.git $(VS_DIR)
	@rm -fr $(VS_DIR)/.git

setscripts:
	@echo "Installing scripts.."
	@echo "\n# $(shell echo $(PROJ_NAME) | tr '[:lower:]' '[:upper:]')" >> ~/${ZRC}
	@echo $(ZRC_STR) >> ~/$(ZRC)
	@echo "alias $(shell echo $(PROJ_NAME) | tr '[:upper:]' '[:lower:]')_valg=\"bash $(MOZZ_DIR)/valg.sh\"" >> $(ZRC)
	@echo "alias $(shell echo $(PROJ_NAME) | tr '[:upper:]' '[:lower:]')_build=\"bash $(MOZZ_DIR)/build.sh\"" >> $(ZRC)
	@echo "alias $(shell echo $(PROJ_NAME) | tr '[:upper:]' '[:lower:]')_norm=\"bash $(MOZZ_DIR)/norm.sh\"" >> $(ZRC)
	@echo "Scripts installation - done."

clonesubmod:
	@echo "Cloning submodules"
	@git -C .. submodule add htttps://github.com/Mozzart88/Libft.git libft
	@git -C ../libft submodule update --init 

test: setscripts

.PHONY: err

err:  
	$(ERR)