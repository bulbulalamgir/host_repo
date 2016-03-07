package bt.test;

import java.util.HashSet;
import java.util.Set;

public class AddressBook {

	String surname;
	String givenName;
	Set<String> address = new HashSet<String>();
	public String getSurname() {
		return surname;
	}
	public void setSurname(String surname) {
		this.surname = surname;
	}
	public String getGivenName() {
		return givenName;
	}
	public void setGivenName(String givenName) {
		this.givenName = givenName;
	}
	public Set<String> getAddress() {
		return address;
	}

}

