package com.kiran.fifa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.kiran.fifa.model.Country;
import com.kiran.fifa.model.Fixture;
import com.kiran.fifa.model.Match;
import com.kiran.fifa.model.Player;
import com.kiran.fifa.model.Team;

public class FifaDAO {

    public List<Fixture> getFixtures() {
	List<Fixture> list = new ArrayList<Fixture>();
	Connection c = null;
	String sql = "SELECT * FROM fixtures";
	try {
	    c = ConnectionHelper.getConnection();
	    Statement s = c.createStatement();
	    ResultSet rs = s.executeQuery(sql);
	    while (rs.next()) {
		list.add(processRow(rs));
	    }
	} catch (SQLException e) {
	    e.printStackTrace();
	    throw new RuntimeException(e);
	} finally {
	    ConnectionHelper.close(c);
	}
	return list;
    }

    protected Fixture processRow(ResultSet rs) throws SQLException {
	Fixture fixture = new Fixture();
	fixture.setId(rs.getInt("id"));
	fixture.setCutOff(rs.getString("cutoff"));
	fixture.setDate(rs.getDate("date"));
	fixture.setDay(rs.getString("day"));
	fixture.setGroup(rs.getString("group"));
	fixture.setMatchId(rs.getString("matchId"));
	fixture.setTeam1(rs.getString("team1"));
	fixture.setTeam2(rs.getString("team2"));
	fixture.setTime("17:00");
	return fixture;
    }
    
    public Match getMatch(String matchId)
    {
    	Match match = new Match();
    	Connection c = null;
    	String sql = "SELECT * FROM fixtures where matchId='"+matchId+"'";
    	try {
    	    c = ConnectionHelper.getConnection();
    	    Statement s = c.createStatement();
    	    //System.out.println(sql);
    	    ResultSet rs = s.executeQuery(sql);
    	    while (rs.next()) {
    	    	match.setDate(rs.getDate("date"));
    	    	match.setMatchId(rs.getString("matchId"));
    	    	match.setTeamA(getTeam(rs.getString("team1")));
    	    	match.setTeamB(getTeam(rs.getString("team2")));
    		}
    	} catch (SQLException e) {
    	    e.printStackTrace();
    	    throw new RuntimeException(e);
    	} finally {
    	    ConnectionHelper.close(c);
    	}
    	return match;
    }
    
    private Team getTeam(String teamCode){
    	Team team = new Team(Country.getCountry(teamCode));
    	//System.out.println(team.toString());
    	return team;
    }

	public List<Player> getPlayers(String countryId) {
		List<Player> players = new ArrayList<Player>();
		Connection c = null;
    	String sql = "select * from fifa_players where team_id = (select team_id from fifa_teams where team_short_name ='"+countryId+"')";
    	try {
    	    c = ConnectionHelper.getConnection();
    	    Statement s = c.createStatement();
    	    //System.out.println(sql);
    	    ResultSet rs = s.executeQuery(sql);
    	    while (rs.next()) {
    	    	Player player = new Player();
    	    	player.setPlayerId(String.valueOf(rs.getInt("player_id")));
    	    	player.setPlayerName(rs.getString("player_name"));
    	    	players.add(player);
    		}
    	} catch (SQLException e) {
    	    e.printStackTrace();
    	    throw new RuntimeException(e);
    	} finally {
    	    ConnectionHelper.close(c);
    	}
    	return players;
	}

	public String playQuiz(String matchId, String winner, String teamAgoals, String teamBgoals,
			String pom, String noGoals, String userName, String league) {
		Connection c = null;
		String sql = "INSERT INTO Quiz"
				+ "(matchId, matchWinner, teamAgoals, teamBgoals, pom, noGoals, voteTime, userName, league) VALUES"
				+ "(?,?,?,?,?,?,?,?,?)";
		
    	try {
    		c = ConnectionHelper.getConnection();
    		PreparedStatement preparedStatement = c.prepareStatement(sql);
    		preparedStatement.setString(1, matchId);
    		preparedStatement.setString(2, winner);
    		preparedStatement.setString(3, teamAgoals);
    		preparedStatement.setString(4, teamBgoals);
    		preparedStatement.setString(5, pom);
    		preparedStatement.setString(6, noGoals);
    		preparedStatement.setTimestamp(7, getCurrentTimeStamp());
    		preparedStatement.setString(8, userName);
    		preparedStatement.setString(9, league);
    		preparedStatement .executeUpdate();
    	} catch (SQLException e) {
    	    e.printStackTrace();
    	    throw new RuntimeException(e);
    	} finally {
    	    ConnectionHelper.close(c);
    	}
		return null;
	}
	
	private static java.sql.Timestamp getCurrentTimeStamp() {
		java.util.Date today = new java.util.Date();
		return new java.sql.Timestamp(today.getTime());
	}
	
	public String register(String userId) {
		/*Connection c = null;
		String sql = "INSERT INTO Quiz"
				+ "(matchId, matchWinner, teamAgoals, teamBgoals, pom, noGoals, voteTime, userName, league) VALUES"
				+ "(?,?,?,?,?,?,?,?,?)";
		
    	try {
    		c = ConnectionHelper.getConnection();
    		PreparedStatement preparedStatement = c.prepareStatement(sql);
    		preparedStatement.setString(1, matchId);
    		preparedStatement.setString(2, winner);
    		preparedStatement.setString(3, teamAgoals);
    		preparedStatement.setString(4, teamBgoals);
    		preparedStatement.setString(5, pom);
    		preparedStatement.setString(6, noGoals);
    		preparedStatement.setTimestamp(7, getCurrentTimeStamp());
    		preparedStatement.setString(8, userName);
    		preparedStatement.setString(9, league);
    		preparedStatement .executeUpdate();
    	} catch (SQLException e) {
    	    e.printStackTrace();
    	    throw new RuntimeException(e);
    	} finally {
    	    ConnectionHelper.close(c);
    	}*/
		return "registered";
	}
}
