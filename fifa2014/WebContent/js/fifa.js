// The root URL for the RESTful services
var rootURL = "http://localhost:8080/cellar/rest/fifa";

var selectedFixture;

// Retrieve all fixtures when application starts
getFixtures();

function getFixtures() {
	$.ajax({
		type : 'GET',
		url : rootURL,
		dataType : "json", // data type of response
		success : renderList
	});
}

function renderList(data) {
	// JAX-RS serializes an empty list as null, and a 'collection of one' as an
	// object (not an 'array of one')
	var list = data == null ? [] : (data instanceof Array ? data : [ data ]);
	var row = '';
	var divText = '';
	divText += '<table width="100%" id="fixtures" border="0">';
	$.each(list,function(index, fixture) {
		divText += '<tr><td width="10%" style="vertical-align:middle;" align="right"><font size="4">'+ fixture.id +  '</font>';
		divText += '<input id="matchId_'+ fixture.id +'" name="matchId_'+ fixture.id +'" type="hidden" value="'+ fixture.matchId	+'"/></td>';
		divText += '<td width="90%"><b>' + fixture.team1	+ ' vs ' + fixture.team2 + '\n ';
		divText += '   ' + fixture.date + ' ' + fixture.time	+ ' ' + fixture.day + ' ' + fixture.group 	+ '</b></td></tr>';
	});
	divText += '</table>';
	$("#fixturesDiv").html(divText);
	$('#fixtures tr:odd').attr('class', 'odd');
	$('#fixtures tr:even').attr('class', 'even');
	
	$('#fixtures').find('tr').click( function(){
	  var row = $(this).find('td:first').text();
	  //alert('You clicked ' + $('#matchId_'+row).val());
	  getMatch($('#matchId_'+row).val());
	});
}

function getMatch(matchId) {
	$('#selectedMatch').val(matchId);
	$.ajax({
		type : 'GET',
		url : rootURL +'/matchId/'+matchId,
		dataType : "json", // data type of response
		data:{matchId:matchId},
		success : selectedMatch
	});
}

function selectedMatch(match){
	//alert(JSON.stringify(match));
	var divText = '';
	var $winner = $('#winner'); 
	$winner.find('option').remove(); 
	$winner.append('<option value="-1">--- SELECT ---</option>');
	$winner.append('<option value=' + match.teamA.code + '>' + match.teamA.name + '</option>');
	$winner.append('<option value=' + match.teamB.code + '>' + match.teamB.name + '</option>');
	
	var $pomTeam = $('#pomTeam'); 
	$pomTeam.find('option').remove(); 
	$pomTeam.append('<option value="-1">--- SELECT ---</option>');
	$pomTeam.append('<option value=' + match.teamA.code + '>' + match.teamA.name + '</option>');
	$pomTeam.append('<option value=' + match.teamB.code + '>' + match.teamB.name + '</option>');
	
	$('#spanTeamA').html(match.teamA.name);
	$('#spanTeamB').html(match.teamB.name);
	$('#matchVs').html('Match #'+match.id+' '+match.teamA.name+' Vs '+match.teamB.name);
	$('#teamAGoals').val('---SELECT---');
	$('#teamBGoals').val('---SELECT---');
	$('#nogoals').attr("checked" , false );
	var $pom = $('#pom'); 
	$pom.find('option').remove(); 
	$pom.append('<option value="-1">--- SELECT ---</option>');
}

function getPlayers() {
	var countryId = $('#pomTeam').val();
	$.ajax({
		type : 'GET',
		url : rootURL +'/countryId/'+countryId,
		dataType : "json", // data type of response
		data:{countryId:countryId},
		success : populatePlayers
	});
}

function populatePlayers(data) {
	// JAX-RS serializes an empty list as null, and a 'collection of one' as an
	// object (not an 'array of one')
	var list = data == null ? [] : (data instanceof Array ? data : [ data ]);
	var $pom = $('#pom'); 
	$pom.find('option').remove(); 
	$pom.append('<option value="-1">--- SELECT ---</option>');
	$.each(list,function(index, player) {
		$pom.append('<option value=' + player.playerId + '>' + player.playerName + '</option>');
	});
}

//Helper function to serialize all the form fields into a JSON string
function buildVote() {
	return JSON.stringify({
		"matchId": $('#selectedMatch').val(), 
		"winner": $('#winner').val(),
		"teamAgoals": $('#teamAGoals').val(),
		"teamBgoals": $('#teamBGoals').val(),
		"pom": $('#pom').val(),
		"noGoals": $('#nogoals').val(),
		"userId": $('#userId').val()
		});
}

function playQuiz() {
	console.log('playQuiz');
	alert(buildVote());
	$.ajax({
		type: 'POST',
		contentType: 'application/json',
		url: rootURL+'/vote',
		dataType: "json",
		data: buildVote(),
		success: function(data, textStatus, jqXHR){
			alert('VOTE casted successfully');
			quizSubmitted;
		},
		error: function(jqXHR, exception) {
            if (jqXHR.status === 0) {
                alert('Not connect.\n Verify Network.');
            } else if (jqXHR.status == 404) {
                alert('Requested page not found. [404]');
            } else if (jqXHR.status == 500) {
                alert('Internal Server Error [500].');
            } else if (exception === 'parsererror') {
                alert('Requested JSON parse failed.');
            } else if (exception === 'timeout') {
                alert('Time out error.');
            } else if (exception === 'abort') {
                alert('Ajax request aborted.');
            } else {
                alert('Uncaught Error.\n' + jqXHR.responseText);
            }
        }
		/*error: function(jqXHR, textStatus, errorThrown){
			alert('VOTE error: ' + textStatus);
			alert(jqXHR.status);
	        alert(errorThrown);
			
		}*/
	});
}

function playQuiz() {
	console.log('playQuiz');
	var matchId = $('#winner').val();
	$.ajax({
		type: 'GET',
		contentType: 'application/json',
		url : rootURL +'/getUserHistory/year/'+matchId+'/month/'+matchId+'/day/'+matchId,
		dataType: "json",
		success: function(data, textStatus, jqXHR){
			alert('VOTE casted successfully');
			quizSubmitted;
		},
		error: function(jqXHR, exception) {
            if (jqXHR.status === 0) {
                alert('Not connect.\n Verify Network.');
            } else if (jqXHR.status == 404) {
                alert('Requested page not found. [404]');
            } else if (jqXHR.status == 500) {
                alert('Internal Server Error [500].');
            } else if (exception === 'parsererror') {
                alert('Requested JSON parse failed.');
            } else if (exception === 'timeout') {
                alert('Time out error.');
            } else if (exception === 'abort') {
                alert('Ajax request aborted.');
            } else {
                alert('Uncaught Error.\n' + jqXHR.responseText);
            }
        }
		/*error: function(jqXHR, textStatus, errorThrown){
			alert('VOTE error: ' + textStatus);
			alert(jqXHR.status);
	        alert(errorThrown);
			
		}*/
	});
}


function playQuiz111() {
	var winner = $('#winner').val();
	var teamAGoals = $('#teamAGoals').val();
	var teamBGoals = $('#teamBGoals').val();
	var pom = $('#pom').val();
	var nogoals = $('#nogoals').val();
	var userId = $('#userId').val();
	alert(rootURL +'/playQuiz/'+winner+'/'+teamAGoals+'/'+teamBGoals+'/'+pom+'/'+nogoals+'/'+userId);
	$.ajax({
		type : 'GET',
		url : rootURL +'/playQuiz/'+winner+'/'+teamAGoals+'/'+teamBGoals+'/'+pom+'/'+nogoals+'/'+userId+'/'	,
		dataType : "json", // data type of response
		success : quizSubmitted
	});
}

function playQuiz1() {
	var selectedMatch = $('#selectedMatch').val();
	var winner = $('#winner').val();
	var teamAGoals = $('#teamAGoals').val();
	var teamBGoals = $('#teamBGoals').val();
	var pom = $('#pom').val();
	var nogoals = $('#nogoals').val();
	var userId = $('#userId').val();
	var league = $('#league').val();
	//alert(rootURL +'/playQuiz/'+selectedMatch+'/'+winner+'/'+teamAGoals+'/'+teamBGoals+'/'+pom+'/'+nogoals+'/'+userId+'/'+league+'/');
	//data: '{"selectedMatch": '+selectedMatch+', "winner": '+winner+', "teamAGoals": "'+teamAGoals+'", "teamBGoals": "'+teamBGoals+'", "pom": "'+pom+'", "nogoals": "'+nogoals+'", "userId": "'+userId+'", "league": "'+league+'"}',
	$.ajax({
		type : 'GET',
		url : rootURL +'/playQuiz/'+winner+'/'+teamAGoals+'/'+teamBGoals+'/'+pom+'/'+nogoals+'/'+userId+'/'+league,
		dataType: "JSON",
		success : quizSubmitted
	});
}

function quizSubmitted(data) {
	// JAX-RS serializes an empty list as null, and a 'collection of one' as an
	// object (not an 'array of one')
	alert(data);
}

function  showSignup() {
	//alert('ww');
	$('#signUpTab').attr('class', 'show');
	$('#loginTab').attr('class', 'hide');
	$('#loginLink').attr('class', 'show');
	$('#signUpLink').attr('class', 'hide');
}

function  showLogin() {
	$('#signUpTab').attr('class', 'hide');
	$('#loginTab').attr('class', 'show');
	$('#loginLink').attr('class', 'hide');
	$('#signUpLink').attr('class', 'show');
}

function register() {
	var userId = $('#userId').val();
	var password = $('#password').val();
	var email = $('#email').val();
	var mobile = $('#mobile').val();
	var league = $('#league').val();
	
	$.ajax({
		type : 'GET',
		url : rootURL +'/register/'+userId,
		dataType: "JSON",
		success : registered
	});
	
}

function registered(data) {
	// JAX-RS serializes an empty list as null, and a 'collection of one' as an
	// object (not an 'array of one')
	alert(data);
}