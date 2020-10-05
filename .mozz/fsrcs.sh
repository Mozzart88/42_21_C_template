#! /bin/sh
find srcs -type f -name \*.c > fsrcs
echo "libft/libft.h" > fhdr
find includes -type f -name \*.h >> fhdr

# find libft -type f -name \*.c > fsrcs
cd libft
find . -type f -name \*.c > fsrcs
# echo "libft/libft.h" > fhdr
find . -type f -name \*.h > fhdr

# cd ft_printf
# find . -type f -name \*.c -maxdepth 1 > fsrcs
cd ..