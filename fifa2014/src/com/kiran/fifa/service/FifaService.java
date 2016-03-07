package com.kiran.fifa.service;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.kiran.fifa.dao.FifaDAO;
import com.kiran.fifa.model.Fixture;
import com.kiran.fifa.model.Match;
import com.kiran.fifa.model.Player;

@Path("/fifa")
public class FifaService {

	FifaDAO dao = new FifaDAO();

	@GET
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public List<Fixture> getFixtures() {
		//System.out.println("getFixtures");
		return dao.getFixtures();
	}

	@GET
	@Path("/matchId/{matchId}")
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public Match getMatch(@PathParam("matchId") String matchId) {
		//System.out.println("getMatch");
		return dao.getMatch(matchId);
	}
	
	@GET
	@Path("/countryId/{countryId}")
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public List<Player> getPlayers(@PathParam("countryId") String countryId) {
		//System.out.println("getPlayers");
		return dao.getPlayers(countryId);
	}
	
	@GET
	@Path("/playQuiz11/{selectedMatch}/{winner}/{teamAgoals}/{teamBgoals}/{pom}/{nogoals}/{userId}/{league}")
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public String playQuiz11(@PathParam("selectedMatch") String selectedMatch, @PathParam("winner") String winner, 
			@PathParam("teamAgoals") String teamAgoals, @PathParam("teamBgoals") String teamBgoals, @PathParam("pom") String pom, 
			@PathParam("nogoals") String nogoals, @PathParam("userId") String userId, @PathParam("league") String league) {
		System.out.println("playQuiz");
		return dao.playQuiz(selectedMatch, winner, teamAgoals, teamBgoals, pom, nogoals, userId, league);
	}
	
	@GET
	@Path("/playQuiz/{winner}/{teamAgoals}/{teamBgoals}/{pom}/{noGoals}/{userId}")
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public String playQuiz(@PathParam("winner") String winner, @PathParam("teamAgoals") String teamAgoals, @PathParam("teamBgoals") String teamBgoals, 
			@PathParam("pom") String pom, @PathParam("noGoals") String noGoals, @PathParam("userId") String userId) {
		System.out.println("playQuiz");
		//return dao.playQuiz(winner, teamAgoals, teamBgoals, pom, noGoals, userId);
		return null;
	}
	
	@POST
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML})
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public Vote playQuiz(Vote vote) {
		System.out.println("creating playQuiz");
		return null;
	}
	
	@GET
	@Path("/register/{userId}")
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public String register(@PathParam("userId") String userId) {
		//System.out.println("getMatch");
		return dao.register(userId);
	}
	
	@GET
	@Path("/getUserHistory/{year}/{month}/{day}")
	public String getUserHistory(
			@PathParam("year") int year,
			@PathParam("month") int month, 
			@PathParam("day") int day) {
 
	   String date = year + "/" + month + "/" + day;
	   System.out.println(date);
 
	   return "cool";
 
	}
}
