<script src="/application/modules/User/externals/scripts/message_notififaction.js"></script>
<script>
<?php $viwer_id=Engine_Api::_()->user()->getViewer()->getIdentity(); 
    $useragent=$_SERVER['HTTP_USER_AGENT'];
    $iPod = stripos($_SERVER['HTTP_USER_AGENT'],"iPod");
    $iPhone = stripos($_SERVER['HTTP_USER_AGENT'],"iPhone");
    $iPad = stripos($_SERVER['HTTP_USER_AGENT'],"iPad");
    $Android = stripos($_SERVER['HTTP_USER_AGENT'],"Android");
    if( $iPod || $iPhone ||  $Android)  {
        $dev_type= 1; // mobile
    }
    else{
        $dev_type= 2; // system
    }


?>

var viewer_identity='<?php echo $viwer_id; ?>';	


	jQuery('#global_header').append('<div class="affix-top extra_header mob_bar_disable_particular_pages" data-spy="affix" data-offset-top="100">'+
	'<div id="global_content">'+
	'<div class="extra_header_content">'+	
	'<ul class="navigation">'+
    '<li class="active"><a href="rentalapplication/view">One Click Application</a></li>'+
    '<li><a href="property/requests">Submitted Application</a></li>'+
    '</ul>'+    
	'</div>'+
	'</div>'+
	'</div>');
	
		jQuery('.sub_header_dropdown').html(
                   '<select id = "sub_header_heding_select" class="input-box">'+
                   ' <option selected value="rentalapplication/view">One Click Application</option>'+
                   ' <option   value="property/requests">Submitted Applications</option>'+
                   ' </select>'
    );
    	jQuery(document).on('change','#sub_header_heding_select',function(){
		 location.href=jQuery('#sub_header_heding_select').val();
	});	
</script>


<div class="generic_layout_container layout_user_browse_menu" style="display: none;">
<div class="headline">
  <h2>
    </h2>
  <div class="tabs">
      </div>
</div>
</div>

<div class="property_list_content generic_layout_container layout_middle">

<div class="layput_middle_main_div">	
<?php /*
<div class="main_links">
<div class="link" style="color: #f58410;">ONE CLICK APPLICATION</div>
<div class="link"><a href="property/requests">Submitted Application</a></div>
<div class="link"><a href="property/requests/approved">Accepted Application</a></div>
</div>	 */ ?>


	<div id="application_content">
	
		<div class="application_btns_div">
		
	
   
	<div class="application_approve_reject_btns" style="float: right;">
  	
	</div>
	</div>
	<?php if($dev_type == 2):?> <!-- if not mobile device-->
	<div class="application_form_div ">
	
	<span class="application_sub_title">Applicant</span>
	<span class="application_edit" style="float:right;cursor:pointer;font-weight: 700;padding-bottom: 2px;" title="Edit">
		<a href="/rentalapplication/create" style="color: #333;"><img src="/application/modules/User/externals/images/edit_new.png"></a>
    </span>

	<div class="table-responsive ">
	
    <table class="table table-bordered ">
 
    <tr>     
    <th>Name of The Applicant</th>
    <th>Email</th>
    <th>Driver's License No</th>
    </tr>

    <tr>
    <td><?php echo $this->application->tenant_firstname ." ". $this->application->tenant_last_name;?></td>
    <td><?php echo $this->application->tenant_email;?> </td>
    <td><?php echo $this->application->driver_license_no;?></td>
    </tr>
    <tr>
     


    </table>
    </div>
    
    <span class="application_sub_title">Residence</span>
    
    <div class="table-responsive ">
    <table class="table table-bordered">
 
    <tr>     
    <th></th>
    <th>Current Residence</th>
    <th>Previous Residence</th>    
    </tr>
    
    <tr>
    <th>Housing Type</th>
    <td><?php echo $this->application->current_residence_housing_type;?></td>
    <td><?php echo $this->application->previous_residence_housing_type;?></td>
    </tr>
    
    <tr>
    <th>Current Address</th>
    <td><?php echo $this->application->current_residence_address;?></td>
    <td><?php echo $this->application->previous_residence_address;?></td>
    </tr>
    
    <tr>
    <th>Move In Date</th>
    <td><?php echo $this->application->current_residence_move_in_date;?></td>
    <td><?php echo $this->application->previous_residence_move_in_date;?></td>
    </tr>
    
    <tr>
    <th>Monthly Rent</th>
    <td><?php echo $this->application->current_residence_monthly_rent;?></td>
    <td><?php echo $this->application->previous_residence_monthly_rent;?></td>
    </tr>
    
    <tr>
    <th>Landlord Name</th>
    <td><?php echo $this->application->current_residence_landlordname;?></td>
    <td><?php echo $this->application->previous_residence_landlord_name;?></td>
    </tr>
    
    <tr>
    <th>Landlord Phone Number</th>
    <td><?php echo $this->application->current_residence_landlord_pno;?></td>
    <td><?php echo $this->application->previous_residence_landlord_pno;?></td>
    </tr>
    
    <tr>
    <th>Reason For Leaving</th>
    <td><?php echo $this->application->current_residence_leaving_reason;?></td>
    <td><?php echo $this->application->previous_residence_leaving_reason;?></td>
    </tr>
</table>
</div>


    <span class="application_sub_title">Occupation</span>
    
    <div class="table-responsive ">
    <table class="table table-bordered">
 
    <tr>     
    <th></th>
    <th>Current Occupation</th>
    <th>Previous Occupation</th>    
    </tr>
    
    <tr>
    <th>Status</th>
    <td><?php echo $this->application->current_occupation_status;?></td>
    <td><?php echo $this->application->previous_occupation_monthly_status;?></td>
    </tr>
    
    <tr>
    <th>Employer</th>
    <td><?php echo $this->application->current_occupation_employer;?></td>
    <td><?php echo $this->application->previous_occupation_employer;?></td>
    </tr>
    
    <tr>
    <th>Job Title</th>
    <td><?php echo $this->application->current_occupation_job_title;?></td>
    <td><?php echo $this->application->previous_occupation_job_title;?></td>
    </tr>
    
    <tr>
    <th>Monthly Salary</th>
    <td><?php echo $this->application->current_occupation_monthly_salary;?></td>
    <td><?php echo $this->application->previous_occupation_monthly_salary;?></td>
    </tr>
    
    <tr>
    <th>Work Type</th>
    <td><?php echo $this->application->current_occupation_work_type;?></td>
    <td><?php echo $this->application->previous_residence_landlord_name;?></td>
    </tr>
    
    <tr>
    <th>Manager's Name</th>
    <td><?php echo $this->application->current_occupation_manager_name;?></td>
    <td><?php echo $this->application->previous_occupation_manager_name;?></td>
    </tr>
    
    <tr>
    <th>Phone Number</th>
    <td><?php echo $this->application->current_occupation_pno;?></td>
    <td><?php echo $this->application->previous_occupation_pno;?></td>
    </tr>
    <tr>
		
    <th>Work Address</th>
    <td><?php echo $this->application->current_occupation_work_address;?></td>
    <td><?php echo $this->application->previous_occupation_work_address;?></td>
    </tr>
    
    <th>Start Date</th>
    <td><?php echo $this->application->current_occupation_start_date;?></td>
    <td></td>
    </tr>
    
    <th>End Date</th>
    <td></td>
    <td><?php echo $this->application->previous_occupation_end_date;?></td>
    </tr>
    
    <th>Income Source</th>
    <td><?php echo $this->application->current_occupation_income_source;?></td>
    <td><?php echo $this->application->previous_occupation_income_source;?></td>
    </tr>
    
    <th>Monthly Income</th>
    <td><?php echo $this->application->current_occupation_monthly_income;?></td>
    <td><?php echo $this->application->previous_occupation__monthly_income;?></td>
    </tr>
    </table>
	
	</div>
	
	<span class="application_sub_title">Additional Income</span>
	
	<div class="table-responsive ">
    <table class="table table-bordered">
 
    <tr>     
    <th>Additional Income Sources</th>
    <th>Amount</th>
    <th>Financial Summary</th>
    </tr>

    <tr>
    <td><?php echo $this->application->additional_income_sources;?> </td>
    <td><?php echo $this->application->additional_income_amount;?></td>
    <td><?php echo $this->application->total_monthly_income;?></td>
    </tr>
    <tr>

    </table>
    </div>
	
	<span class="application_sub_title">Personal Reference</span>
	
	<?php $personal_reference_json = json_decode($this->application->personal_reference_json); 
	$personal_reference_data = json_decode(json_encode($personal_reference_json),true);
	
	?>
	
	<div class="table-responsive">
	<table class="table table-bordered">
 
    <tr>     
    <th>Full Name</th>
    <th>Relationship</th>
    <th>Address</th>
    <th>Phone Number</th>
    </tr>
    
    <?php foreach($personal_reference_data as $refData):?>
    <tr>
    <td><?php echo $refData['personal_references_full_name'];?> </td>
    <td><?php echo $refData['personal_references_relationship'];?> </td>
    <td><?php echo $refData['personal_references_address'];?> </td>
    <td><?php echo $refData['personal_references_phone_no'];?> </td>
    </tr>
    <?php endforeach;?>
    <tr>

    </table>

    
    </div>
    

	<?php //print_r($this->applicationData);?>

    
    </div>
    <?php endif;?>
    
    <?php if($dev_type == 1):?> <!-- for mobile -->
    
    <div class="application_form_div ">
	
	<span class="application_head">Applicant</span>
	<span class="application_edit" style="float:right;cursor:pointer;font-weight: 700;padding-bottom: 2px;" title="Edit">
		<a href="/rentalapplication/create" style="color: #333;"><img src="/application/modules/User/externals/images/edit_new.png"></a>
    </span>
    
    <div class="application_head">Name of The Applicant</div>
    <div class="application_res"><?php echo $this->application->tenant_firstname ." ". $this->application->tenant_last_name;?></div>
    
    <div class="application_head">Email</div>
    <div class="application_res"><?php echo $this->application->tenant_email;?></div>
    <?php if($this->application->driver_license_no != ''):?>
    <div class="application_head">Driver's License No</div>
    <div class="application_res"><?php echo $this->application->driver_license_no;?></div>
    <?php endif;?>
    
    <?php if(($this->application->current_residence_housing_type != '') || ($this->application->current_residence_address != '')||
    ($this->application->current_residence_move_in_date !='') || ($this->application->current_residence_monthly_rent != '' )||
    ($this->application->current_residence_landlordname != '') || ($this->application->current_residence_landlord_pno != '') ||
    ($this->application->current_residence_leaving_reason != '') ):?>
    
    <div class="application_head">Current Residence	</div>
    <?php if($this->application->current_residence_housing_type != ''):?>
    <div class="application_head">Housing Type</div>
    <div class="application_res"><?php echo $this->application->current_residence_housing_type;?></div>
    <?php endif;?>
    <?php if($this->application->current_residence_address != ''):?>
    <div class="application_head">Current Address</div>
    <div class="application_res"><?php echo $this->application->current_residence_address;?></div>
    <?php endif;?>
    <?php if($this->application->current_residence_move_in_date != ''):?>
    <div class="application_head">Move In Date</div>
    <div class="application_res"><?php echo $this->application->current_residence_move_in_date;?></div>
    <?php endif;?>
    <?php if($this->application->current_residence_monthly_rent != ''):?>
    <div class="application_head">Monthly Rent	</div>
    <div class="application_res"><?php echo $this->application->current_residence_monthly_rent;?></div>
    <?php endif;?>
    <?php if($this->application->current_residence_landlordname != ''):?>
    <div class="application_head">Landlord Name	</div>
    <div class="application_res"><?php echo $this->application->current_residence_landlordname;?></div>
    <?php endif;?>
    <?php if($this->application->current_residence_landlord_pno != ''):?>
    <div class="application_head">Landlord Phone Number</div>
    <div class="application_res"><?php echo $this->application->current_residence_landlord_pno;?></div>
    <?php endif;?>
    <?php if($this->application->current_residence_leaving_reason != ''):?>
    <div class="application_head">Reason For Leaving</div>
    <div class="application_res"><?php echo $this->application->current_residence_leaving_reason;?></div>
    <?php endif;?>
     
    <?php endif;?>
    
    <?php if(($this->application->previous_residence_housing_type != '') || ($this->application->previous_residence_address != '')||
    ($this->application->previous_residence_move_in_date !='') || ($this->application->previous_residence_monthly_rent != '' )||
    ($this->application->previous_residence_landlord_name != '') || ($this->application->previous_residence_landlord_pno != '') ||
    ($this->application->previous_residence_leaving_reason != '') ):?>
    
    <div class="application_head">Previous Residence	</div>
    <?php if($this->application->current_residence_housing_type != ''):?>
    <div class="application_head">Housing Type</div>
    <div class="application_res"><?php echo $this->application->previous_residence_housing_type;?></div>
    <?php endif;?>
    <?php if($this->application->current_residence_address != ''):?>
    <div class="application_head">Current Address</div>
    <div class="application_res"><?php echo $this->application->previous_residence_address;?></div>
    <?php endif;?>
    <?php if($this->application->current_residence_move_in_date != ''):?>
    <div class="application_head">Move In Date</div>
    <div class="application_res"><?php echo $this->application->previous_residence_move_in_date;?></div>
    <?php endif;?>
    <?php if($this->application->current_residence_monthly_rent != ''):?>
    <div class="application_head">Monthly Rent	</div>
    <div class="application_res"><?php echo $this->application->previous_residence_monthly_rent;?></div>
    <?php endif;?>
    <?php if($this->application->current_residence_landlordname != ''):?>
    <div class="application_head">Landlord Name	</div>
    <div class="application_res"><?php echo $this->application->previous_residence_landlord_name;?></div>
    <?php endif;?>
    <?php if($this->application->current_residence_landlord_pno != ''):?>
    <div class="application_head">Landlord Phone Number</div>
    <div class="application_res"><?php echo $this->application->previous_residence_landlord_pno;?></div>
    <?php endif;?>
    <?php if($this->application->current_residence_leaving_reason != ''):?>
    <div class="application_head">Reason For Leaving</div>
    <div class="application_res"><?php echo $this->application->previous_residence_leaving_reason;?></div>
    <?php endif;?>
     
    <?php endif;?>
    
    <?php if(($this->application->current_occupation_status != '') || ($this->application->current_occupation_employer != '')||
    ($this->application->current_occupation_job_title !='') || ($this->application->current_occupation_monthly_salary != '') ||
    ($this->application->current_occupation_work_type != '') || ($this->application->current_occupation_manager_name != '') ||
    ($this->application->current_occupation_work_address != '') ||($this->application->current_occupation_start_date != '') ||
    ($this->application->current_occupation_income_source != '') || ($this->application->current_occupation_monthly_income != '')):?>
    
    <div class="application_head">Current Occupation	</div>
    <?php if($this->application->current_occupation_status != ''):?>
    <div class="application_head">Status</div>
    <div class="application_res"><?php echo $this->application->current_occupation_status;?></div>
    <?php endif;?>
    <?php if($this->application->current_occupation_employer != ''):?>
    <div class="application_head">Employer</div>
    <div class="application_res"><?php echo $this->application->current_occupation_employer;?></div>
    <?php endif;?>
    <?php if($this->application->current_occupation_job_title != ''):?>
    <div class="application_head">Job Title</div>
    <div class="application_res"><?php echo $this->application->current_occupation_job_title;?></div>
    <?php endif;?>
    <?php if($this->application->current_occupation_monthly_salary != ''):?>
    <div class="application_head">Monthly Salary</div>
    <div class="application_res"><?php echo $this->application->current_occupation_monthly_salary;?></div>
    <?php endif;?>
    <?php if($this->application->current_occupation_work_type != ''):?>
    <div class="application_head">Work Type</div>
    <div class="application_res"><?php echo $this->application->current_occupation_work_type;?></div>
    <?php endif;?>
    <?php if($this->application->current_occupation_manager_name != ''):?>
    <div class="application_head">Manager's Name</div>
    <div class="application_res"><?php echo $this->application->current_occupation_manager_name;?></div>
    <?php endif;?>
    <?php if($this->application->current_occupation_work_address != ''):?>
    <div class="application_head">Work Address</div>
    <div class="application_res"><?php echo $this->application->current_occupation_work_address;?></div>
    <?php endif;?>
    <?php if($this->application->current_occupation_start_date != ''):?>
    <div class="application_head">Start Date</div>
    <div class="application_res"><?php echo $this->application->current_occupation_start_date;?></div>
    <?php endif;?>
     <?php if($this->application->current_occupation_income_source != ''):?>
    <div class="application_head">Income Source</div>
    <div class="application_res"><?php echo $this->application->current_occupation_income_source;?></div>
    <?php endif;?>
    <?php if($this->application->current_occupation_monthly_income != ''):?>
    <div class="application_head">Monthly Income</div>
    <div class="application_res"><?php echo $this->application->current_occupation_monthly_income;?></div>
    <?php endif;?>
    
    <?php endif;?>
    
    <?php if(($this->application->previous_occupation_monthly_status != '') || ($this->application->previous_occupation_employer != '')||
    ($this->application->previous_occupation_job_title !='') || ($this->application->previous_occupation_monthly_salary != '') ||
    ($this->application->previous_occupation_work_type != '') || ($this->application->previous_occupation_manager_name != '') ||
    ($this->application->previous_occupation_work_address != '') ||($this->application->previous_occupation_end_date != '')||
    ($this->application->previous_occupation_income_source != '')||($this->application->previous_occupation__monthly_income != '') ):?>
    
    <div class="application_head">Previous Occupation	</div>
    <?php if($this->application->previous_occupation_monthly_status != ''):?>
    <div class="application_head">Status</div>
    <div class="application_res"><?php echo $this->application->previous_occupation_monthly_status;?></div>
    <?php endif;?>
    <?php if($this->application->previous_occupation_employer != ''):?>
    <div class="application_head">Employer</div>
    <div class="application_res"><?php echo $this->application->previous_occupation_employer;?></div>
    <?php endif;?>
    <?php if($this->application->previous_occupation_job_title != ''):?>
    <div class="application_head">Job Title</div>
    <div class="application_res"><?php echo $this->application->previous_occupation_job_title;?></div>
    <?php endif;?>
    <?php if($this->application->previous_occupation_monthly_salary != ''):?>
    <div class="application_head">Monthly Salary</div>
    <div class="application_res"><?php echo $this->application->previous_occupation_monthly_salary;?></div>
    <?php endif;?>
    <?php if($this->application->previous_occupation_work_type != ''):?>
    <div class="application_head">Work Type</div>
    <div class="application_res"><?php echo $this->application->previous_occupation_work_type;?></div>
    <?php endif;?>
    <?php if($this->application->previous_occupation_manager_name != ''):?>
    <div class="application_head">Manager's Name</div>
    <div class="application_res"><?php echo $this->application->previous_occupation_manager_name;?></div>
    <?php endif;?>
    <?php if($this->application->previous_occupation_work_address != ''):?>
    <div class="application_head">Work Address</div>
    <div class="application_res"><?php echo $this->application->previous_occupation_work_address;?></div>
    <?php endif;?>
    <?php if($this->application->previous_occupation_end_date != ''):?>
    <div class="application_head">End Date</div>
    <div class="application_res"><?php echo $this->application->previous_occupation_end_date;?></div>
    <?php endif;?>
    <?php if($this->application->previous_occupation_income_source != ''):?>
    <div class="application_head">Income Source</div>
    <div class="application_res"><?php echo $this->application->previous_occupation_income_source;?></div>
    <?php endif;?>
    <?php if($this->application->previous_occupation__monthly_income != ''):?>
    <div class="application_head">Monthly Income</div>
    <div class="application_res"><?php echo $this->application->previous_occupation__monthly_income;?></div>
    <?php endif;?>
    
    <?php endif;?>
   
   <?php if(($this->application->additional_income_sources != '' )|| ($this->application->additional_income_amount != '') ||
   ($this->application->total_monthly_income != '')):?>
    <div class="application_head">Additional Income	</div>
    <?php if($this->application->additional_income_sources != ''):?>
    <div class="application_head">Additional Income Sources</div>
    <div class="application_res"><?php echo $this->application->additional_income_sources;?></div>
    <?php endif;?>
    <?php if($this->application->additional_income_amount != ''):?>
    <div class="application_head">Amount</div>
    <div class="application_res"><?php echo $this->application->additional_income_amount;?></div>
    <?php endif;?>
    <?php if($this->application->total_monthly_income != ''):?>
    <div class="application_head">Financial Summary</div>
    <div class="application_res"><?php echo $this->application->total_monthly_income;?></div>
    <?php endif;?>
    
    <?php endif;?>

    <?php $personal_reference_json = json_decode($this->application->personal_reference_json); 
	$personal_reference_data = json_decode(json_encode($personal_reference_json),true);	
	?>
	<?php if($personal_reference_data[1]['personal_references_full_name'] != ''):?>
	<div class="application_head">Personal Reference	</div>
	<?php foreach($personal_reference_data as $refData):?>
	<?php if($refData['personal_references_full_name'] !=''):?>	
	<div class="application_head">Full Name</div>
    <div class="application_res"><?php echo $refData['personal_references_full_name'];?></div>
    <?php endif;?>
    <?php if($refData['personal_references_relationship'] !=''):?>	
	<div class="application_head">Relationship</div>	
    <div class="application_res"><?php echo $refData['personal_references_relationship'];?></div>
    <?php endif;?>
    <?php if($refData['personal_references_address'] !=''):?>	
	<div class="application_head">Address</div>
    <div class="application_res"><?php echo $refData['personal_references_address'];?></div>
    <?php endif;?>
    <?php if($refData['personal_references_phone_no'] !=''):?>
	<div class="application_head">Phone Number</div>
    <div class="application_res"><?php echo $refData['personal_references_phone_no'];?></div>
    <?php endif;?>
    <hr>
	<?php endforeach;?>
    <?php endif;?>
    
    </div>    
    <?php endif;?>    
	</div>


	</div>
    <div class="boxout_text" style="margin: 30px">Create your rental application that will be use to send to all landlords. You can come back and edit it anytime.</div>

    </div>

    <div id="stantard-dialogBox" style="font-size:30px"></div>

    
</div>	
