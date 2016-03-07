package com.kiran.fifa.service;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Vote {

	private String matchId;
	private String winner;
	private String teamAgoals;
	private String teamBgoals;
	private int pom;
	private boolean noGoals;
	private String userId;
	
	public String getMatchId() {
		return matchId;
	}
	public void setMatchId(String matchId) {
		this.matchId = matchId;
	}
	public String getWinner() {
		return winner;
	}
	public void setWinner(String winner) {
		this.winner = winner;
	}
	public String getTeamAgoals() {
		return teamAgoals;
	}
	public void setTeamAgoals(String teamAgoals) {
		this.teamAgoals = teamAgoals;
	}
	public String getTeamBgoals() {
		return teamBgoals;
	}
	public void setTeamBgoals(String teamBgoals) {
		this.teamBgoals = teamBgoals;
	}
	public int getPom() {
		return pom;
	}
	public void setPom(int pom) {
		this.pom = pom;
	}
	public boolean isNoGoals() {
		return noGoals;
	}
	public void setNoGoals(boolean noGoals) {
		this.noGoals = noGoals;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
}
