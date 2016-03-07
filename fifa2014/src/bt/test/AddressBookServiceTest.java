package bt.test;

import java.util.HashMap;
import java.util.Map;


public class AddressBookServiceTest {
	
	//@Test
	public void testAddContact()
	{
		AddressBookService abs = new AddressBookService();
		
		abs.addContact("Kuruvilla", "Anand", "123 Kent Street");
		abs.addContact("Singh", "Amit", "123 Kent Street");
		abs.addContact("Kuruvilla", "Anand", "123 George Street");
		abs.addContact("Kuruvilla", "Anand", "123 Kent Street");
		Map<String, AddressBook> addressBooks = new HashMap<String, AddressBook>();
		abs.getAddressBooks().keySet();
		
		
	}
}
