#ifndef TEMPLATE_HPP
#define TEMPLATE_HPP

# include <iostream>

class Template
{
	public:

		Template();
		Template(int const n);
		Template(const Template &src);
		~Template();

		Template	&operator=(const Template &rhs);

		int		getFoo(void) const;


	private:
	
		int	_foo;
};

std::ostream	&operator<<(std::ostream &out, Template const &rhs);

#endif
