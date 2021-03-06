# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mozzart <mozzart@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/11 21:11:52 by tvanessa          #+#    #+#              #
#    Updated: 2020/12/08 17:16:15 by mozzart          ###   ########.fr        #
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
PROJ_NAME_L =  $(shell echo $(proj) | tr '[:upper:]' '[:lower:]')
PROJ_NAME_U =  $(shell echo $(proj) | tr '[:lower:]' '[:upper:]')
endif

all: gitreset clonews setscripts clonesubmod rename mkauthor cleantodo gitcommit

cleantodo:
	@echo "Eraise TODO.."
	@echo "" > TODO

gitreset:
	@echo "Undo initial commit"
	@git update-ref -d HEAD

clonews:
	@echo "Cloning VSCode settins"
	@git clone https://github.com/Mozzart88/21-c-debugger-vscode.git $(VS_DIR)
	@rm -fr $(VS_DIR)/.git
	@echo "VSCode settins INSTALLED."

setscripts:
	@echo "Installing scripts.."
	@echo "\n# $(PROJ_NAME_U)" >> ~/${ZRC}
	@echo $(ZRC_STR) >> ~/$(ZRC)
	@echo "alias $(PROJ_NAME_L)_valg=\"bash $(MOZZ_DIR)/valg.sh\"" >> $(MOZZ_DIR)/$(ZRC)
	@echo "alias $(PROJ_NAME_L)_build=\"bash $(MOZZ_DIR)/build.sh\"" >> $(MOZZ_DIR)/$(ZRC)
	@echo "alias $(PROJ_NAME_L)_norm=\"bash $(MOZZ_DIR)/norm.sh\"" >> $(MOZZ_DIR)/$(ZRC)
	@echo "alias $(PROJ_NAME_L)_srcs=\"bash $(MOZZ_DIR)/fsrcs.sh\"" >> $(MOZZ_DIR)/$(ZRC)
	@echo "Scripts installation DONE."

clonesubmod:
	@echo "Cloning submodules.."
	@git submodule add https://github.com/Mozzart88/Libft.git libft
	@git -C ./libft checkout latest
	@git -C ./libft submodule update --init
	@echo "Submodules INSTALLED."

rename:
	@echo "Renaming.."
	@sed -i '' 's/header/$(PROJ_NAME_L)/g' ./includes/header.h
	@sed -i '' 's/HEADER/$(PROJ_NAME_U)/g' ./includes/header.h
	@mv ./includes/header.h ./includes/$(PROJ_NAME_L).h
	@sed -i '' 's/header/$(PROJ_NAME_L)/g' ./srcs/main.c
	@sed -i '' 's/PROJ_NAME/$(PROJ_NAME_L)/g' $(MOZZ_DIR)/Makefile
	@mv .mozz/Makefile ./Makefile-
	@mv ./Makefile .mozz/Makefile
	@mv ./Makefile- ./Makefile
	@sed -i '' 's/42_21_C_template/$(PROJ_NAME_U)/g' ./README.md
	@echo "Renaming DONE."

gitcommit:
	@echo "Stage changes.."
	@git add .
	@git commit -m "INITIAL COMMIT"
	@git push --force

mkauthor:
ifdef u
	@echo $(u) > ./author
else ifdef user
	@echo $(user) > ./author
else
	@echo ${USER} > ./author
endif

deinstall: 
	@sed -i '' '/# $(PROJ_NAME_U)$$/,/^$$/ d' ~/.zshrc
	@rm -rf $(WS_PATH)

test: setscripts

.PHONY: err

err:  
	$(ERR)