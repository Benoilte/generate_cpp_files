#include "Template.hpp"

Template::Template()
{
    /*Constructor*/
}

Template::Template(const Template &src)
{
	*this = src;

	return ;
}

Template::Template(int const n) : _foo(n)
{
	
}

Template::~Template()
{
	/*Destructor*/
}

Template& Template::operator=(const Template &rhs)
{
	if (this != &rhs)
		this->_foo = rhs.getFoo();
	
	return *this;

}

int Template::getFoo(void) const
{
	return _foo;
}

std::ostream& operator<<(std::ostream &out, Template const &rhs)
{
	out << rhs.getFoo();
	return out; 
}