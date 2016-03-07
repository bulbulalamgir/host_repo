package com.kiran.fifa.model;

import java.util.Date;

public class Match {
	
	private String matchId;
	private Date date;
	private Team teamA;
	private Team teamB;
	private Team winner;
	private int pom;
	
	public String getMatchId() {
		return matchId;
	}
	public void setMatchId(String matchId) {
		this.matchId = matchId;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Team getTeamA() {
		return teamA;
	}
	public void setTeamA(Team teamA) {
		this.teamA = teamA;
	}
	public Team getTeamB() {
		return teamB;
	}
	public void setTeamB(Team teamB) {
		this.teamB = teamB;
	}
	public Team getWinner() {
		return winner;
	}
	public void setWinner(Team winner) {
		this.winner = winner;
	}
	public int getPom() {
		return pom;
	}
	public void setPom(int pom) {
		this.pom = pom;
	} 

}
