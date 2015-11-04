package edu.uga.cs.rentaride.entity.impl;

import edu.uga.cs.rentaride.entity.RARException;
import edu.uga.cs.rentaride.entity.Administrator;
import edu.uga.cs.rentaride.entity.User;
import edu.uga.cs.rentaride.persistence.impl.Persistent;

/** This class represents an Administrator user.  It has no additional attributes, and all are inherited from User.
 *
 */
public class AdministratorImpl
    extends Persistent      //Dont know if this is right becuase Admin etends User
    implements Administrator
{
}