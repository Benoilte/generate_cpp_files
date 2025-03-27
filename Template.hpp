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
		Template(int const n);
		Template(const Template &src);

		// DESTRUCTOR //

		~Template();

		// OPERATOR OVERLOAD //

		Template	&operator=(const Template &rhs);

		// GETTER //

		int		getFoo(void) const;

		// SETTER //

		// PUBLIC MEMBER FUNCTION //

};

std::ostream	&operator<<(std::ostream &out, Template const &rhs);

#endif
