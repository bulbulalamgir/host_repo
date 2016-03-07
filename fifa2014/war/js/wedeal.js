// The root URL for the RESTful services
var rootURL = "http://localhost:8080/cellar/rest/bid";


getBids();
//setInterval(getBids, 500);
// Register listeners
$('#btnSearch').click(function() {
	getBids();
	return false;
});

function getBids() {
	console.log('getBids');
	alert("I am here...33");
	$.ajax({
		type: 'GET',
		url: rootURL,
		dataType: "json", // data type of response
		success: renderList
	});
}

function renderList(data) {
	// JAX-RS serializes an empty list as null, and a 'collection of one' as an object (not an 'array of one')
	var list = data == null ? [] : (data instanceof Array ? data : [data]);

	var rowNum = '0';
	$('#eventList tr').remove();
	$.each(list, function(index, bid) {
		$('#eventList').append('<tr><td id="id_+'+bid.id+'">' + bid.id +'</td>'+'<td id="name_'+bid.id+'">' +bid.name+'</td>'+
				'<td> <input type="text" id="highestBidAmount_'+bid.id +'"'+ 'value="'+bid.highestBidAmount +'"</input></td>'+
				'<td> <input type="text" id="proxy_'+bid.id +'"'+ 'value="'+bid.proxy +'"</input></td>'+
				'<td><a id="submit_'+bid.id +'" href="#"><img src="pics/hammer.jpg"/></a></td>'+
				'<td> <span id="timer_'+bid.id +'"' +'>05:00:00</span></td></tr>');
		//alert($('#timer_'+bid.id).text());		
		startBidTimer('#timer_'+bid.id);	
		$('#submit_'+bid.id).click(function(){
			//alert('FRESH');
			submitMe(bid.id);
		});

	});
	
	
}
function submitMe(id)
{
	//alert("I am here..."+id);
	$.ajax({
		type: 'PUT',
		contentType: 'application/json',
		url: rootURL + '/update',
		dataType: "json",
		data: formToJSON(id),
		success: function(data, textStatus, jqXHR){
			alert('Bid updated successfully');
			alert('DATA ID: ' + data.id);
			alert('DATA HighestBidAmount: ' + data.highestBidAmount);
			$('#highestBidAmount_'+data.id).val('');
			alert($('#highestBidAmount_'+data.id).val());
			$('#highestBidAmount_'+data.id).val(data.highestBidAmount);
			alert($('#highestBidAmount_'+data.id).val());
		},
		error: function(jqXHR, data, textStatus, errorThrown){
			
			alert('ERROR: ' + jqXHR.responseText);
		}
	});
}

//Helper function to serialize all the form fields into a JSON string
function formToJSON(bidId) {
	
	return JSON.stringify({
		"id": bidId == "" ? null : bidId, 
		"proxy": $('#proxy_'+bidId).val(),
		"highestBidAmount": $('#highestBidAmount_'+bidId).val()
		});
}

/**
 * Example 2 is similar to example 1.  The biggest difference
 * besides counting up is the ability to reset the timer to a
 * specific time.  To do this, there is an input text field
 * in a form.
 */
function startBidTimer(startId)
{
	var Example2 = new (function() {
	    var $countdown,
	        $form, // Form used to change the countdown time
	        incrementTime = 70,
	        currentTime = 60000,
	        updateTimer = function() {
	            $countdown.html(formatTime(currentTime));
	            if (currentTime == 0) {
	                Example2.Timer.stop();
	                timerComplete();
	                Example2.resetCountdown();
	                return;
	            }
	            currentTime -= incrementTime / 10;
	            if (currentTime < 0) currentTime = 0;
	        },
	        timerComplete = function() {
	            alert('Example 2: Countdown timer complete!');
	        },
	        init = function() {
	            $countdown = $(startId);
	            Example2.Timer = $.timer(updateTimer, incrementTime, true);
	            $form = $('#example2form');
	            $form.bind('submit', function() {
	                Example2.resetCountdown();
	                return false;
	            });
	        };
	    this.resetCountdown = function() {
	        var newTime = parseInt($form.find('input[type=text]').val()) * 100;
	        if (newTime > 0) {currentTime = newTime;}
	        this.Timer.stop().once();
	    };
	    //$(init);
	});
	
}

//Common functions
function pad(number, length) {
    var str = '' + number;
    while (str.length < length) {str = '0' + str;}
    return str;
}
function formatTime(time) {
    var min = parseInt(time / 6000),
        sec = parseInt(time / 100) - (min * 60),
        hundredths = pad(time - (sec * 100) - (min * 6000), 2);
    return (min > 0 ? pad(min, 2) : "00") + ":" + pad(sec, 2) + ":" + hundredths;
}


