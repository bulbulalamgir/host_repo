package bt.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AddressBookService {
	
	public static void main(String[] args)
	{
		AddressBookService abs = new AddressBookService();
		abs.addContact("Kuruvilla", "Anand", "123 Kent Street");
		abs.addContact("Singh", "Amit", "123 Kent Street");
		abs.addContact("Kuruvilla", "Anand", "123 George Street");
		abs.addContact("Kuruvilla", "Anand", "123 Kent Street");
	}
	
	//List<AddressBook> addressBooks = new ArrayList<AddressBook>();
	Map<String, AddressBook> addressBooks = new HashMap<String, AddressBook>();
	
	public void addContact(String surname, String givenName, String address) {
		
		AddressBook addressBook = new AddressBook();
		addressBook.setSurname(surname);
		addressBook.setGivenName(givenName);
		addressBook.getAddress().add(address);
		addressBooks.put(surname+givenName, addressBook);	
		
	}

	public Map<String, AddressBook> getAddressBooks() {
		return addressBooks;
	}

	public void setAddressBooks(Map<String, AddressBook> addressBooks) {
		this.addressBooks = addressBooks;
	}
	
	

}
