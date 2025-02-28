NAME 			=	placeholder_name

SRC_DIR			=	src/
OBJ_DIR			=	obj/
DEP_DIR			=	dep/

SRC_FILES		=	placeholder_src_file

INC				=	inc/.

SRCS			=	$(addprefix $(SRC_DIR), $(addsuffix .cpp, $(SRC_FILES)))
OBJS			=	$(addprefix $(OBJ_DIR), $(addsuffix .o, $(SRC_FILES)))
DEPS			=	$(addprefix $(DEP_DIR), $(addsuffix .d, $(SRC_FILES)))

INC_PATHS		=	$(addprefix -I, $(INC))

CC				=	c++
COMP_FLAGS		=	-Wall -Wextra -Werror
CPP_FLAGS		=	-std=c++98
DFLAGS			:=	-MMD -MF
RM				:=	rm -rf

DEF_COLOR		=	\033[0;39m
RED				=	\033[0;91m
GREEN			=	\033[0;92m
YELLOW			=	\033[0;93m
CLEAR_LINE		=	\033[2K

all:			$(NAME)

-include $(DEPS)

$(NAME):		$(OBJS)
				@$(CC) $(COMP_FLAGS) $(CPP_FLAGS) $(OBJS) -o $@
				@echo "\r$(GREEN)Successfully created executable: $(NAME) $(DEF_COLOR)"

$(OBJ_DIR)%.o:	$(SRC_DIR)%.cpp
				@mkdir -p $(dir $@)
				@mkdir -p $(subst $(OBJ_DIR), $(DEP_DIR), $(dir $@))
				@$(eval DEP_FILE=$(subst $(OBJ_DIR), $(DEP_DIR), $(basename $@)).d)
				@$(CC) $(COMP_FLAGS) $(CPP_FLAGS) $(DFLAGS) $(DEP_FILE) $(INC_PATHS) -c $< -o $@

clean:
				@$(RM) $(OBJ_DIR) $(DEP_DIR)
				@echo "$(YELLOW)clean complete $(DEF_COLOR)"

fclean:			clean
				@$(RM) $(NAME)
				@echo "$(YELLOW)fclean complete $(DEF_COLOR)"

re:				fclean all

debug:			COMP_FLAGS += -g
debug:			all

.PHONY:			all clean fclean re debug

