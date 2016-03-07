package com.bulbul.wedeal.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.bulbul.wedeal.dao.WedealDAO;
import com.bulbul.wedeal.model.Bid;

@Path("/bid")
public class BidService {

	WedealDAO dao = new WedealDAO();

	@GET
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public List<Bid> getBids() {
		System.out.println("getBids-1");
		return dao.getBids();
	}
	
	@PUT
	@Path("/update")
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML})
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public Bid update(Bid bid) {
		System.out.println("Updating wine: " + bid.getName());
		return dao.update(bid);
		//return "Hello";
	}
}
