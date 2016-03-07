package com.kiran.fifa.model;

import java.util.HashMap;
import java.util.Map;

public enum Country {
	BRA("BRA", "BRAZIL", "A"),
	CRO("CRO", "CROATIA", "A"),
	MEX("MEX", "MEXICO", "A"),
	CAM("CAM", "CAMEROON", "A"),
	
	SPA("SPA", "SPAIN", "B"),
	NET("NET", "NETHERLANDS", "B"),
	CHE("CHE", "CHILE", "B"),
	AUS("AUS", "AUSTRALIA", "B"),
	
	COL("COL", "COLOMBIA", "C"),
	GRE("GRE", "GREECE", "C"),
	COT("COT", "COTE D'IVOIRE", "C"),
	JAP("JAP", "JAPAN", "C"),
	
	URU("URU", "URUGUAY", "D"),
	COS("COS", "COSTA RICA", "D"),
	ENG("ENG", "ENGLAND", "D"),
	ITA("ITA", "ITALY", "D"),
	
	SWI("SWI", "SWITZERLAND", "E"),
	ECU("ECU", "ECUADOR", "E"),
	FRA("FRA", "FRANCE", "E"),
	HON("HON", "HONDURAS", "E"),
	
	ARE("ARE", "ARGENTINA", "F"),
	BOS("BOS", "BOSNIA AND HERZEGOVINA", "F"),
	IRA("IRA", "IRAN", "F"),
	NIG("NIG", "NIGERIA", "F"),
	
	GER("GRE", "GERMANY", "G"),
	POR("POR", "PORTUGAL", "G"),
	GHA("GHA", "GHANA", "G"),
	USA("USA", "USA", "G"),
	
	BEL("BEL", "BELGIUM", "H"),
	ALG("ALG", "ALGERIA", "H"),
	RUS("RUS", "RUSSIA", "H"),
	KOR("KOR", "KOREA", "H");
 
    private String code;
    private String name;
    private String group;
 
    /**
     * A mapping between the integer code and its corresponding Countries to facilitate lookup by code.
     */
    private static Map<String, Country> codeToCountryMapping;
 
    private Country(String code, String name, String group) {
        this.code = code;
        this.name = name;
        this.group = group;
    }
 
    public static Country getCountry(String codeCode) {
        if (codeToCountryMapping == null) {
            initMapping();
        }
        return codeToCountryMapping.get(codeCode);
    }
 
    private static void initMapping() {
    	codeToCountryMapping = new HashMap<String, Country>();
        for (Country s : values()) {
        	codeToCountryMapping.put(s.code, s);
        }
    }
 
    public String getCode() {
        return code;
    }
 
    public String getName() {
        return name;
    }
 
    public String getGroup() {
        return group;
    }
 
    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder();
        sb.append("Country");
        sb.append("{code =").append(code);
        sb.append(", name ='").append(name).append('\'');
        sb.append(", group ='").append(group).append('\'');
        sb.append('}');
        return sb.toString();
    }
    
}
