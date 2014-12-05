	$(document).ready(function () {
		$('#add-step').click(function () {
	      $('#step-input').show();
	      $(this).hide();
	      $('#save').hide();
	    });
	  $('#step-input-form').submit(function() {
      var $name = $(this).find('#name');
      var $description = $(this).find('#description');
      var step = $name.val();
			var stepdesc = $description.val();
      $name.val('');
			$description.val('');
      
      $('#steps > ol').append('<li><p class="step">' + step + '</p><p class="stepdesc">' + stepdesc + '</p></li>');

      $('#step-input').hide();
      $('#add-step').show();
      $('#save').show();

      return false;
    });
    $('#steps').on('click', '.step', function () {
      var step = $(this).text();
      console.log(step)
      if (!step) {
        return;
      }
    
 		  $(this).html('<input class="silent" type="text" name="step_input" value="' + step + '">');

      
    });
    

    $('#steps').on('click', '.stepdesc', function () {
      var stepdesc = $(this).text();
      if (!stepdesc) {
        return;
      }
      $(this).html('<input class="silent" type="text" name="step_input" value="' + stepdesc + '">');
     });
 
    $('#steps').on('keyup', 'input', function (e) {
      if (e.keyCode == 13) {
        var step = $(this).val();
        $(this).parent().html(step);
      }
     });
		//$('.main').blur(function(){
		//	var step = $(this > 'ul').val();
    //   $(this).parent().html(step);
		//});

		

		
		
		$('#save').on('click',function(){
			var stepsArray = [];

			$('li').each(function(){
				var step={};
			  step.name = $(this).find('.step').html();
			  step.description = $(this).find('.stepdesc').html();
			  step.step = $(this).index() + 1;
			  stepsArray.push(step);
			  console.log(stepsArray);

			});
		
			var set={
				instruction_set :{
				name : $('#setname').html(),
				description : $('#setdesc').html(),
				instructions_attributes : stepsArray}
			};
			console.dir(JSON.stringify(set));
			

			$.ajax({
      type: "PUT",
      url: 'http://localhost:3000/instruction_sets/'+ $('#setid').text(),
      data: JSON.stringify(set),
      contentType: 'application/json',
      dataType: 'json', // format of the response
      success: function() {
        alert( "Data Saved");
      }
			});
		});

		
		});