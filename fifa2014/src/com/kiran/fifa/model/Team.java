package com.kiran.fifa.model;

import java.util.List;

public class Team {

	private Country country;
	private String code;
	private String name;
	private String group;
	private List<Player> players;
	
	public Team(Country country){
		this.country = country;
		this.code = country.getCode();
		this.name = country.getName();
		this.group = country.getGroup();
	}
	
	public Country getCountry() {
		return country;
	}

	public void setCountry(Country country) {
		this.country = country;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	public List<Player> getPlayers() {
		return players;
	}
	
	public void setPlayers(List<Player> players) {
		this.players = players;
	}
	
	public String toString(){
		return country.toString();
	}
}
