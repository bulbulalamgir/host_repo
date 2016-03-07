package com.bulbul.wedeal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.coenraets.cellar.Wine;

import com.bulbul.wedeal.model.Bid;
import com.kiran.fifa.dao.ConnectionHelper;


public class WedealDAO {

    public List<Bid> getBids() {
	List<Bid> list = new ArrayList<Bid>();
	Connection c = null;
	String sql = "SELECT * FROM bid";
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

    protected Bid processRow(ResultSet rs) throws SQLException {
	Bid bid = new Bid();
	bid.setId(rs.getInt("id"));
	bid.setName(rs.getString("name"));
	bid.setHighestBidAmount(rs.getString("highestBidAmount"));
	bid.setProxy(rs.getString("proxy"));
	bid.setUserId(rs.getString("userId"));
	
	return bid;
    }
    
    public Bid update(Bid bid) {
        Connection c = null;
        try {
            c = ConnectionHelper.getConnection();
            PreparedStatement ps = c.prepareStatement("UPDATE bid SET proxy=?, highestBidAmount=? WHERE id=?");
            ps.setString(1, bid.getProxy());
            ps.setString(2, bid.getHighestBidAmount());
            ps.setInt(3, bid.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
		} finally {
			ConnectionHelper.close(c);
		}
        return bid;
    }
    
}
