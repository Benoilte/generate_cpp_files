#ifndef TEMPLATE_HPP
#define TEMPLATE_HPP

# include <iostream>

class Template
{
	private:
	
		// PRIVATE ATTRIBUTE //

		int	m_foo;

		// PRIVATE MEMBER FUNCTION //

	public:

		// CONSTRUCTOR //

		Template();
		Template(int const t_n);
		Template(const Template &t_src);

		// DESTRUCTOR //

		~Template();

		// OPERATOR OVERLOAD //

		Template	&operator=(const Template &t_rhs);

		// GETTER //

		int		getFoo(void) const;

		// SETTER //

		// PUBLIC MEMBER FUNCTION //

};

std::ostream	&operator<<(std::ostream &t_out, Template const &t_rhs);

#endif
