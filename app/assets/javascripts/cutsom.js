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
      
      $('#steps > ol').append('<li><p class="step">' + step + '</p><p class="stepdesc">' + stepdesc + '</p><button id="delete">delete</button></li>');

      $('#step-input').hide();
      $('#add-step').show();
      $('#save').show();
      return false;
    });
    var stepHandler = function(e){
      e.stopPropagation();

      var step = $(this).text();

      //remove step handlers
      $('#steps').unbind('click');
      $('.step').unbind('click');
      $('.stepdesc').unbind('click');
      $('.stepList').unbind('click');
      $('.setdesc').unbind('click');

      
      
      $(this).html('<input class="silent" type="text" name="step_input" value="' +step+ '">');

      $(document).click(function(e){
        //$activeInput = $('#steps').find('input');
        //for some reason this does not work...

        if ($(e.target)[0] != $('.step').find('input')[0]){
          
          var step = $('.step').find('input').val();

          $('.step').find('input').parent().html(step);

          $(document).off('click');
          $('.step').on('click',stepHandler);
       }
       
        
      });
    };

        var descHandler = function(e){
      e.stopPropagation();

      var stepdesc = $(this).text();

      //remove step handlers
      $('#steps').unbind('click');
      $('.stepdesc').unbind('click');
      $('.stepList').unbind('click');
      $('.setdesc').unbind('click');
      $('.step').unbind('click');

      
      
      $(this).html('<input class="silent" type="text" name="stepdesc_input" value="' +stepdesc+ '">');

      $(document).click(function(e){
        //$activeInput = $('#steps').find('input');
        //for some reason this does not work...

        if ($(e.target)[0] != $('.stepdesc').find('input')[0]){
          
          var stepdesc = $('.stepdesc').find('input').val();

          $('.stepdesc').find('input').parent().html(stepdesc);

          $(document).off('click');
          $('.stepdesc').on('click', descHandler);
       }
       
        
      });
    };

    $('.step').on('click', stepHandler);

    $('.stepdesc').on('click', descHandler);

    $('#steps').on('keyup', 'input', function (e) {
      if (e.keyCode == 13) {
        var step = $(this).val();
        $(this).parent().html(step);
      }
    });

		 
    $('.delete').on('click',function(){
      var stepsArray = [];
    
      var step={};
      var $thisStep = $(this).parent();
      step.name = $thisStep.find('.step').html();
      step.id = $thisStep.find('#stepid').html();
      step.description = $thisStep.find('.stepdesc').html();
      step.step = $thisStep.index() + 1;
      step._destroy = 1;
    
      stepsArray.push(step);

      $(this).parent().remove();
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

		

		
		
		$('#save').on('click',function(){
			var stepsArray = [];

			$('li').each(function(){
				var step={};
        step.id = parseInt($(this).find('#stepid').html());
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