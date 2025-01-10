#ifndef TEMPLATE_HPP
#define TEMPLATE_HPP

# include <iostream>

class Template
{
	public:

		Template();
		Template(int const t_n);
		Template(const Template &t_src);
		~Template();

		Template	&operator=(const Template &t_rhs);

		int		getFoo(void) const;


	private:
	
		int	m_foo;
};

std::ostream	&operator<<(std::ostream &t_out, Template const &t_rhs);

#endif
