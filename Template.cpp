#include "Template.hpp"

Template::Template()
{
    /*Constructor*/
}

Template::Template(const Template &t_src)
{
	*this = t_src;

	return ;
}

Template::Template(int const t_n) : m_foo(t_n)
{
	
}

Template::~Template()
{
	/*Destructor*/
}

Template& Template::operator=(const Template &t_rhs)
{
	if (this != &t_rhs)
		this->m_foo = t_rhs.getFoo();
	
	return *this;
}

int Template::getFoo(void) const
{
	return m_foo;
}

std::ostream& operator<<(std::ostream &t_out, Template const &t_rhs)
{
	t_out << t_rhs.getFoo();
	return t_out; 
}